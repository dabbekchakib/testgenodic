<?php

namespace App\Controller;

use App\Repository\CategorieRepository;
use App\Repository\MediaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MediaController extends AbstractController
{
    /**
     * @Route("/media", name="app_media")
     */
    public function index(MediaRepository $mediaRepository): Response
    {
        $medias=$mediaRepository->findAll();
        return $this->render('media/index.html.twig', [
            'controller_name' => 'MediaController',
            'medias' => $medias
        ]);
    }
    /**
     * @Route("/media/presse", name="presse")
     */
    public function presseAction(MediaRepository $mediaRepository, CategorieRepository $categorieRepository): Response
    {
        $medias=$categorieRepository->findOneBy(array('label'=>'Presse'))->getMedia();
       
        return $this->render('media/index.html.twig', [
            'controller_name' => 'MediaController',
            'medias' => $medias
        ]);
    }
    /**
     * @Route("/media/temoignages", name="temoignages")
     */
    public function temoignagesAction(MediaRepository $mediaRepository, CategorieRepository $categorieRepository): Response
    {
        $medias=$categorieRepository->findOneBy(array('label'=>'Temoignages'))->getMedia();
       
        return $this->render('media/index.html.twig', [
            'controller_name' => 'MediaController',
            'medias' => $medias
        ]);
    }
    /**
     * @Route("/media/reportages", name="reportages")
     */
    public function reportagesAction(MediaRepository $mediaRepository, CategorieRepository $categorieRepository): Response
    {
        $medias=$categorieRepository->findOneBy(array('label'=>'Reportages'))->getMedia();
       
        return $this->render('media/index.html.twig', [
            'controller_name' => 'MediaController',
            'medias' => $medias
        ]);
    }
}
