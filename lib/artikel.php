<?php

require_once("debug.php");

class Artikel {

    private $connection;
    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerArtikel($artikel_id) {

        $sql = "SELECT * FROM artikel WHERE id = $artikel_id";
        
        $result = mysqli_query($this->connection, $sql);
        $artikel = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return($artikel);

    }


}

?>
