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
        return $result;
    }

    private function retrieveGrocery($user_id) {
        return $this->grocery->selectGrocery($user_id);
    }
}

?>
