<?php

function walidacja() {
    $args = ['lastname' => ['filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '/^[A-Z]{1}[a-ząęłńśćżźó-]{1,25}$/']],
        'country' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
        'lang' => ['filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
            'flags' => FILTER_REQUIRE_ARRAY],
        'age' => ['filter' => FILTER_SANITIZE_NUMBER_INT],
        'email' => ['filter' => FILTER_VALIDATE_EMAIL],
    ];

    $data = filter_input_array(INPUT_POST, $args);
    var_dump($data);

    $errors = "";
    foreach ($data as $key => $val) {
        if ($val === false or $val === null) {
            $errors .= $key . " ";
        }
    }

    if ($errors === "") {
        echo "<p>Brak błęðóœœœ I'M SO PROUD OF YOU===> DANE IDA DO PLIKU <3 :3</p>";
        dopliku("dane.txt", $data);
    } else {
        echo "<p>BUUUU zły człowiek, dane nie idą do pliku :'(";
        echo "<p>$errors</p>";
    }
}

function dopliku($fileName, $dataArray) {
    $file = fopen($fileName, "a+");
    if (!$file) {
        echo "<p>Błąd otwarcia pliku</p>";
        exit;
    }
    
    $data = "";
    foreach($dataArray as $key => $val) {
        if (is_array($val)) {
            $arr = implode(", ", $val);
            $data .= $arr;
            $data .= ";";
        } else {
            $data .= $val;
            $data .= ";";
        }
    }

    $data .= PHP_EOL;
    fwrite($file, $data);
    echo "<p>Zapisano: $data</p>";
}

function dodaj() {
    echo "<h3>DODAWANIE DO PLIKU</h3>";
    walidacja();
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

function statystyki() {
    $file = fopen("dane.txt", "r");
    if (!$file) {
        echo "<p>Błąd otwarcia pliku</p>";
        exit();
    }

    $all = 0;
    $underage = 0;
    $old = 0;

    while (!feof($file)) {
        $line = fgets($file);
        $columns = explode(";", $line);

        $all++;
        if ($columns[1] < 18) {
            $underage++;
        } else if ($columns[1] >= 50) {
            $old++;
        }
    }

    fclose($file);

    echo "<p>Liczba wszystkich zamówień: $all</p>";
    echo "<p>Liczba zamowien od osob w wieku < 18 lat: $underage</p>";
    echo "<p>Liczba zamowien od osob w wieku >= 50 lat: $old</p>";
}
?>
