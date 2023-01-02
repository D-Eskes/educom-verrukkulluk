<?php

require_once("debug.php");


Class User {

    private $connection;
    private $grocery;

    public function __construct($connection, $grocery) {
        $this->connection = $connection;
        $this->grocery = $grocery;
    }

    public function selectUser($user_id) {
        $sql = "SELECT * FROM user WHERE id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);
        
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        $result["grocery"] = $this->retrieveGrocery($result["id"]);
        $result["price_total"] = $this->calculateTotalPrice($result["grocery"]);
        return $result;
    }

    private function retrieveGrocery($user_id) {
        return $this->grocery->selectGrocery($user_id);
    }
    
    private function calculateTotalPrice($grocery_array) {
        // return the total price of the groceries in cents (rounded up)

        $result = 0;
        foreach ($grocery_array as $grocery) {
            $amount = $grocery["amount"];
            $price = $grocery["price"];

            $result += round($price * $amount);
        }
        return $result;
    }
}

?>
