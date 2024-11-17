<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
        <title>Formularz</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <h3>Wybierz technologie, które znasz: </h3>
        <form action="ankieta.php" method="post">
            <?php
            $techs = ["C", "CPP", "Java", "C#", "Html", "CSS", "XML", "PHP", "JavaScript"];

            foreach ($techs as $tech) {
                echo "<input id='$tech' type='checkbox' name='techs[]' value=$tech>";
                echo "<label for='$tech'>$tech</label><br>";
            }
            ?>
            <input type="submit" name="submit" value="Zapisz">
            <input type="submit" name="submit" value="Wyniki">
        </form>
        <?php
        include_once "ankieta_funkcje.php";
$action = filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_SPECIAL_CHARS);
if ($action != null) {
    switch ($action) {
        case "Zapisz": dodaj(); break;
        case "Wyniki": wyniki(); break;
    }
}
        ?>
    </body>
</html>
