<?php

require_once("debug.php");


Class RecipeInfo{

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selectRecipeInfo($recipe_id) {
        $sql = "SELECT * FROM recipe_info WHERE recipe_id = $recipe_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            $result[] = $row;
        }
        return $result;
    }
}

?>
