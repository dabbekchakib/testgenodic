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
        return parent::index();
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Genodicsnet');
    }

    public function configureMenuItems(): iterable
    {
        $admin=in_array('ROLE_ADMIN', $this->getUser()->getRoles(), true);
        if ($admin) {
            yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
            yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-user', User::class);
            yield MenuItem::linkToCrud('Articles', 'fa fa-file-text', Article::class);
            yield MenuItem::linkToCrud('Categories', 'fa fa-tags', Categorie::class);
            
        }
       yield MenuItem::linkToCrud('Commentaires', 'fas fa-comment', Commentaire::class);
       if ($admin) {
        yield MenuItem::linkToCrud('Media', 'fas fa-video', Media::class);
        yield MenuItem::linkToCrud('Site', 'fas fa-globe', Site::class);
    } 
    }
    public function configureUserMenu(UserInterface $user): UserMenu
    {
      return parent::configureUserMenu($user)
            ->setAvatarUrl('uploads/users/'.$user->getPhoto())
            ->displayUserAvatar(true);
           // ->setGravatarEmail($user->getEmail())

    }
}
