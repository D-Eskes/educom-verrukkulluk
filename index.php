<?php

require_once("lib/debug.php");

require_once("lib/database.php");
require_once("lib/artikel.php");

/// INIT
$db = new Database();
$art = new Artikel($db->getConnection());


/// VERWERK 
$data = debuginfo($art->selecteerArtikel(1));





?>