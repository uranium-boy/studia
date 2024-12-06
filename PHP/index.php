<?php

include_once('class/Database.php');
include_once('class/User.php');
include_once('class/RegistrationForm.php');

$rf = new RegistrationForm();
$db = new Database("localhost", "root", "", "klienci");

if ($action = filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
    switch ($action) {
        case "Rejestruj":
            $user = $rf->checkUser();
            if ($user === NULL) {
                echo "<h4>Niepoprawne dane rejestracji.</h4>";
            } else {
                $user->saveToDB($db);
                echo "<h4>Zarejestrowano użytkownika:</h4>";
                $user->show();
            }
            break;
        case "Wyświetl wszystkie":
            User::getAllUsersFromDB($db);
            break;
    }
}

?>
