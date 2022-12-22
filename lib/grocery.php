<?php

require_once("debug.php");


Class Grocery {

    private $connection;
    private $article;

    public function __construct($connection, $article) {
        $this->connection = $connection;
        $this->article = $article;
    }

    public function selectGrocery($user_id) {
        $sql = "SELECT * FROM grocery WHERE user_id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $row + $this->retrieveArticle($row["article_id"]);
        }
        return $result;
    }

    private function retrieveArticle($article_id) {
        return $this->article->selectArticle($article_id);
    }
}

?>
