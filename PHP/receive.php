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
    $languages = join(", ", $_REQUEST['lang']);
    echo "$languages <br>";
}
else echo "Nie ma";

// else echo "Nie wybrano żadnego języka <br>";
?>
</div>
</body>
</html>
