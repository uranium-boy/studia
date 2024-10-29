<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Odbierz</title>
    </head>
    <body>
        <div><?php
//            var_dump($_REQUEST);
            echo "<br>Dane przesłane metodą POST:<br>";
            var_dump($_POST);
            echo "<br>Dane przesłane metodą GET:<br>";
            var_dump($_GET);
            echo "<br><br>";

            foreach($_REQUEST as $key => $val) {
                if(is_array($val)) {
//                    foreach($val as $arr_val) {
//                        echo "Element tablicy $key: $arr_val<br>";
//                    }
//                $arr = join(", ", $val);
                $arr = implode(", ", $val);
                    echo "<p>Elementy tablicy $key: $arr</p>";
                }
                else {
                    echo "<p>Wartość $key: $val<br></p>";
                }
            }
            ?>
        </div>
    </body>
</html>
