<?php

if (isset($_POST['zapisz']) && $_POST['zapisz'] == 'Zapisz' && !isset($_GET['pic'])) {
    if (is_uploaded_file($_FILES['zdjecie']['tmp_name'])) {
        $typ = $_FILES['zdjecie']['type'];
        if ($typ === 'image/jpeg') {
            $filename = $_FILES['zdjecie']['name'];
            $filename = strtolower($filename);
            $linkPath = 'zdjecia/' . $filename;

            move_uploaded_file($_FILES['zdjecie']['tmp_name'], './' . $linkPath);

            $random = uniqid('img_');
            $zdj = 'miniaturki/' . $random . '.jpg';
            copy($linkPath, './' . $zdj);

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

            $miniPath = 'miniaturki/mini-' . $filename;
            imagejpeg($nowe, $miniPath, 100);
            echo "nowe=/$miniPath<br>";
            imagedestroy($nowe);
            imagedestroy($obraz);
            unlink($zdj);

            $dlugosc = strlen($filename);
            $dlugosc -= 4;
            $filename = substr($filename, 0, $dlugosc);
            echo "link=$link <br>";
            header('location:zdjecia.php?pic='.$filename);
        } else {
            header('location:zdjecia.html');
        }
    }
}

if (isset($_GET['pic']) && !empty($_GET['pic'])) {
    echo '<a href="zdjecia/' . $_GET['pic'] . '.jpg">Zdjęcie</a><br>';
    echo '<a href="miniaturki/mini-' . $_GET['pic'] . '.jpg">Miniatura</a><br><br>';
    echo '<a href="zdjecia.html">Powrót</a>';

    $handle = opendir('miniaturki/');

    if (!$handle) {
        echo "Otwracie katalogu nie powiodło się :(";
        exit();
    }

    echo "<h4>Galeria zdjęć</h4>";
    $number = 0;

    while ($file = readdir($handle)) {
        if ($file !== "." && $file !== "..") {
            $original = "zdjecia/" . str_replace('mini-', '', $file);
            echo '<a href="' . $original . '"><img src="miniaturki/' . $file . '" style="margin:10px;"></a>';
            $number++;
        }
    }
    echo "<p>Aktualnie w galerii jest $number zdjęć.</p>";
    closedir();
}
?>
