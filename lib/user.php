<?php

require_once("debug.php");


Class User {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selectUser($user_id) {
        $sql = "SELECT * FROM user WHERE id = $user_id";
        $sql_result = mysqli_query($this->connection, $sql);
        
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        return $result;
    }
}

?>
