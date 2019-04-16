<?php

namespace AppBundle\Controller;

use AppBundle\Form\CronJobType;
use Cron\Cron;
use Cron\CronBundle\Entity\CronJob;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class AdminCronJobController extends Controller
{
    /**
     * @Route("/admin/", name="list_cron_jobs")
     */
    public function indexAction(Request $request)
    {
        //find all cron jobs
        $cronJobs = $this->getDoctrine()->getRepository(CronJob::class)->findAll();

        return $this->render('admin/cronjobs/index.html.twig', [
            "cronJobs" => $cronJobs,
        ]);
    }

    /**
     * @Route("/admin/add-new", name="add_cron_job")
     */
    public function createAction(Request $request)
    {

        $cronJob = new CronJob();

        $form = $this->createForm(CronJobType::class, $cronJob);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $job = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($job);
            $entityManager->flush();

            $this->addFlash('success', 'Job successfully created!');
            return $this->redirectToRoute('list_cron_jobs');
        }

        return $this->render('admin/cronjobs/add.html.twig', [
            "form" => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/{id}/edit", name="edit_cron_job")
     */
    public function editAction(Request $request, CronJob $cronJob)
    {

        $form = $this->createForm(CronJobType::class, $cronJob);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $job = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($job);
            $entityManager->flush();

            $this->addFlash('success', 'Job successfully updated!');
            return $this->redirectToRoute('list_cron_jobs');
        }

        return $this->render('admin/cronjobs/edit.html.twig', [
            "form" => $form->createView(),
            "cron" => $cronJob
        ]);
    }

    /**
     * @Route("/admin/{id}/delete", name="delete_cron_job")
     */
    public function deleteAction(Request $request, $id)
    {

        $entityManager = $this->getDoctrine()->getManager();
        $cronJob = $this->getDoctrine()->getRepository(CronJob::class)->find($id);
        $entityManager->remove($cronJob);
        $entityManager->flush();

        $this->addFlash('success', 'Job successfully deleted!');
        return $this->redirectToRoute('list_cron_jobs');


    }
}
