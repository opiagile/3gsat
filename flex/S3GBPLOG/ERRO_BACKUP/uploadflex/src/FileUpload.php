<?php

$nomeImg = $_GET[nomeImagem];
$dirImg = dirname(__FILE__)."/img/";

move_uploaded_file($_FILES['Filedata']['tmp_name'],$dirImg.$nomeImg);

?>