<?php

namespace AppBundle\Controller;

use Cron\CronBundle\Entity\CronReport;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class AdminCronJobReportController extends Controller
{
    /**
     * @Route("/admin/reports", name="list_cron_reports")
     */
    public function indexAction(Request $request)
    {

        $jobId = $request->get('job_id');

        $reportsAll = $this->getDoctrine()->getRepository(CronReport::class)->findAll();
        $cronReport = $this->getDoctrine()->getRepository(CronReport::class)->findBy([ "job" => $jobId ], ['runAt' => 'DESC']);

        return $this->render('/admin/reports/index.html.twig', [
            "reportsAll" => $reportsAll,
            "cronReport" => $cronReport,
        ]);
    }

}
