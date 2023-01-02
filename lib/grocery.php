<?php

require_once("debug.php");


Class Grocery {

    private $connection;
    private $article;

    private $ingredient;

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

    public function addFunctionality($ingredient) {
        $this->ingredient = $ingredient;
    }

    
    private function amountGrocery($user_id, $article_id) {
        $sql = "SELECT * FROM grocery WHERE user_id = $user_id and article_id = $article_id";
        $sql_result = mysqli_query($this->connection, $sql);
    
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
    
        $amount = 0;
        if ($result !== null) {
            $amount = $result["amount"];
        }
        return $amount;
    }
    public function addGrocery($user_id, $article_id, $amount_add = 1) {
        if ($amount_add < 1) {
            return;
        }
        $amount = $this->amountGrocery($user_id, $article_id);
        
        $sql = "INSERT INTO grocery (user_id, article_id, amount) VALUES ($user_id, $article_id, $amount_add)";
        if ($amount > 0) {
            $sql = "UPDATE grocery SET amount = amount + $amount_add WHERE user_id = $user_id and article_id = $article_id";
        }
        
        mysqli_query($this->connection, $sql);
    }
    public function removeGrocery($user_id, $article_id, $amount_remove = 1) {
        if ($amount_remove < 1) {
            return;
        }
        $amount = $this->amountGrocery($user_id, $article_id);
        
        $sql = "UPDATE grocery SET amount = amount - $amount_remove WHERE user_id = $user_id and article_id = $article_id";
        if ($amount - $amount_remove < 1) {
            $sql = "DELETE FROM grocery WHERE user_id = $user_id and article_id = $article_id";
        }
        
        mysqli_query($this->connection, $sql);
    }
    public function addGroceryRecipe($user_id, $recipe_id) {
        $ingredients = $this->ingredient->selectIngredient($recipe_id);
        foreach ($ingredients as $ingredient) {
            $article_id = $ingredient["article_id"];
            $amount = ceil($ingredient["quantity_used"] / $ingredient["quantity"]);
            $this->addGrocery($user_id, $article_id, $amount);
        }

    }
    
    
}

?>
