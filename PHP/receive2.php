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
foreach ($_REQUEST as $key=>$value) {
    echo "$key = $value <br>";
}
?>
