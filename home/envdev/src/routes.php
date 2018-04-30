<?php

use Slim\Http\Request;
use Slim\Http\Response;

$app->get('/', function ($request, $response, $args) {

    $Home = new Home();

    return $this->view->render($response, 'index.twig', [
            'tools'    => $Home->getTools(),
            'projects' => $Home->getProjects(),
            'vhosts'   => $Home->getVHosts()
            ]
        );
});

$app->get('/phpinfo', function ($request, $response, $args) {
        phpinfo();
        return $this->view->render($response, 'phpinfo.twig', []);
});
