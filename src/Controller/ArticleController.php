<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Categorie;
use App\Entity\Commentaire;
use App\Repository\ArticleRepository;
use App\Repository\CategorieRepository;
use App\Repository\CommentaireRepository;
use App\Repository\HashtagRepository;
use DateTimeImmutable;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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
        // dd($id);
        $article=$articleRepository->find($id);
        $commentaires=$article->getCommentaires();
        $idArticle = $article->getId();
        return $this->render('article/detail.html.twig', [
            'controller_name' => 'ArticleController',
            'article'=>$article,
            'commentaires'=>$commentaires,
            'idArticle'=> $idArticle    
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

     /**
     * @Route("/article/ajout/comment", name="ajout_comment", methods={"POST"})
     */
    public function AjoutComment(Request $request, CommentaireRepository $commentaireRepository ,ArticleRepository $articleRepository, EntityManagerInterface $em ): Response
    {
        $parent= $commentaireRepository->find($request->get('parent'));
        $message = $request->get('Message');
        $user = $this->getUser();
        $idArticle = $request->get('idArticle');
        $article= $articleRepository->find($idArticle);
        $comment = new Commentaire();
        $comment->setUtilisateur($user);
        $comment->setArticle($article);
        $comment->setContenu($message);
        $comment->setPublier(false);
        $comment->setParent($parent);
        $comment->setCreatedAt(new DateTimeImmutable('now'));

        //$parentId = $request->get('Message')->getData();
        //$parent = $em->getRepository(Commentaire::class)->find($parentId);
       // $comment->setParent($parent);

        $em->persist($comment);
        $em->flush();
        $titre= 'article';
        // return $this->render('article/detail.html.twig', [
        //     'controller_name' => 'ArticleController',
        //     'titre'=>$titre,
        //     'article'=>$article
        // ]);
        return $this->redirectToRoute("article_single",[
            'id'=> $idArticle
        ]);
    }
        /**
     * @Route("/article/hashtag/{label}", name="article_hashtag")
     */
    public function articleByHashtagAction(HashtagRepository $hashtagRepository, $label): Response
    {
        
        $articles=$hashtagRepository->findOneBy(['label'=>$label])->getArticles();
       $titre=$label;
        return $this->render('article/index.html.twig', [
            'controller_name' => 'ArticleController',
            'titre'=>$titre,
            'articles'=>$articles
        ]);
    }
     
}
