<?php

namespace App\Controller\Admin;

use App\Entity\Commentaire;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class CommentaireCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Commentaire::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [

            AssociationField::new("utilisateur"),
            AssociationField::new("article"),
            TextEditorField::new('contenu'),
            BooleanField::new("publier"),
            DateField::new("createdAt", "Crée le")->hideOnForm(),
        ];
    }
    public function persistEntity(EntityManagerInterface $entityManager, $entityInstance): void
    {
        if (!$entityInstance instanceof Commentaire) return;
        $date= new DateTimeImmutable("now");
        $entityInstance->setCreatedAt($date);
        //dd($entityInstance);
        parent::persistEntity($entityManager, $entityInstance);
       // $entityManager->persist($entityInstance);
       // $entityManager->flush();
    }

}
