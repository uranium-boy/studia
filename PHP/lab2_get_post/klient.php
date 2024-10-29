<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <?php
        $lastname = htmlspecialchars($_GET['lastname']);
        $country = htmlspecialchars($_GET['country']);
        $email = htmlspecialchars($_GET['email']);

        echo "<h1>Dane klienta</h1>";
        echo "<p>Nazwisko: $lastname</p>";
        echo "<p>Kraj: $country</p>";
        echo "<p>Email: $email</p>";
        ?>
    </body>
</html>

