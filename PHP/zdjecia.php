<?php

if (isset($_POST['zapisz']) && $_POST['zapisz'] == 'Zapisz' && !isset($_GET['pic'])) {
    if (is_uploaded_file($_FILES['zdjecie']['tmp_name'])) {
        $typ = $_FILES['zdjecie']['type'];
        if ($typ === 'image/jpeg') {
            $link = $_FILES['zdjecie']['name'];
            $link = strtolower($link);

            move_uploaded_file($_FILES['zdjecie']['tmp_name'], './' . $link);

            $random = uniqid('img_');
            $zdj = $random . '.jpg';
            copy($link, './' . $zdj);

            list($width, $height) = getimagesize($zdj);

            $wys = $_POST['wys'];
            $szer = $_POST['szer'];

            $skalaWys = 1;
            $skalaSzer = 1;
            $skala = 1;

            if ($width > $szer) $skalaSzer = $szer / $width;
            if ($height > $wys) $skalaWys = $wys / $height;
            if ($skalaWys <= $skalaSzer) $skala = $skalaWys;

            $newH = $height * $skala;
            $newW = $width * $skala;

            header('Content-Type: image/jpeg');
            $nowe = imagecreatetruecolor($newW, $newH);
            $obraz = imagecreatefromjpeg($zdj);
            imagecopyresampled($nowe, $obraz, 0, 0, 0, 0, $newW, $newH, $width, $height);
            imagejpeg($nowe, './mini-' . $link, 100);
            echo "nowe=/mini-$link<br>";
            imagedestroy($nowe);
            imagedestroy($obraz);
            unlink($zdj);

            $dlugosc = strlen($link);
            $dlugosc -= 4;
            $link = substr($link, 0, $dlugosc);
            echo "link=$link <br>";
            header('location:zdjecia.php?pic='.$link);
        } else {
            header('location:zdjecia.html');
        }
    }
}

if (isset($_GET['pic']) && !empty($_GET['pic'])) {
    echo '<a href="' . $_GET['pic'] . '.jpg">Zdjęcie</a><br>';
    echo '<a href=mini-' . $_GET['pic'] . ".jpg>Miniatura</a><br><br>";
    echo '<a href="zdjecia.html">Powrót</a>';
}
?>
