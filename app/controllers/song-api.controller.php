
<?php
require_once './app/models/song-api.model.php';
require_once './app/views/song-api.view.php';

class SongApiController {
    private $model;
    private $view;
    private $data;

    public function __construct() {
        $this->model = new ModelSong();
        $this->view = new ApiView();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getSongs($params = null){
        if (isset($_GET["orden"]) && isset($_GET["tipo"])) {
            $orden = $_GET["orden"];
            $tipo = $_GET["tipo"];
            if ($orden == "genero" || $orden == "anio" || $orden == "banda" || $orden == "album" || $orden == "nombre"|| $orden == "id") {
                if ($tipo == "desc" || $tipo == "asc") {
                    $songs = $this->model->getAll($orden, $tipo);
                    $this->view->response($songs);
                }else{
                    $this->view->response("No existe ese tipo de orden.", 400);
                }
                }else{
                     $this->view->response("No se puede ordenar de esta manera.", 400);
                }
        }else{
            $songs = $this->model->getAll("id");
            $this->view->response($songs);
        }
    }

    public function getSong($params = null){
        $id = $params[':ID'];
        $song = $this->model->get($id);
        if ($song)
            $this->view->response($song);
        else 
            $this->view->response("La cancion con el id=$id no existe", 404);
    }

    public function deleteSong($params = null){
        $id = $params[':ID'];
        $song = $this->model->get($id);
        if ($song) {
            $this->model->delete($id);
            $this->view->response($song);
        } else 
            $this->view->response("La cancion con el id=$id no existe", 404);
    }

    public function insertSong($params = null){
        $song = $this->getData();

        if (empty($song->genero) || empty($song->anio) || empty($song->banda) || empty($song->album) || empty($song->nombre)) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insert($song->genero, $song->anio, $song->banda, $song->album, $song->nombre);
            $song = $this->model->get($id);
            $this->view->response($song, 201);
        }
    }

}
