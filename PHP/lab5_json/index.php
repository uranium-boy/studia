<?php

include_once('klasy/User.php');
include_once('klasy/RegistrationForm.php');

$rf = new RegistrationForm();

if (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
    $user = $rf->checkUser();
    if ($user === NULL) {
        echo "<h4>Niepoprawne dane rejestracji.</h4>";
    } else {
        echo "<h4>Zarejestrowano użytkownika:</h4>";
        $user->show();
        $user->save("users.json");
        $user->saveXML();
        echo "<h4>Wszyscy użytkownicy z JSON:</h4>";
        User::getAllUsers("users.json");
        echo "<h4>Wszyscy użytkownicy z XML:</h4>";
        User::getAllUsersFromXML("users.xml");
    }
}

?>
