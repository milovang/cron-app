<?php

namespace AppBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;

class CronShellCommandCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('cron:shell:command')
            ->setDescription('...')
            ->addOption('script', null, InputOption::VALUE_REQUIRED, 'Add your script as option to ')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {

        if ($input->getOption('script')) {

            $script = $input->getOption('script');
            $process = new Process(['/usr/bin/php', $script]);
            $process->run();

            if (!$process->isSuccessful()) {
                throw new ProcessFailedException($process);
            }

            $output->writeln($process->getOutput());
            $output->writeln("Done");

        }

    }

}
