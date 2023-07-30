<?php

use App\Controllers\Pages\Academy\Vebinars;
use App\Controllers\Pages\Academy\VebinarsPage;
use App\Controllers\Pages\Admin\DealersPage;
use App\Controllers\Pages\Admin\NewsPage;
use App\Controllers\Pages\Admin\Tkp\TkpAutoController;
use App\Controllers\Pages\Admin\Tkp\TkpPlatformController;
use App\Controllers\Pages\Admin\Tkp\TkpUpdateController;
use App\Controllers\Pages\Admin\Tkp\TkpVagonController;
use App\Controllers\Pages\Catalog\CatalogController;
use App\Controllers\Pages\Catalog\ProductController;
use App\Controllers\Pages\Catalog\SearchController;
use App\Controllers\Pages\PageHelpers\SidebarController;
use App\Controllers\telegram\TelegramBot;
use App\Controllers\telegram\TelegramService;
use App\Controllers\Tkp\CreateTkpAuto;
use App\Controllers\Tkp\GetTkpAuto;
use App\Controllers\Tkp\GetTkpPlatform;
use App\Controllers\Tkp\GetTkpUpgradeBundle;
use App\Controllers\Tkp\GetTkpVagon;
use App\Controllers\UserController;
use App\Controllers\Utils\UploadImg;
use App\Models\Database;
use App\Utils\TwigExtension;
use Slim\App;
use Slim\Container;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

require __DIR__.'/../config/config.php';
require __DIR__.'/../vendor/autoload.php';

ini_set('display_errors', 'on'); // сообщения с ошибками будут показываться
error_reporting(E_ALL); // E_ALL - отображаем ВСЕ ошибки

$db = new Database();

$config = [
    'settings' => [
        'displayErrorDetails' => true
    ]
];

$container = new Container($config);
$app = new App($container);

$loader = new FilesystemLoader('../templates');
$view = new Environment($loader);

