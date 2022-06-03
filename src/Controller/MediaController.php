<?php

namespace App\Controller;

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
        foreach ($medias as $media) {
            $media->setVideoUrl(substr($media->getVideoUrl(),17));
        }
        return $this->render('media/index.html.twig', [
            'controller_name' => 'MediaController',
            'medias' => $medias
        ]);
    }
}
