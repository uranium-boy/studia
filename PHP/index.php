<?php

include 'klasy/User.php';

$user1 = new User('kp', 'Kubus Puchatek', 'kubus@stumilowylas.pl', 'nielubietygryska');
$user1->show();

$user2 = new User('Uncle', 'Wujek Jim', 'uncle.jim@from.america', 'PolandGreatestCountry');
$user2->show();

?>
