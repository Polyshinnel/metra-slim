<?php

use App\Controllers\Pages\Catalog\CatalogController;
use App\Controllers\Pages\Catalog\ProductController;
use App\Controllers\Pages\PageHelpers\SidebarController;
use App\Controllers\Tkp\GetTkpAuto;
use App\Controllers\UserController;
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

//$view->addExtension(new TwigExtension());

$app->get('/',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    if($userAuth)
    {
        if($userAuth['redirect'] == 'none')
        {
            $headerName = $userAuth['name'];
            $sidebar = SidebarController::getSidebar();
            $body = $view->render("user/main.twig", [
                'title' => 'Главная',
                'headerName' => $headerName,
                'sidebar' => $sidebar
            ]);
            $response->getBody()->write($body);
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
});

$app->get('/tkpcostruct',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    if($userAuth)
    {
        if($userAuth['redirect'] == 'none')
        {
            $headerName = $userAuth['name'];
            $sidebar = SidebarController::getSidebar();
            $body = $view->render("user/tkpconstruct.twig", [
                'title' => 'Конструктор ТКП',
                'headerName' => $headerName,
                'sidebar' => $sidebar
            ]);
            $response->getBody()->write($body);
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
});


$app->get('/catalog',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    if($userAuth)
    {
        if($userAuth['redirect'] == 'none')
        {
            $getParams = $request->getQueryParams();
            $headerName = $userAuth['name'];
            $sidebar = SidebarController::getSidebar();
            $catalogData = CatalogController::getCategoriesAndProducts($getParams);

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
});

$app->get('/products/{id}',function (Request $request,Response $response, array $args) use ($view){
    $userAuth = UserController::checkUserAuth();
    if($userAuth)
    {
        if($userAuth['redirect'] == 'none')
        {
            $productId = $args['id'];
            $headerName = $userAuth['name'];
            $sidebar = SidebarController::getSidebar();

            $productData = ProductController::getProduct($productId);

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



$app->post('/listTkp/{id}',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();
    $typeTkp = $args['id'];
    if($typeTkp == 'auto')
    {
        $controllerResponse = GetTkpAuto::getTkpList($params);
    }

    if($typeTkp == 'vagon')
    {
        $controllerResponse = NULL;
    }

    if($typeTkp == 'platform')
    {
        $controllerResponse = NULL;
    }

    $response->getBody()->write($controllerResponse);
    return $response;
});

$app->run();
