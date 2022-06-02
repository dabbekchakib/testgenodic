<?php

namespace App\Controller\Admin;

use App\Entity\Article;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
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
            TextEditorField::new('description'),
            ImageField::new('fichier')
            ->setBasePath('uploads/articles/')
            ->setUploadDir('public/uploads/articles/')
            ->setFormType(FileUploadType::class)
            ->setUploadedFileNamePattern('[randomhash].[extension]'),
            //TextField::new('fichier')->setFormType(FileType::class),
            DateField::new('createdAt'),
            TextField::new('auteur')
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
