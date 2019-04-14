<?php

namespace AppBundle\Controller;

use Cron\Cron;
use Cron\CronBundle\Entity\CronJob;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->redirectToRoute('list_cron_jobs');
    }

    /**
     * @Route("/test", name="test")
     */
    public function testAction(Request $request)
    {

        $cron = new CronJob();
        $cron->setName("Test 2");
        $cron->setCommand("touch /vagrant/cron-app/web/test-file.txt");
        $cron->setDescription("test-file.txt");
        $cron->setSchedule("*/2 * * * *");
        $cron->setEnabled(1);

        $em = $this->getDoctrine()->getManager();
        $em->persist($cron);
        $em->flush();
        die;
    }
}
