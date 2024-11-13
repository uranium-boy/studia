<?php
function dodaj() {
    $techs = $_POST['techs'];
    if ($techs && !empty($techs)) {
        foreach ($techs as $tech) {
            zapisz($tech);
        }
        echo "<p>Zapisano głos!</p>";
    } else {
        echo "<h4>Nie wybrano żadnej opcji!</h4>";
    }
}
function zapisz($tech) {
    $file = fopen("ankieta.txt", "r+");
    if (!$file) {
        echo "<p>Brak otwarcia pliku</p>";
        exit();
    }
    $content = "";
    $found = false;
    while (!feof($file)) {
        $line = fgets($file);

        if (str_contains($line, $tech)) {
            $cols = explode(";", $line);
            $cols[1] ++;
            $line = implode(";", $cols);
            $found = true;
        }

        $content .= $line;
    }

    if (!$found) {
        $content .= $tech . ";1" . PHP_EOL;
    }

    fseek($file, 0);
    fwrite($file, $content);
    fclose($file);
}

function wyniki() {
    $file = fopen("ankieta.txt", "r");
    if (!$file) {
        echo "<p>Plik o takiej nazwie nie istnieje</p>";
        exit();
    }

    echo "<h3>Wyniki ankiety:</h3>";
    $total = 0;

    while(($line = fgets($file)) != false) {
        $data = explode(";", $line);
        echo "<p>$data[0]: $data[1]</p>";
        $total += $data[1];
    }

    echo "Całkowita liczba głosów: $total";

    fclose($file);
}

?>
