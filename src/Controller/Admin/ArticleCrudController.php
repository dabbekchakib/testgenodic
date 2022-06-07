<?php

namespace App\Controller\Admin;

use App\Entity\Article;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AvatarField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;
use EasyCorp\Bundle\EasyAdminBundle\Form\Type\FileUploadType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class ArticleCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Article::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [

            
            TextField::new('titre'),
            ImageField::new('image')
                ->setBasePath('uploads/articles/images')
                ->setUploadDir('public/uploads/articles/images/')
                ->setUploadedFileNamePattern('[randomhash].[extension]'),
            TextEditorField::new('description'),
            ImageField::new('fichier')
                ->onlyOnForms()
                ->setBasePath('uploads/articles/')
                ->setUploadDir('public/uploads/articles/')
                ->setFormType(FileUploadType::class)
                ->setFormTypeOptions([
                    'attr' => [
                        'accept' => 'application/pdf'
                    ]
                ])
                ->setUploadedFileNamePattern('[randomhash].[extension]'),
            UrlField::new('fichier')
                ->onlyOnIndex(),

            AssociationField::new("categorie"),
            TextField::new('auteur'),
            DateField::new('createdAt')
        ];
    }

    /*   public function configureFilters(Filters $filters): Filters
    {
        return $filters
            ->add('titre')
            ->add('auteur')
        ;
    } */
}