$authMiddleware = function ($request,$response,$next)
{
    $userAuth = UserController::checkUserAuth();
    if($userAuth) {
        if ($userAuth['redirect'] == 'none') {
            $response = $next($request, $response);
            return $response;
        }
        else
        {
            return $response->withStatus(302)->withHeader('Location', $userAuth['redirect']);
        }
    }
    else
    {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
};

$adminMiddleware = function ($request,$response,$next) {
    $userAuth = UserController::checkUserAuth();
    if($userAuth) {
        if($userAuth['admin_status']) {
            $response = $next($request, $response);
            return $response;
        } else {
            return $response->withStatus(302)->withHeader('Location', '/');
        }
    } else {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
};

//$view->addExtension(new TwigExtension());

$app->get('/',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();

    $vebinars = VebinarsPage::getVebinars('last');
    $body = $view->render("user/main.twig", [
        'title' => 'Главная',
        'headerName' => $headerName,
        'sidebar' => $sidebar,
        'vebinars' => $vebinars
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);

$app->get('/tkpcostruct',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $body = $view->render("user/tkpconstruct.twig", [
        'title' => 'Конструктор ТКП',
        'headerName' => $headerName,
        'sidebar' => $sidebar
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);


$app->get('/catalog',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $country = $userAuth['country'];
    $getParams = $request->getQueryParams();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $catalogData = CatalogController::getCategoriesAndProducts($getParams,$country);

    $body = $view->render("user/catalog.twig", [
        'title' => 'Каталог',
        'headerName' => $headerName,
        'sidebar' => $sidebar,
        'categories' => $catalogData['categories'],
        'products' => $catalogData['products'],
        'breadcrumbs' => $catalogData['breadcrumbs'],
        'last_crumb' => $catalogData['lastCrumb']
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);

$app->get('/search',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $country = $userAuth['country'];
    $getParams = $request->getQueryParams();
    $search = SearchController::getSearchResults($getParams,$country);
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();

    $body = $view->render("user/search.twig", [
        'title' => 'Поиск',
        'headerName' => $headerName,
        'sidebar' => $sidebar,
        'searchName' => $search['search'],
        'products' => $search['searchResult']
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);

$app->get('/products/{id}',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $productId = $args['id'];
    $headerName = $userAuth['name'];
    $country = $userAuth['country'];
    $sidebar = SidebarController::getSidebar();

    $productData = ProductController::getProduct($productId,$country);

    $body = $view->render("user/product.twig", [
        'title' => 'Каталог',
        'headerName' => $headerName,
        'sidebar' => $sidebar,
        'product' => $productData['product'],
        'breadcrumbs' => $productData['breadcrumbs'],
        'lust_crumb' => $productData['lust_crumb']
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);

$app->get('/orders',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $body = $view->render("user/orders.twig", [
        'title' => 'Мои заказы',
        'headerName' => $headerName,
        'sidebar' => $sidebar
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);

$app->get('/news',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $body = $view->render("user/news.twig", [
        'title' => 'Новости',
        'headerName' => $headerName,
        'sidebar' => $sidebar
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);



$app->group('/academy',function () use ($app,$view){
    $app->get('',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/academy/academy.twig", [
            'title' => 'Академия метра',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/presentations',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/academy/presentations.twig", [
            'title' => 'Презентации',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/vebinars',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();

        $vebinars = VebinarsPage::getVebinars('all');
        $body = $view->render("user/academy/vebinars.twig", [
            'title' => 'Вебинары',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'vebinars' => $vebinars
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/vebinars/{id}',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $vebinar = VebinarsPage::getVebinarById($args['id']);
        $body = $view->render("user/academy/vebinar-page.twig", [
            'title' => $vebinar['title'],
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'vebinar' => $vebinar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/presentations/{id}',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();

        $body = $view->render("user/academy/presentation-page.twig", [
            'title' => 'Видео с производства',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
        ]);
        $response->getBody()->write($body);
        return $response;
    });
})->add($authMiddleware);

$app->group('/addmaterials',function () use ($app,$view){
    $app->get('',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/addmaterials.twig", [
            'title' => 'Доп.материалы',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/sertificates',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/sertificates.twig", [
            'title' => 'Сертификаты и описания типа',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/check-lists',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/opros-lists.twig", [
            'title' => 'Опросные листы',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/promo-materials',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/promo-materials.twig", [
            'title' => 'Рекламные материалы',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/promo-photos',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/foto-productions.twig", [
            'title' => 'Фото продукции',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/faq',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();
        $body = $view->render("user/add-materials/faq.twig", [
            'title' => 'Часто задаваемые вопросы',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });
})->add($authMiddleware);

$app->group('/admin',function () use ($app,$view){
    $app->get('',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/main.twig", [
            'title' => 'Дашборд',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/banners',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/banners.twig", [
            'title' => 'Баннеры',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/dealers',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $users = DealersPage::getAllUsers();
        print_r($users);
        $body = $view->render("admin/dealers.twig", [
            'title' => 'Диллеры',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'users' => $users
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/dealer-clients',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/clients.twig", [
            'title' => 'Клиенты диллеров',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/authorization',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/authorize.twig", [
            'title' => 'Авторизация сделок',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/news',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $news = NewsPage::getListNews();
        $body = $view->render("admin/news.twig", [
            'title' => 'Новости',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'news' => $news
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/new-news',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/create-news.twig", [
            'title' => 'Создать новость',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/tkp-editor.twig", [
            'title' => 'Редактор ТКП',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/auto',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpAutoController::getAllTkpAuto();
        $body = $view->render("admin/tkp-pages/automobile.twig", [
            'title' => 'Редактор ТКП Авто',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/auto/{id}',function (Request $request,Response $response, array $args) use ($view){
        $tkpId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpData = TkpAutoController::getTkpId($tkpId);
        print_r($tkpData);
        $body = $view->render("admin/tkp-pages/automobile-edit.twig", [
            'title' => 'Редактор ТКП Авто',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpData' => $tkpData
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/vagon',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpVagonController::getAllTkpVagon();
        $body = $view->render("admin/tkp-pages/vagon.twig", [
            'title' => 'Редактор ТКП Вагоны',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/platform',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpPlatformController::getAllTkpPlatform();
        $body = $view->render("admin/tkp-pages/platform.twig", [
            'title' => 'Редактор ТКП Платформы',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/update',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpUpdateController::getAllTkpUpdate();
        $body = $view->render("admin/tkp-pages/update.twig", [
            'title' => 'Редактор ТКП Обновления',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });


    $app->get('/presentations',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/presentations.twig", [
            'title' => 'Презентации',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/faq',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/faq.twig", [
            'title' => 'FAQ',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/vebinars',function (Request $request,Response $response, array $args) use ($view){
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/vebinars.twig", [
            'title' => 'Вебинары',
            'headerName' => $headerName,
            'sidebar' => $sidebar
        ]);
        $response->getBody()->write($body);
        return $response;
    });
})->add($adminMiddleware);


$app->get('/clients',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $body = $view->render("user/clients.twig", [
        'title' => 'Мои клиенты',
        'headerName' => $headerName,
        'sidebar' => $sidebar
    ]);
    $response->getBody()->write($body);
    return $response;
})->add($authMiddleware);



//Страница для телеграм бота
$app->post('/telegram-bot',function (Request $request,Response $response, array $args) use ($view){
    $params = $request->getParsedBody();
    $telegramService = new TelegramService(tokenTelegram,$params);
    $telegramBot = new TelegramBot($telegramService,$params);
    $telegramBot->startService();
    $response->getBody()->write('');
});





//Общие страницы: Авторизация, регистрация, восстановление пароля и т.д
$app->get('/auth',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $body = $view->render("$folder/AuthForm.twig", [
        'title' => 'Авторизация',
    ]);
    $response->getBody()->write($body);
});

$app->get('/register',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $body = $view->render("$folder/RegisterForm.twig", [
        'title' => 'Регистрация',
    ]);
    $response->getBody()->write($body);
});

$app->get('/confirm',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $getParams = $request->getQueryParams();
    $mail = $getParams['mail'];
    $body = $view->render("$folder/ConfirmMail.twig", [
        'title' => 'Подтверждение почты',
        'mail' => $mail
    ]);
    $response->getBody()->write($body);
});

$app->get('/restore',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $body = $view->render("$folder/RestorePage.twig", [
        'title' => 'Восстановление пароля',
        'pageText' => 'На вашу почту будет отправлена ссылка на сброс пароля'
    ]);
    $response->getBody()->write($body);
});

$app->get('/restorePass',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $getParams = $request->getQueryParams();

    $userInfo = UserController::getDataFromToken($getParams);

    if($userInfo)
    {
        $body = $view->render("$folder/RestorePass.twig", [
            'title' => 'Восстановление пароля',
            'text' => 'Введите новый пароль для логина: '.$userInfo['mail']
        ]);

        $response->getBody()->write($body);
        return $response;
    }
    else
    {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
});

$app->get('/awaitPage',function (Request $request,Response $response, array $args) use ($view){
    $folder = 'common';
    $body = $view->render("$folder/AwaitPage.twig", [
        'title' => 'Восстановление пароля',
        'pageText' => 'На вашу почту будет отправлена ссылка на сброс пароля'
    ]);
    $response->getBody()->write($body);
});



//Методы для служебных страниц
$app->post('/authUser',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $controllerResponse = UserController::authUser($params);
    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->post('/registerUser',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $controllerResponse = UserController::registerUser($params);
    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->post('/confirmMail',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $userResponse = UserController::checkConfirm($params['mail'],$params['code']);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/restoreMail',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $userResponse = UserController::restoreMail($params);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/restorePass',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $userResponse = UserController::restorePass($params);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/authorizeDealer',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    UserController::authorizeUser($params);
    $response->getBody()->write('');
    return $response;
});

$app->post('/uploadImg',function(Request $request,Response $response){
    $json = UploadImg::uploadImg();
    $response->getBody()->write($json);
    return $response;
});

$app->post('/createNews',function(Request $request,Response $response){
    $params = $request->getParsedBody();
    NewsPage::createNews($params);
    $response->getBody()->write('');
    return $response;
});


$app->post('/listTkp/{id}',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $typeTkp = $args['id'];
    if($typeTkp == 'auto')
    {
        $controllerResponse = GetTkpAuto::getTkpList($params);
    }

    if($typeTkp == 'vagon')
    {
        $controllerResponse = GetTkpVagon::getTkpList($params);
    }

    if($typeTkp == 'platform')
    {
        $controllerResponse = GetTkpPlatform::getTkpList($params);
    }

    if($typeTkp == 'upgrade-bundle')
    {
        $controllerResponse = GetTkpUpgradeBundle::getTkpList($params);
    }

    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->get('/getTkp/{id}',function (Request $request,Response $response, array $args) use ($view){
    $getParams = $request->getQueryParams();
    $typeTkp = $args['id'];
    CreateTkpAuto::createTkp($getParams,$typeTkp);
    $response->getBody()->write('');
});

$app->run();
