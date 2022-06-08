<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Repository\ArticleRepository;
use App\Repository\CategorieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ArticleController extends AbstractController
{
    /**
     * @Route("/article", name="app_article")
     */
    public function index(ArticleRepository $articleRepository): Response
    {
        $titre='Articles';
        $articles=$articleRepository->findAll();
        return $this->render('article/index.html.twig', [
            'controller_name' => 'ArticleController',
            'titre'=>$titre,
            'articles'=>$articles
        ]);
    }
    /**
     * @Route("/article/{id}", name="article_single")
     */
    public function articleByIdAction(ArticleRepository $articleRepository, $id): Response
    {
        $article=$articleRepository->find($id);
        $commentaires=$article->getCommentaires();
        return $this->render('article/detail.html.twig', [
            'controller_name' => 'ArticleController',
            'article'=>$article,
            'commentaires'=>$commentaires
        ]);
    }
    /**
     * @Route("/article/categorie/{categorie}", name="article_categorie")
     */
    public function articleByCategoryAction(CategorieRepository $categorieRepository,$categorie): Response
    {
        $categorie=$categorieRepository->find($categorie);
        $childCats=$categorieRepository->findBy(['parent'=>$categorie->getId()]);
        $articles=$categorie->getArticles();
        foreach ($childCats as $cat) {
            $child_articles=$cat->getArticles();
            foreach ($child_articles as $article) {
                $articles[]=$article;
            }
        }
       $titre=$categorie->getLabel();
        return $this->render('article/index.html.twig', [
            'controller_name' => 'ArticleController',
            'titre'=>$titre,
            'articles'=>$articles
        ]);
    }
}
