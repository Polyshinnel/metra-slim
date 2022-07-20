<?php

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
        $folder = $userAuth['folder'];
        $headerName = $userAuth['name'];
        $body = $view->render("$folder/main.twig", [
            'title' => 'Выберете поставщика',
            'headerName' => $headerName
        ]);
        $response->getBody()->write($body);
        return $response;
    }
    else
    {
        return $response->withStatus(302)->withHeader('Location', '/auth');
    }
});



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
    $body = $view->render("$folder/ConfirmMail.twig", [
        'title' => 'Подтверждение почты',
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
    $body = $view->render("$folder/RestorePass.twig", [
        'title' => 'Восстановление пароля',
    ]);
    $response->getBody()->write($body);
});










$app->post('/authUser',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();

    $response->getBody()->write();
    return $response;
});

$app->post('/registerUser',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();

    $response->getBody()->write();
    return $response;
});

$app->post('/confirmMail',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();

    $response->getBody()->write();
    return $response;
});

$app->post('/restorePass',function(Request $request,Response $response, array $args){
    $params = $request->getParsedBody();

    $response->getBody()->write();
    return $response;
});

$app->run();
