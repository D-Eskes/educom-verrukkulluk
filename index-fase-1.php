<?php

require_once("lib/debug.php");

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/user.php");
require_once("lib/kitchen_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");

require_once("lib/grocery.php");


/// INIT
$db = new Database();
$article = new Article($db->getConnection());
$grocery = new Grocery($db->getConnection(), $article);
$ingredient = new Ingredient($db->getConnection(), $article);
$user = new User($db->getConnection(), $grocery);
$kitchen_type = new KitchenType($db->getConnection());
$recipe_info = new RecipeInfo($db->getConnection(), $user);
$recipe = new Recipe($db->getConnection(), $kitchen_type, $user, $ingredient, $recipe_info);

$grocery->addFunctionality($ingredient);

/// VERWERK
echo "<h3> Article </h3>";
debuginfo($article->selectArticle(1));
echo "<h3> Grocery </h3>";
debuginfo($grocery->selectGrocery(1));
echo "<h3> User </h3>";
debuginfo($user->selectUser(1));
echo "<h3> KitchenType </h3>";
debuginfo($kitchen_type->selectKitchenType(1));
echo "<h3> Ingredient </h3>";
debuginfo($ingredient->selectIngredient(1));
echo "<h3> RecipeInfo </h3>";
debuginfo($recipe_info->selectRecipeInfo(1));
echo "<h3> Recipe </h3>";
debuginfo($recipe->selectRecipeMultiple([1]));

echo "<h3> Add Grocery Recipe </h3>";
$grocery->addGroceryRecipe(1, 4);






?>