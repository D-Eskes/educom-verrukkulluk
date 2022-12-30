<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/
require_once("lib/debug.php");
require_once("lib/request.php");

require_once("lib/database.php");
require_once("lib/article.php");
require_once("lib/grocery.php");
require_once("lib/user.php");
require_once("lib/kitchen_type.php");
require_once("lib/ingredient.php");
require_once("lib/recipe_info.php");
require_once("lib/recipe.php");


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


// UPDATE

$action = defaultGET("action", "homepage");
$recipe_id = defaultGET("recipe_id", "");
$rating = defaultGET("rating", "");

$user_id = 1;

switch($action) {

    case "homepage": {
        $template = 'homepage.html.twig';

        $title = "home";
        $data = $recipe->selectRecipeAll();
        break;
    }
    case "detail": {
        $template = 'detail.html.twig';

        $title = "detail";
        $data = $recipe->selectRecipe($recipe_id);
        break;
    }
    case "grocery": {
        $template = 'grocery.html.twig';

        $title = "grocery";
        $data = [];
        break;
    }

    case "favorite": {
        $favorite = $recipe_info->isFavorite($recipe_id, $user_id);
        if ($favorite) {
            $recipe_info->removeFavorite($recipe_id, $user_id);
        } else {
            $recipe_info->addFavorite($recipe_id, $user_id);
        }

        echo !$favorite;
        return;
    }

    case "rate": {
        $valid = false;
        if (0 < $rating && $rating < 6) {
            $recipe_info->addRating($recipe_id, $rating);
            $valid = true;
        }

        echo $recipe->selectRecipe($recipe_id)["rating_average"];
        return;
    }

    case "addgrocery": {
        $grocery->addGroceryRecipe($user_id, $recipe_id);
        return;
    }

}


$template = $twig->load($template);

echo $template->render([
    "title" => $title, 
    "data" => $data,
    "user" => $user->selectUser($user_id)
]);


