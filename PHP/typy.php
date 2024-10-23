<?php
function printType($name, $var) {
    if (is_array($var)) {
        echo "$name:<br>";
//        print_r($var);
        var_dump($var);
        echo "<br><br>";
    }
    else {
        echo "$name = $var, type: " . gettype($var) . "<br><br>";
    }
}
function typy() {
    $varInt = 1234;
    $varFloat = 567.789;
    $var1 = 1;
    $var0 = 0;
    $varTrue = true;
    $varChar = "0";
    $varString = "Typy w PHP";
    $intArray = [1, 2, 3, 4];
    $emptyArray = [];
    $stringArray = ["zielony", "czerwony", "niebieski"];
    $mixedArray = ["Agata", "Agatowska", 4.67, true];
    $objDatetime = date("d-m-Y");

    printType("varInt", $varInt);
    printType("varFloat", $varFloat);
    printType("var1", $var1);
    printType("var0", $var0);
    printType("varChar", $varChar);
    printType("varString", $varString);
    printType("intArray", $intArray);
    printType("emptyArray", $emptyArray);
    printType("stringArray", $stringArray);
    printType("mixedArray", $mixedArray);
    printType("objDatetime", $objDatetime);

    echo "\$var1 == \$varTrue: " . ($var1 == $varTrue ? "true" : "false") . "<br><br>";
    echo "\$var1 === \$varTrue: " . ($var1 === $varTrue ? "true" : "false") . "<br><br>";
    echo "\$var0 == \$varChar: " . ($var0 == $varChar ? "true" : "false") . "<br><br>";
    echo "\$var0 === \$varChar: " . ($var0 === $varChar ? "true" : "false") . "<br><br>";
}
typy();
?>
