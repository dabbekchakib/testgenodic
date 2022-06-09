<?php

namespace App\Controller\Admin;

use App\Entity\Article;
use App\Entity\Categorie;
use App\Entity\Commentaire;
use App\Entity\Media;
use App\Entity\Site;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\UserMenu;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Security\Core\User\UserInterface;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        //return parent::index();
        return $this->render('dashboard.html.twig', [
            'dashboard_controller_filepath' => (new \ReflectionClass(static::class))->getFileName(),
            'dashboard_controller_class' => (new \ReflectionClass(static::class))->getShortName(),
        ]);
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Genodicsnet');
    }

    public function configureMenuItems(): iterable
    {
        $admin=in_array('ROLE_ADMIN', $this->getUser()->getRoles(), true);
        
        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home')->setPermission('ROLE_USER');
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-user', User::class)->setPermission('ROLE_ADMIN');
        yield MenuItem::linkToCrud('Articles', 'fa fa-file-text', Article::class)->setPermission('ROLE_ADMIN');
        yield MenuItem::linkToCrud('Categories', 'fa fa-tags', Categorie::class)->setPermission('ROLE_ADMIN');
            
       yield MenuItem::linkToCrud('Commentaires', 'fas fa-comment', Commentaire::class)->setPermission('ROLE_USER');
       
        yield MenuItem::linkToCrud('Media', 'fas fa-video', Media::class)->setPermission('ROLE_ADMIN');
        yield MenuItem::linkToCrud('Site', 'fas fa-globe', Site::class)->setPermission('ROLE_ADMIN');
        yield MenuItem::linkToLogout('Déconnecter', 'fa fa-sign-out')->setPermission('ROLE_USER');
    
    }
    public function configureUserMenu(UserInterface $user): UserMenu
    {
      return parent::configureUserMenu($user)
            ->setAvatarUrl('uploads/users/'.$user->getPhoto())
            ->displayUserAvatar(true);
           // ->setGravatarEmail($user->getEmail())

    }
}
