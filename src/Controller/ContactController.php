<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Address;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="app_contact")
     */
    public function index(): Response
    {
        return $this->render('contact/index.html.twig', [
            'controller_name' => 'ContactController',
        ]);
    }
    /**
     * @Route("/sendmail", name="sendmail", methods={"POST"})
     */
    public function sendmailAction(Request $request, MailerInterface $mailer): Response
    {
        //dd($request);
        $email = (new Email())
            ->from(new Address($request->get('Email'), $request->get('nomPrenom')))
            ->to('contact@genodics.net')
            ->subject($request->get('Subject'))
            ->text($request->get('Message'));
        $mailer->send($email);
        //dd($mailer);
        return $this->render('contact/index.html.twig', [
            'controller_name' => 'Contact',
            'msg' => 'E-mail envoyée avec succées'
        ]);
    }
}
