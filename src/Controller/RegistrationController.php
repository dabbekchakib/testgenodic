<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Security\UserAuthenticator;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, 
                            UserAuthenticatorInterface $userAuthenticator, UserAuthenticator $authenticator,
                             EntityManagerInterface $entityManager): Response
    {
       
        $user = new User();
        
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            
            
            $nom= $form->get('nom')->getData();
        $prenom= $form->get('prenom')->getData();
        $user->setNom((string)$nom);
        $user->setPrenom((string)$prenom);
         $photo=   $form->get('photo');
         $newImg= new File($user->getPhoto());
         $nomImg= md5(uniqid()).'.'.$newImg->guessExtension();
         $newImg->move("uploads/users/", $nomImg);
         $user->setPhoto($nomImg);
            $user->setRoles(['ROLE_USER']);
            $user->setPassword(
            $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            
            $entityManager->persist($user);
            $entityManager->flush();
            // do anything else you need here, like send an email

            // return $userAuthenticator->authenticateUser(
            //     $user,
            //     $authenticator,
            //     $request
            // );
            
            $this->addFlash('success', 'Votre inscription est validée. Connectez-vous à présent !');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
            'titre' => 'Inscription'
        ]);
    }
}
