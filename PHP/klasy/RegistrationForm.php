<?php

class RegistrationForm {
    protected $user;

    protected $form = '
        <h3>Formularz rejestracji</h3><p>
        <form action="index.php" method="post">
            <label for="userName">Nazwa użytkownika:</label>
            <input name="userName" id="userName">

            <label for="fullName">Imię i nazwisko:</label>
            <input name="fullName" id="fullName">

            <label for="passwd">Hasło:</label>
            <input name="passwd" id="passwd">

            <label for="email">Email</label>
            <input name="email" id="email">

            <input type="submit" value="Rejestruj">
            <input type="reset" value="Anuluj">
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

        ];
    }
}

?>
