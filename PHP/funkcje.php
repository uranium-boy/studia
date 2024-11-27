<?php

function addToDB($db) {
    walidacja($db);
}

function walidacja($db) {
    echo "<h4>Rozpoczęcie walidacji danych...</h4>";
    $args = ['lastname' => ['filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '/^[A-Z]{1}[a-ząęłńśćżźó-]{1,25}$/']],
        'age' => ['filter' => FILTER_VALIDATE_INT,
        'options' => ['min_range' => 1, 'max_range' => 127]],
        'country' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
        'email' => ['filter' => FILTER_VALIDATE_EMAIL],
        'lang' => ['filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
            'flags' => FILTER_REQUIRE_ARRAY],
        'payment' => ['filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS],
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
        echo "<h4>Dodawanie do bazy danych...</h4>";

        $mysqli = $db->getMysqli();
        $stmt = $mysqli->prepare("INSERT INTO klienci VALUES (NULL, ?, ?, ?, ?, ?, ?)");

        $stmt->bind_param(
            "sissss",   // data types
            $lastname,
            $age,
            $country,
            $email,
            $lang,
            $payment
        );

        $lastname = $data['lastname'];
        $age = $data['age'];
        $country = $data['country'];
        $email = $data['email'];
        $lang = implode(",", $data['lang']);
        $payment = $data['payment'];

        $stmt->execute();
        echo "<h4>Dodano dane do bazy</h4>";
    } else {
        echo "<h4>Nieprawidłowe dane w formularzu</h4>";
        echo "<p>$errors</p>";
    }
}

function pokaz($db) {
    $sql = "SELECT * FROM klienci";
    $fields = ["Id", "Nazwisko", "Wiek", "Panstwo", "Email", "Zamowienie", "Platnosc"];
    $result = $db->select($sql, $fields);
    echo $result;
}


function pokaz_zamowienie($db, $tut) {
    $sql = "SELECT * FROM klienci WHERE Zamowienie LIKE '%$tut%'";
    $fields = ["Id", "Nazwisko", "Wiek", "Panstwo", "Email", "Zamowienie", "Platnosc"];

    $result = $db->select($sql, $fields);
    echo $result;
}

function statystyki($db) {
    $mysqli = $db->getMysqli();

    $result = $mysqli->query("SELECT COUNT(*) FROM klienci");
    $all = $result->fetch_array();
    $all = $all[0];

    $result = $mysqli->query("SELECT COUNT(*) FROM klienci WHERE Wiek<18");
    $underage = $result->fetch_array();
    $underage = $underage[0];

    $result = $mysqli->query("SELECT COUNT(*) FROM klienci WHERE Wiek>=50");
    $old = $result->fetch_array();
    $old = $old[0];


    echo "<p>Liczba wszystkich zamówień: $all</p>";
    echo "<p>Liczba zamowien od osob w wieku < 18 lat: $underage</p>";
    echo "<p>Liczba zamowien od osob w wieku >= 50 lat: $old</p>";
}
?>
