<?php

require_once("debug.php");


Class Article {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selectArticle($article_id) {
        $sql = "SELECT * FROM article WHERE id = $article_id";
        $sql_result = mysqli_query($this->connection, $sql);
        
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        return $result;
    }
}

?>
