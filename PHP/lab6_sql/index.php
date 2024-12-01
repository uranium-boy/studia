<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
        <title>Formularz</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            table, th, td {
                border: 1px solid black;
                padding: 4px;
            }
        </style>
    </head>
    <body>
        <h3>Przykładowy formularz HTML:</h3>
        <form action="index.php" method="post">
            <label for="lastname">Nazwisko:</label>
            <input id="lastname" type="text" name="lastname"><br>
            <label for="age">Wiek:</label>
            <input id="age" type="number" name="age"><br>
            <label for="country">Państwo:</label>
            <select id="country" name="country">
                <option value="Polska">Polska</option>
                <option value="Wielka Brytania">Wielka Brytania</option>
                <option value="Niemcy">Niemcy</option>
                <option value="Czechy">Czechy</option>
            </select><br>
            <label for="email">Adres e-mail:</label>
            <input id="email" type="email" name="email"><br>

            <h4>Zamawiam tutorial z języka:</h4>
            <?php
                $languages = ["C", "CPP", "Java", "C#", "HTML", "CSS", "XML", "PHP", "JS"];
                foreach ($languages as $lang) {
                    echo "<input id='$lang' type='checkbox' name='lang[]' value='$lang'>";
                    echo "<label for='$lang'>$lang</label>";
                }
            ?>

            <h4>Sposób zapłaty</h4>
            <input id="Master Card" type="radio" name="payment" value="Master Card">
            <label for="Master Card">Master Card</label>
            <input id="Visa" type="radio" name="payment" value="Visa">
            <label for="Visa">Visa</label>
            <input id="Przelew" type="radio" name="payment" value="Przelew">
            <label for="Przelew">Przelew bankowy</label>
            <br><br>
            <input type="reset" value="Wyczyść">
            <input type="submit" name="submit" value="Zapisz">
            <input type="submit" name="submit" value="Pokaż">
            <input type="submit" name="submit" value="PHP">
            <input type="submit" name="submit" value="CPP">
            <input type="submit" name="submit" value="Java">
            <input type="submit" name="submit" value="Statystyki">
        </form>
<?php

include_once "funkcje.php";
include_once "class/Database.php";

$db = new Database("localhost", "root", "", "klienci");

$action = filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_SPECIAL_CHARS);
if($action != null) {
    switch ($action) {
        case "Zapisz": addToDB($db); break;
        case "Pokaż": pokaz($db); break;
        case "PHP": pokaz_zamowienie($db, "PHP"); break;
        case "CPP": pokaz_zamowienie($db, "CPP"); break;
        case "Java": pokaz_zamowienie($db, "Java"); break;
        case "Statystyki": statystyki($db); break;
    }
}
?>
    </body>
</html>
