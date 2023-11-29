<?php

use App\Controllers\Pages\Academy\Vebinars;
use App\Controllers\Pages\Academy\VebinarsPage;
use App\Controllers\Pages\Admin\BannerPage;
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

require __DIR__ . '/../config/config.php';
require __DIR__ . '/../vendor/autoload.php';

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

$authMiddleware = function ($request, $response, $next) {
    $userAuth = UserController::checkUserAuth();
    if ($userAuth) {
        if ($userAuth['redirect'] == 'none') {
            $response = $next($request, $response);
            return $response;
        } else {
            return $response->withStatus(302)->withHeader('Location', $userAuth['redirect']);
        }
    } else {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
};

$adminMiddleware = function ($request, $response, $next) {
    $userAuth = UserController::checkUserAuth();
    if ($userAuth) {
        if ($userAuth['admin_status']) {
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

$app->get('/', function (Request $request, Response $response, array $args) use ($view) {
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

$app->get('/tkpcostruct', function (Request $request, Response $response, array $args) use ($view) {
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


$app->get('/catalog', function (Request $request, Response $response, array $args) use ($view) {
    $userAuth = UserController::checkUserAuth();
    $country = $userAuth['country'];
    $getParams = $request->getQueryParams();
    $headerName = $userAuth['name'];
    $sidebar = SidebarController::getSidebar();
    $catalogData = CatalogController::getCategoriesAndProducts($getParams, $country);

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

$app->get('/search', function (Request $request, Response $response, array $args) use ($view) {
    $userAuth = UserController::checkUserAuth();
    $country = $userAuth['country'];
    $getParams = $request->getQueryParams();
    $search = SearchController::getSearchResults($getParams, $country);
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

$app->get('/products/{id}', function (Request $request, Response $response, array $args) use ($view) {
    $userAuth = UserController::checkUserAuth();
    $productId = $args['id'];
    $headerName = $userAuth['name'];
    $country = $userAuth['country'];
    $sidebar = SidebarController::getSidebar();

    $productData = ProductController::getProduct($productId, $country);

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

$app->get('/orders', function (Request $request, Response $response, array $args) use ($view) {
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

$app->get('/news', function (Request $request, Response $response, array $args) use ($view) {
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


$app->group('/academy', function () use ($app, $view) {
    $app->get('', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/presentations', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/vebinars', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/instructions', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();

        $categories = [
            [
                'id' => 1,
                'img' => '/assets/img/instructions/vs-net.png',
                'title' => 'Работа с программой WS NET'
            ],
            [
                'id' => 2,
                'img' => '/assets/img/other-pages/academy/video.svg',
                'title' => 'Инструкции по работе с весами'
            ],

        ];

        $body = $view->render("user/academy/instructions.twig", [
            'title' => 'Видео инструкции',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'categories' => $categories
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/instructions/category/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $category_id = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();

        $instructions = [
            '1' => [
                [
                    'id' => 1,
                    'title' => 'Запуск программы',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 2,
                    'title' => 'Словари',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 3,
                    'title' => 'Регистрация оператора',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 4,
                    'title' => 'Журнал Смен',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 5,
                    'title' => 'Главное окно программы. Поля обязательные для заполнения',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 6,
                    'title' => 'Просмотр информации о программе',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 7,
                    'title' => 'Основной режим двойное взвешивание. Требуется взвесить однократно',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 8,
                    'title' => 'Однократное взвешивание полного вагона тара берётся с бруса вагона',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 9,
                    'title' => 'Порядок взвешивания в режиме ВЕСЫ. Выбор режима взвешивания',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 10,
                    'title' => 'Режим двойного взвешивания. Взвешиваем пустой затем полный вагон',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 11,
                    'title' => 'Настройка внешнего вида таблицы базы данных',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 12,
                    'title' => 'Печать накладной после взвешивания вагона',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 13,
                    'title' => 'База данных',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 14,
                    'title' => 'Потележечное взвешивание вагона',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
            ],
            '2' => [
                [
                    'id' => 1,
                    'title' => 'Установка конвейерных весов на горизонтальный конвейер',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 2,
                    'title' => 'Установка конвейерных весов на наклонном конвейере',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
                [
                    'id' => 3,
                    'title' => 'Работа с Конвейерным прибором Микросим',
                    'img' => '/assets/img/other-pages/academy/video.svg'
                ],
            ]
        ];

        $body = $view->render("user/academy/instruction-category.twig", [
            'title' => 'Видео инструкции',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'instructions' => $instructions[$category_id],
            'category_id' => $category_id
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/instructions/category/{category_id}/instruction/{instruction_id}', function (Request $request, Response $response, array $args) use ($view) {
        $category_id = $args['category_id'];
        $instruction_id = $args['instruction_id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getSidebar();


        $instructions = [
            '1' => [
                '1' => [
                    'title' => 'Запуск программы',
                    'src' => 'https://www.youtube.com/embed/jugYcchUnFI?si=tDBJaef-6XLqkCEf'
                ],
                '2' => [
                    'title' => 'Словари',
                    'src' => 'https://www.youtube.com/embed/1MJZZ2lmpas?si=aq7IDioLCGBFiaEK'
                ],
                '3' => [
                    'title' => 'Регистрация оператора',
                    'src' => 'https://www.youtube.com/embed/cEM6OEjaqy4?si=jSTFdxWq4EAwD5c7'
                ],
                '4' => [
                    'title' => 'Журнал Смен',
                    'src' => 'https://www.youtube.com/embed/1cSJ9CiuwHk?si=ue2hz-neAHWUChAP'
                ],
                '5' => [
                    'title' => 'Главное окно программы. Поля обязательные для заполнения',
                    'src' => 'https://www.youtube.com/embed/rh1ezRpuzRU?si=mo6wkZjEHPI929RO'
                ],
                '6' => [
                    'title' => 'Просмотр информации о программе',
                    'src' => 'https://www.youtube.com/embed/UgCgTE7fYus?si=V__1DG19Mh7HzPNs'
                ],
                '7' => [
                    'title' => 'Основной режим двойное взвешивание. Требуется взвесить однократно',
                    'src' => 'https://www.youtube.com/embed/lQatQhDWlNw?si=v86b7Sm7XZGFFIye'
                ],
                '8' => [
                    'title' => 'Однократное взвешивание полного вагона тара берётся с бруса вагона',
                    'src' => 'https://www.youtube.com/embed/Bw8r_2G7lqw?si=vSZ2J8rO6R3qT9zJ'
                ],
                '9' => [
                    'title' => 'Порядок взвешивания в режиме ВЕСЫ. Выбор режима взвешивания',
                    'src' => 'https://www.youtube.com/embed/BFfPsTgdgRY?si=QLO7Sik3A2khe55N'
                ],
                '10' => [
                    'title' => 'Режим двойного взвешивания. Взвешиваем пустой затем полный вагон',
                    'src' => 'https://www.youtube.com/embed/p3ieBhvp2ng?si=cgNZ3S5JA38Ar1re'
                ],
                '11' => [
                    'title' => 'Настройка внешнего вида таблицы базы данных',
                    'src' => ''
                ],
                '12' => [
                    'title' => 'Печать накладной после взвешивания вагона',
                    'src' => ''
                ],
                '13' => [
                    'title' => 'База данных',
                    'src' => ''
                ],
                '14' => [
                    'title' => 'Потележечное взвешивание вагона',
                    'src' => ''
                ],
            ],
            '2' => [
                '1' => [
                    'title' => 'Установка конвейерных весов на горизонтальный конвейер',
                    'src' => 'https://www.youtube.com/embed/N88t7lAgCYw?si=B1V97OVp1tqKelZR'
                ],
                '2' => [
                    'title' => 'Установка конвейерных весов на наклонном конвейере',
                    'src' => 'https://www.youtube.com/embed/_jIo9FaWgwo?si=r-GuPevGow6RsSt4'
                ],
                '3' => [
                    'title' => 'Работа с Конвейерным прибором Микросим',
                    'src' => 'https://www.youtube.com/embed/KsuHjznxGr8?si=_DbChPBZzcMrPbDn'
                ],
            ]
        ];

        $instruction = $instructions[$category_id][$instruction_id];

        $body = $view->render("user/academy/instruction-page.twig", [
            'title' => $instruction['title'],
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'instruction' => $instruction
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/vebinars/{id}', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/presentations/{id}', function (Request $request, Response $response, array $args) use ($view) {
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

$app->group('/addmaterials', function () use ($app, $view) {
    $app->get('', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/sertificates', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/check-lists', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/promo-materials', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/promo-photos', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/faq', function (Request $request, Response $response, array $args) use ($view) {
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

$app->group('/admin', function () use ($app, $view) {
    $app->get('', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/banners', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $banners = BannerPage::getBanners();
        print_r($banners);
        $body = $view->render("admin/banners.twig", [
            'title' => 'Баннеры',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'banners' => $banners
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/add-banner', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $body = $view->render("admin/create-banner.twig", [
            'title' => 'Баннеры',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/banners/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $bannerId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $banner = BannerPage::getBanner($bannerId);
        $body = $view->render("admin/item-banner.twig", [
            'title' => 'Баннеры',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'banner' => $banner
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->post('/create-banners', function (Request $request, Response $response, array $args) use ($view) {
        $params = $request->getParsedBody();
        BannerPage::createBanner($params);
        $json = json_encode(['msg' => 'banner was add']);
        $response->getBody()->write($json);
        return $response;
    });

    $app->get('/dealers', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/dealer-clients', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/authorization', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/news', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $news = NewsPage::getListNews();
        print_r($news);
        $body = $view->render("admin/news.twig", [
            'title' => 'Новости',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'news' => $news
        ]);
        $response->getBody()->write($body);
        return $response;
    });


    $app->get('/news/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $newsId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $newsItem = NewsPage::getNewsItem($newsId);
        print_r($newsItem);
        $body = $view->render("admin/news-item.twig", [
            'title' => $newsItem['title'],
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'newsItem' => $newsItem
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/new-news', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/tkp-editor', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/tkp-editor/auto', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/tkp-editor/auto/{id}', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/tkp-editor/vagon', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/tkp-editor/vagon/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $tkpId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpData = TkpVagonController::getTkpId($tkpId);
        $body = $view->render("admin/tkp-pages/vagon-edit.twig", [
            'title' => 'Редактор ТКП Вагоны',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpData' => $tkpData
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/platform', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpPlatformController::getAllTkpPlatform();
        print_r($tkpList);
        $body = $view->render("admin/tkp-pages/platform.twig", [
            'title' => 'Редактор ТКП Платформы',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/platform/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $tkpId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpData = TkpPlatformController::getTkpId($tkpId);
        $body = $view->render("admin/tkp-pages/platform-edit.twig", [
            'title' => 'Редактор ТКП Платформы',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpData' => $tkpData
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/update', function (Request $request, Response $response, array $args) use ($view) {
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpList = TkpUpdateController::getAllTkpUpdate();
        print_r($tkpList);
        $body = $view->render("admin/tkp-pages/update.twig", [
            'title' => 'Редактор ТКП Обновления',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpList' => $tkpList
        ]);
        $response->getBody()->write($body);
        return $response;
    });

    $app->get('/tkp-editor/update/{id}', function (Request $request, Response $response, array $args) use ($view) {
        $tkpId = $args['id'];
        $userAuth = UserController::checkUserAuth();
        $headerName = $userAuth['name'];
        $sidebar = SidebarController::getAdminSidebar();
        $tkpData = TkpUpdateController::getTkpId($tkpId);
        $body = $view->render("admin/tkp-pages/update-edit.twig", [
            'title' => 'Редактор ТКП Обновления',
            'headerName' => $headerName,
            'sidebar' => $sidebar,
            'tkpData' => $tkpData
        ]);
        $response->getBody()->write($body);
        return $response;
    });


    $app->get('/presentations', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/faq', function (Request $request, Response $response, array $args) use ($view) {
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

    $app->get('/vebinars', function (Request $request, Response $response, array $args) use ($view) {
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


$app->get('/clients', function (Request $request, Response $response, array $args) use ($view) {
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
$app->post('/telegram-bot', function (Request $request, Response $response, array $args) use ($view) {
    $params = $request->getParsedBody();
    file_put_contents(__DIR__ . '/message.txt', print_r($params, true));
    $telegramService = new TelegramService(tokenTelegram, $params);
    $telegramBot = new TelegramBot($telegramService, $params);
    $telegramBot->startService();
    $response->getBody()->write('');
});


//Общие страницы: Авторизация, регистрация, восстановление пароля и т.д
$app->get('/auth', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $body = $view->render("$folder/AuthForm.twig", [
        'title' => 'Авторизация',
    ]);
    $response->getBody()->write($body);
});

$app->get('/register', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $body = $view->render("$folder/RegisterForm.twig", [
        'title' => 'Регистрация',
    ]);
    $response->getBody()->write($body);
});

$app->get('/confirm', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $getParams = $request->getQueryParams();
    $mail = $getParams['mail'];
    $body = $view->render("$folder/ConfirmMail.twig", [
        'title' => 'Подтверждение почты',
        'mail' => $mail
    ]);
    $response->getBody()->write($body);
});

$app->get('/restore', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $body = $view->render("$folder/RestorePage.twig", [
        'title' => 'Восстановление пароля',
        'pageText' => 'На вашу почту будет отправлена ссылка на сброс пароля'
    ]);
    $response->getBody()->write($body);
});

$app->get('/restorePass', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $getParams = $request->getQueryParams();

    $userInfo = UserController::getDataFromToken($getParams);

    if ($userInfo) {
        $body = $view->render("$folder/RestorePass.twig", [
            'title' => 'Восстановление пароля',
            'text' => 'Введите новый пароль для логина: ' . $userInfo['mail']
        ]);

        $response->getBody()->write($body);
        return $response;
    } else {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
});

$app->get('/awaitPage', function (Request $request, Response $response, array $args) use ($view) {
    $folder = 'common';
    $body = $view->render("$folder/AwaitPage.twig", [
        'title' => 'Восстановление пароля',
        'pageText' => 'На вашу почту будет отправлена ссылка на сброс пароля'
    ]);
    $response->getBody()->write($body);
});


//Методы для служебных страниц
$app->post('/authUser', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $controllerResponse = UserController::authUser($params);
    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->post('/registerUser', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $controllerResponse = UserController::registerUser($params);
    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->post('/confirmMail', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $userResponse = UserController::checkConfirm($params['mail'], $params['code']);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/restoreMail', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $userResponse = UserController::restoreMail($params);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/restorePass', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $userResponse = UserController::restorePass($params);
    $response->getBody()->write($userResponse);
    return $response;
});

$app->post('/authorizeDealer', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    UserController::authorizeUser($params);
    $response->getBody()->write('');
    return $response;
});

$app->post('/uploadImg', function (Request $request, Response $response) {
    $json = UploadImg::uploadImg();
    $response->getBody()->write($json);
    return $response;
});

$app->post('/createNews', function (Request $request, Response $response) {
    $params = $request->getParsedBody();
    NewsPage::createNews($params);
    $response->getBody()->write('');
    return $response;
});


$app->post('/listTkp/{id}', function (Request $request, Response $response, array $args) {
    $params = $request->getParsedBody();
    $typeTkp = $args['id'];
    if ($typeTkp == 'auto') {
        $controllerResponse = GetTkpAuto::getTkpList($params);
    }

    if ($typeTkp == 'vagon') {
        $controllerResponse = GetTkpVagon::getTkpList($params);
    }

    if ($typeTkp == 'platform') {
        $controllerResponse = GetTkpPlatform::getTkpList($params);
    }

    if ($typeTkp == 'upgrade-bundle') {
        $controllerResponse = GetTkpUpgradeBundle::getTkpList($params);
    }

    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->get('/getTkp/{id}', function (Request $request, Response $response, array $args) use ($view) {
    $getParams = $request->getQueryParams();
    $typeTkp = $args['id'];
    CreateTkpAuto::createTkp($getParams, $typeTkp);
    $response->getBody()->write('');
});

$app->run();
