<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Odbierz</title>
    </head>
    <body>
        <div>
            <h2>Dane odebrane z formularza:</h2>
            <?php
            if (isset($_REQUEST['lastname']) && ($_REQUEST['lastname'] != "")) {
                $nazwisko = htmlspecialchars(trim($_REQUEST['lastname']));
                echo "Nazwisko: $nazwisko <br>";
            }
            else echo "Nie wpisano nazwiska <br>";

            if (isset($_REQUEST['age']) && ($_REQUEST['age'] != "")) {
                $age = htmlspecialchars(trim($_REQUEST['age']));
                echo "Wiek: $age <br>";
            }
            else echo "Nie podano wieku <br>";

            if (isset($_REQUEST['country']))  {
                $country = htmlspecialchars(trim($_REQUEST['country']));
                echo "Kraj: $country <br>";
            }

            if (isset($_REQUEST['payment']) && ($_REQUEST['payment'] != "")) {
                $payment = htmlspecialchars(trim($_REQUEST['payment']));
                echo "Sposób zapłaty: $payment <br>";
            }
            else echo "Nie podano sposobu zapłaty <br>";

            if (isset($_REQUEST['lang']) && ($_REQUEST['lang'] != [])) {
//                $languages = join(", ", $_REQUEST['lang']);
                $languages = implode(", ", $_REQUEST['lang']);
                echo "Wybrane języki: $languages <br>";
            }
            else echo "Nie wybrano żadnego języka<br>";

//            var_dump($_REQUEST);
            echo "<br>Dane przesłane metodą POST:<br>";
            var_dump($_POST);
            echo "<br>Dane przesłane metodą GET:<br>";
            var_dump($_GET);
            echo "<br><br>";

            foreach($_REQUEST as $key => $val) {
                if(is_array($val)) {
                    foreach($val as $arr_val) {
                        echo "Element tablicy $key: $arr_val<br>";
                    }
                }
                else {
                    echo "Wartość $key: $val<br>";
                }
            }

            include 'odbierz4.php';
            ?>
        </div>
    </body>
</html>
