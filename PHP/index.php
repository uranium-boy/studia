<?php

include_once('class/Database.php');
include_once('class/User.php');
include_once('class/RegistrationForm.php');

$rf = new RegistrationForm();
$db = new Database("localhost", "root", "", "klienci");

if (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
    $user = $rf->checkUser();
    if ($user === NULL) {
        echo "<h4>Niepoprawne dane rejestracji.</h4>";
    } else {
        $user->saveToDB($db);
        echo "<h4>Zarejestrowano użytkownika:</h4>";
        $user->show();
    }
}

?>
