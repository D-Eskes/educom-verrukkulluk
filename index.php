<?php

require_once("lib/debug.php");

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/user.php");
require_once("lib/kitchen_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");

require_once("lib/recipe.php");

/// INIT
$db = new Database();
$article = new Article($db->getConnection());
$user = new User($db->getConnection());
$kitchen_type = new KitchenType($db->getConnection());
$ingredient = new Ingredient($db->getConnection(), $article);
$recipe_info = new RecipeInfo($db->getConnection(), $user);
$recipe = new Recipe($db->getConnection(), $kitchen_type, $user, $ingredient, $recipe_info);

/// VERWERK
// echo "Article";
// debuginfo($article->selectArticle(1));
// echo "User";
// debuginfo($user->selectUser(1));
// echo "KitchenType";
// debuginfo($kitchen_type->selectKitchenType(1));
// echo "Ingredient";
// debuginfo($ingredient->selectIngredient(1));
// echo "RecipeInfo";
// debuginfo($recipe_info->selectRecipeInfo(1));
echo "Recipe";
debuginfo($recipe->selectRecipeMultiple([1]));




?>