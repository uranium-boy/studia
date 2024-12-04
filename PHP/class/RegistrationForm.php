<?php

class RegistrationForm {
    protected $user;

    protected $form = '
    <style>
    input {
    margin: 10px 0;
    }
    </style>
        <h3>Formularz rejestracji</h3><p>
        <form action="index.php" method="post">
            <label for="userName">Nazwa użytkownika:</label>
            <input name="userName" id="userName"><br>

            <label for="fullName">Imię i nazwisko:</label>
            <input name="fullName" id="fullName"><br>

            <label for="passwd">Hasło:</label>
            <input name="passwd" id="passwd"><br>

            <label for="email">Email</label>
            <input name="email" id="email"><br>

            <input type="submit" name="submit" value="Rejestruj">
            <input type="reset" value="Anuluj">
            <input type="submit" name="submit" value="Wyświetl wszystkie">
        </form></p>
    ';

    function __construct() {
        echo $this->form;
    }

    function checkUser() {
        $args = [
            'userName' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[0-9A-Za-z_-]{2,25}$/']],
            'fullName' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[0-9A-ZŁŚŻÓa-ząęłńśćżżó-]{2,25}\s[A-ZŁŚŻÓa-ząęłńśćżó-]{2,25}$/']],
            'passwd' => ['filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^.{5,}$/']],
            'email' => ['filter' => FILTER_VALIDATE_EMAIL]
        ];

        $data = filter_input_array(INPUT_POST, $args);

        $errors = "";
        foreach ($data as $key => $val) {
            if ($val === false or $val === null) {
                $errors .= $key . " ";
            }
        }

        if ($errors === "") {
            $this->user = new User($data['userName'], $data['fullName'], $data['email'], $data['passwd']);
        } else {
            echo "<p>Błędne dane: $errors</p>";
            $this->user = NULL;
        }
        return $this->user;
    }
}

?>
