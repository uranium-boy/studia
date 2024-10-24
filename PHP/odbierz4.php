<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <h1>Plik odbierz4.php</h1>
        <?php
            if (isset($_POST['lang']) && ($_POST['lang'] != [])) {
                $languages = join(", ", $_POST['lang']);
                echo "<p>Wybrane języki: $languages</p>";
            }
            else echo "<p>Nie wybrano żadnego języka</p>";
            if (isset($_POST['payment']) && ($_POST['payment'] != "")) {
                $payment = $_POST['payment'];
                echo "<p>Sposób zapłaty: $payment </p>";
            }
            else echo "<p>Nie podano sposobu zapłaty </p>";

            $lastname = $_POST['lastname'];
            $country = $_POST['country'];
            $email = $_POST['email'];

            if($lastname == "" || $country == "" || $email == "") {
                echo "<h3>Nie podano wszystkich danych klienta!</h3>";
            }
            else {
                echo "<p><a href='klient.php?lastname=$lastname&country=$country&email=$email'>Dane klienta</a></p>";
            }
            echo "<p><a href='formularz.php'>Powrót do formularza</a></p>";
        ?>
    </body>
</html>

