<?php 

require_once("debug.php");

// Aanpassen naar je eigen omgeving
define("USER", "root");
define("PASSWORD", "");
define("DATABASE", "db_verrukkulluk");
define("HOST", "localhost");



class Database {

    private $connection;

    public function __construct() {
        $this->connection = mysqli_connect(HOST, USER, PASSWORD, DATABASE) or die(mysql_error());
    }

    public function getConnection() {
        return($this->connection);
    }

}

?>
