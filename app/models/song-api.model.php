<?php

class ModelSong {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db-canciones;charset=utf8', 'root', '');
    }

    public function getAll($orden = null, $tipo = null) {
        $query = $this->db->prepare("SELECT * FROM canciones_db ORDER BY $orden $tipo");
        $query->execute();
        $songs = $query->fetchAll(PDO::FETCH_OBJ); 
        return $songs;
    }

    public function get($id) {
        $query = $this->db->prepare("SELECT * FROM canciones_db WHERE id = ?");
        $query->execute([$id]);
        $song = $query->fetch(PDO::FETCH_OBJ);
        
        return $song;
    }

    public function insert($genero, $anio, $banda, $album, $nombre) {
        $query = $this->db->prepare("INSERT INTO canciones_db (genero, anio, banda, album, nombre) VALUES (?, ?, ?, ?, ?)");
        $query->execute([$genero, $anio, $banda, $album, $nombre]);
        return $this->db->lastInsertId();
    }

    function delete($id) {
        $query = $this->db->prepare('DELETE FROM canciones_db WHERE id = ?');
        $query->execute([$id]);
    }

}