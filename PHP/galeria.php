<?php
function galeria($rows, $cols)
{
    $imgNumber = $rows * $cols;
    for ($i = 1; $i <= $imgNumber; $i++) {
        print("<img src='img/miniaturki/obraz$i.JPG' alt='obraz$i'>");
        if (fmod($i, $rows) == 0) {
            print("<br><br>");
        }
    }
}

galeria(3, 3);
galeria(4, 2);
galeria(2, 4);
?>
