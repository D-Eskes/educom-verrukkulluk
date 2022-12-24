<?php

require_once("debug.php");


Class Recipe {

    private $connection;
    private $kitchen_type;
    private $user;
    private $ingredient;
    private $recipe_info;

    public function __construct($connection, $kitchen_type, $user, $ingredient, $recipe_info) {
        $this->connection = $connection;
        $this->kitchen_type = $kitchen_type;
        $this->user = $user;
        $this->ingredient = $ingredient;
        $this->recipe_info = $recipe_info;
    }

    public function selectRecipe($recipe_id) {
        $sql = "SELECT * FROM recipe WHERE id = $recipe_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        $result["kitchen"] = $this->retrieveKitchen($result["kitchen_id"]);
        $result["type"] = $this->retrieveType($result["type_id"]);

        $result["user"] = $this->retrieveUser($result["user_id"]);
        $result["ingredient"] = $this->retrieveIngredient($result["id"]);

        $result["preparation"] = $this->retrievePreparation($result["id"]);
        $result["comment"] = $this->retrieveComment($result["id"]);
        $result["rating"] = $this->retrieveRating($result["id"]);
        $result["favorite"] = $this->retrieveFavorite($result["id"]);

        // derived
        $result["rating_average"] = $this->calculateAverageRating($result["id"]);
        $result["calories_total"] = $this->calculateTotalCalories($result["id"]);
        $result["price_total"] = $this->calculateTotalPrice($result["id"]);

        return $result;
    }
    public function selectRecipeAll() {

        $sql = "SELECT * FROM recipe";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $this->selectRecipe($row["id"]);
        }
        return $result;
    }

    private function retrieveKitchen($kitchen_id) {
        $result = $this->kitchen_type->selectKitchenType($kitchen_id);
        if ($result["record_type"] != "K") {
            return;
        }
        return $result;
    }
    private function retrieveType($type_id) {
        $result = $this->kitchen_type->selectKitchenType($type_id);
        if ($result["record_type"] != "T") {
            return;
        }
        return $result;
    }

    private function retrieveUser($user_id) {
        return $this->user->selectUser($user_id);
    }
    
    private function retrieveIngredient($recipe_id) {
        return $this->ingredient->selectIngredient($recipe_id);
    }

    private function retrievePreparation($recipe_id) {
        $result = [];
        foreach ($this->recipe_info->selectRecipeInfo($recipe_id) as $recipe_info) {
            if ($recipe_info["record_type"] != "P") {
                continue;
            }
            $result[] = $recipe_info;
        }
        return $result;
    }
    private function retrieveComment($recipe_id) {
        $result = [];
        foreach ($this->recipe_info->selectRecipeInfo($recipe_id) as $recipe_info) {
            if ($recipe_info["record_type"] != "C") {
                continue;
            }
            $result[] = $recipe_info;
        }
        return $result;
    }
    private function retrieveRating($recipe_id) {
        $result = [];
        foreach ($this->recipe_info->selectRecipeInfo($recipe_id) as $recipe_info) {
            if ($recipe_info["record_type"] != "R") {
                continue;
            }
            $result[] = $recipe_info;
        }
        return $result;
    }
    private function retrieveFavorite($recipe_id) {
        $result = [];
        foreach ($this->recipe_info->selectRecipeInfo($recipe_id) as $recipe_info) {
            if ($recipe_info["record_type"] != "F") {
                continue;
            }
            $result[] = $recipe_info;
        }
        return $result;
    }

    private function calculateAverageRating($recipe_id) {
        // return the average rating of a recipe up to two decimals, returns zero if no ratings are given for the recipe
        
        $rating_array = $this->retrieveRating($recipe_id);
        $rating_entries = count($rating_array);
        $rating_total = 0;

        foreach ($rating_array as $rating) {
            $rating_total += $rating["field_number"];
        }

        try {
            $result = $rating_total / $rating_entries;
        } catch (DivisionByZeroError) {
            $result = 0;
        }
        return round($result, 2);
    }
    private function calculateTotalCalories($recipe_id) {
        // return the total calories (not kilocalories -> /1000) of the recipe (rounded up)

        $ingredient_array = $this->retrieveIngredient($recipe_id);

        $result = 0;
        foreach ($ingredient_array as $ingredient) {
            $quantity_used = $ingredient["quantity_used"];
            $quantity = $ingredient["quantity"];
            $calories = $ingredient["calories"];

            $result += round($calories * ($quantity_used / $quantity));
        }
        return $result;
    }
    private function calculateTotalPrice($recipe_id) {
        // return the total price of the recipe in cents (rounded up)

        $ingredient_array = $this->retrieveIngredient($recipe_id);

        $result = 0;
        foreach ($ingredient_array as $ingredient) {
            $quantity_used = $ingredient["quantity_used"];
            $quantity = $ingredient["quantity"];
            $price = $ingredient["price"];

            $result += round($price * ($quantity_used / $quantity));
        }
        return $result;
    }
}
    

?>
