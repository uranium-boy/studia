<?php
include_once('class/User.php');
session_start();

$user = new User('kubus', 'Kubus Puchatek', 'kubus@stumilowylas.pl', 'haslo');
$user->setStatus(User::STATUS_ADMIN);
$_SESSION['user'] = serialize($user);

$_SESSION['username'] = 'kubus';
$_SESSION['fullname'] = 'Kubus Puchatek';
$_SESSION['email'] = 'kubus@stumilowylas.pl';
$_SESSION['status'] = 'ADMIN';

echo "<h2>ID sesji: " . session_id() . "</h2><hr>";
echo "<h3>Przechowywanie danych w zmiennych sesji:</h3>";
foreach ($_SESSION as $key => $value) {
    if ($key != "user") {
        echo "<p>$key: $value</p>";
    }
}

echo "<hr><h3>Przechowywanie obiektu w zmiennej sesji:</h3>";
$unserializedUser = unserialize($_SESSION['user']);
$unserializedUser->show();

echo "<hr><h3>Ciasteczka:</h3>";
foreach ($_COOKIE as $key => $value) {
    echo "<h4>$key = $value</h4>";
}

echo "<hr><p><a href='test2.php'>Przejdź do strony 2</a></p>";

?>
