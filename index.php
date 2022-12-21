<?php

require_once("lib/debug.php");

require_once("lib/database.php");
require_once("lib/artikel.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());


/// VERWERK 
$data = debuginfo($art->selecteerArtikel(3));



?>