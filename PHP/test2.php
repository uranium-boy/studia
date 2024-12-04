<?php
include_once('class/User.php');
session_start();

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
    echo "<h3>$key = $value</h3>";
}

echo '<hr><form method="POST" action="test2.php"><input type="submit" name="delete" value="Usuń dane sesji"></form>';

if (filter_input(INPUT_POST, 'delete')) {
    echo "<p>Usuwanie danych sesji...</p>";
    $_SESSION = [];
    setcookie(session_name(), '', time() - 42000, '/');
    session_destroy();
    echo "<p>Usunięto dane sesji</p>";
}

echo "<hr><p><a href='test1.php'>Wróc do strony 1</a></p>";

?>
