<?php
/**
 * Created by PhpStorm.
 * User: Dell-MILGIB
 * Date: 4/13/2019
 * Time: 8:45 PM
 */

namespace AppBundle\Form;


use Cron\CronBundle\Entity\CronJob;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class CronJobType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class,[
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Job name',
                    ]
            ])
            ->add('command', TextType::class,[
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'app:command',
                ]
            ])
            ->add('schedule', TextType::class,[
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => '*/8 * * * *',
                ]
            ])
            ->add('description', TextType::class,[
                'attr' => [
                    'class' => 'form-control',
                    'placeholder' => 'Job description',
                ]
            ])
            ->add('enabled', ChoiceType::class, [
                'choices'  => [
                    'Yes' => 1,
                    'No' => 0,
                ],
                'attr' => ['class' => 'form-control']
            ])
            ->add('create', SubmitType::class,[
                'attr' => ['class' => 'btn btn-primary pull-right']
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => CronJob::class,
        ]);
    }



}