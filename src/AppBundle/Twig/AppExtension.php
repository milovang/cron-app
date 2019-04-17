<?php
/**
 * Created by PhpStorm.
 * User: Dell-MILGIB
 * Date: 4/17/2019
 * Time: 7:24 PM
 */

namespace AppBundle\Twig;
use Twig\Extension\AbstractExtension;
use Twig\TwigFunction;


class AppExtension extends AbstractExtension
{

    public function getFunctions()
    {
        return [
            new TwigFunction('calculateArraySize', [$this, 'calculateArraySize']),
        ];
    }

    public function calculateArraySize($array)
    {
        return count($array);
    }

}