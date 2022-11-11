<?php
require_once './libs/Router.php';
require_once './app/controllers/song-api.controller.php';

// crea el router
$router = new Router();

// defina la tabla de ruteo
$router->addRoute('songs', 'GET', 'SongApiController', 'getSongs');
$router->addRoute('songs/:ID', 'GET', 'SongApiController', 'getSong');
$router->addRoute('songs/:ID', 'DELETE', 'SongApiController', 'deleteSong');
$router->addRoute('songs', 'POST', 'SongApiController', 'insertSong'); 

// ejecuta la ruta (sea cual sea)
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);