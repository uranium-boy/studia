<?php
function dodaj() {
    $file = fopen("dane.txt", "a+");
    if (!$file) {
        echo "<p>Błąd otwarcia pliku</p>";
        exit;
    }
    foreach($_REQUEST as $key => $val) {
        if(is_array($val)) {
            $arr = implode(", ", $val);
            fwrite($file, $arr);
            fwrite($file, ";");
        }
        else if ($key != "submit"){
            fwrite($file, $val);
            fwrite($file, ";");
        }
    }
    fwrite($file, "\n");
    fclose($file);
}

function pokaz() {
    $file = fopen("dane.txt", "r");
    if (!$file) {
        echo "<p>Błąd otwarcia pliku</p>";
        exit();
        }

    while(!feof($file)) {
        echo "<p>" . fgets($file) . "</p>";
    }
    fclose($file);
}


function pokaz_zamowienie($tut) {
    $file = fopen("dane.txt", "r");
    if (!$file) {
        echo "<p>Błąd otwarcia pliku</p>";
        exit();
    }

    while(!feof($file)) {
        $line = fgets($file);
        if (str_contains($line, $tut)) {
            echo "<p>" . $line . "</p>";
        }
    }
    fclose($file);
}
?>
