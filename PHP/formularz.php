<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
        <title>Formularz</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <h3>Przykładowy formularz HTML:</h3>
        <form action="odbierz4.php" method="post">
            <label for="lastname">Nazwisko:</label>
            <input id="lastname" type="text" name="lastname"><br>
            <label for="age">Wiek:</label>
            <input id="age" type="number" name="age"><br>
            <label for="country">Państwo:</label>
            <select id="country" name="country">
                <option value="pl">Polska</option>
                <option value="uk">Wielka Brytania</option>
            </select><br>
            <label for="email">Adres e-mail:</label>
            <input id="email" type="email" name="email"><br>

            <h4>Zamawiam tutorial z języka:</h4>
            <?php
                $languages = ["C", "C++", "Java", "C#", "HTML", "CSS", "XML", "PHP", "JS"];
                foreach ($languages as $lang) {
                    echo "<input id='$lang' type='checkbox' name='lang[]' value='$lang'>";
                    echo "<label for='$lang'>$lang</label>";
                }
            ?>

            <h4>Sposób zapłaty</h4>
            <input id="eurocard" type="radio" name="payment" value="eurocard">
            <label for="eurocard">eurocard</label>
            <input id="visa" type="radio" name="payment" value="visa">
            <label for="visa">visa</label>
            <input id="wire" type="radio" name="payment" value="wire">
            <label for="wire">przelew bankowy</label>
            <br><br>
            <input type="submit" value="Wyślij">
            <input type="reset" value="Anuluj">
        </form>
    </body>
</html>
