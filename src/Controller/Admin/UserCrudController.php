<?php

namespace App\Controller\Admin;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserCrudController extends AbstractCrudController
{
    private $passwordHasher;
 
    
    public static function getEntityFqcn(): string
    {
        return User::class;
    }
    public function __construct(UserPasswordHasherInterface $passwordHasher)
    {
        $this->passwordHasher = $passwordHasher;
    }
   
    public function configureFields(string $pageName): iterable
    {
        return [
           // IdField::new('id'),
            EmailField::new('email'),
            TextField::new('password')->setFormType(PasswordType::class),
            TextField::new('nom'),
            TextField::new('prenom'),
            ChoiceField::new('roles')
            ->allowMultipleChoices()
            ->setChoices([
                'Administrateur' => 'ROLE_ADMIN',
                'Utilisateur' => 'ROLE_USER',
            ]),
           
        ];
    }
    /*   public function persistEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        if (!$entityInstance instanceof User) return;
        $entityInstance->setPassword($this->passwordHasher->hashPassword($entityInstance, $entityInstance->getPassword()));
        //dd($entityInstance);
        parent::persistEntity($entityManager, $entityInstance);
       // $entityManager->persist($entityInstance);
       // $entityManager->flush();
    }
    public function updateEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        if (!$entityInstance instanceof User) return;
        $entityInstance->setPassword($this->passwordHasher->hashPassword($this, $entityInstance->getPassword()));
        //dd($entityInstance);
        parent::updateEntity($entityManager, $entityInstance);
       // $entityManager->persist($entityInstance);
       // $entityManager->flush();
    }  */
   
}
