<?php

require_once("debug.php");


Class RecipeInfo{

    private $connection;
    private $user;

    public function __construct($connection, $user) {
        $this->connection = $connection;
        $this->user = $user;
    }

    public function selectRecipeInfo($recipe_id) {
        $sql = "SELECT * FROM recipe_info WHERE recipe_id = $recipe_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = [];
        while ($row = mysqli_fetch_array($sql_result, MYSQLI_ASSOC)) {
            if (in_array($row["record_type"], ["C", "F"])) {
                $row["user"] = $this->selectUser($row["user_id"]);
            }
            $result[] = $row;
        }
        return $result;
    }
    private function selectUser($user_id) {
        return $this->user->selectUser($user_id);
    }

    public function isFavorite($recipe_id, $user_id) {

        $sql = "SELECT * FROM recipe_info WHERE record_type = 'F' and recipe_id = $recipe_id and user_id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);

        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);

        $favorite = ($result !== null);
        return $favorite;
    }
    public function addFavorite($recipe_id, $user_id) {

        if ($this->isFavorite($recipe_id, $user_id)) {
            return;
        }

        $sql = "INSERT INTO recipe_info (record_type, recipe_id, user_id) VALUES ('F', $recipe_id, $user_id)";
        $sql_result = mysqli_query($this->connection, $sql);
    }
    public function removeFavorite($recipe_id, $user_id) {

        if (!$this->isFavorite($recipe_id, $user_id)) {
            return;
        }

        $sql = "DELETE FROM recipe_info WHERE record_type = 'F' and recipe_id = $recipe_id and user_id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);
    }

}

?>
