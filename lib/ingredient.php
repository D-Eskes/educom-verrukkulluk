<?php

require_once("debug.php");


Class Ingredient {

    private $connection;
    private $article;

    public function __construct($connection, $article) {
        $this->connection = $connection;
        $this->article = $article;
    }

    public function selectIngredient($recipe_id) {
        $sql = "SELECT * FROM ingredient WHERE recipe_id = $recipe_id";
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
