<?php

include_once 'class/Database.php';
include_once 'class/User.php';
include_once 'class/UserManager.php';

$db = new Database("localhost", "root", "", "klienci");
$um = new UserManager();

if (filter_input(INPUT_GET, "action") == "logout") {
    $um->logout($db);
}

if (filter_input(INPUT_POST, "login")) {
    $userId = $um->login($db);

    if ($userId > 0) {
        echo "<p>Poprawne logowanie</p>";
        echo "<p>Zalogowany użytkownik o id = $userId</p>";
        echo "<p><a href='processLogin.php?action=logout'>Wyloguj</a></p>";
    } else {
        echo "<p>Błędna nazwa użytkownika</p>";
        $um->loginForm();
    }
} else {
    $um->loginForm();
}

?>
