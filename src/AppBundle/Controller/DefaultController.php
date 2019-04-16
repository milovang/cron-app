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
        die;
    }
}
