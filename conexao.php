<?php
    $con = mysqli_connect('localhost','root','','mecanica');
    if (mysqli_connect_errno()) {
        echo "erro: " .  mysqli_connect_error();
    }
?>