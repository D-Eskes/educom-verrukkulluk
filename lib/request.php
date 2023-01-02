<?php



function defaultPOST(string $key, string $default) {
    return isset($_POST[$key]) ? $_POST[$key] : $default;
}

function defaultGET(string $key, string $default) {
    return isset($_GET[$key]) ? $_GET[$key] : $default;
}




?>