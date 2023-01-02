<?php

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/grocery.php");
require_once("lib/user.php");
require_once("lib/kitchen_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");


/// INIT
$db = new database();
$art = new artikel($db->getConnection());


/// VERWERK 
$data = $art->selecteerArtikel(8);

