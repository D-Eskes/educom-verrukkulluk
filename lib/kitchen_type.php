<?php

require_once("debug.php");


Class KitchenType {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selectKitchenType($kitchen_type_id) {
        $sql = "SELECT * FROM kitchen_type WHERE id = $kitchen_type_id";
        $sql_result = mysqli_query($this->connection, $sql);
        
        $result = mysqli_fetch_array($sql_result, MYSQLI_ASSOC);
        return $result;
    }
}

?>
