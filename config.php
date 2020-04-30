<?php
    session_start();
    ob_start();
    date_default_timezone_set('America/Sao_Paulo');
    $autoLoad = function($class){
        if($class == 'Email'){
            include('classes/phpmailer/PHPMailerAutoload.php');
        }
        include('classes/'.$class.'.php');
    };
    spl_autoload_register($autoLoad);

    
    define('INCLUDE_PATH', 'http://localhost/34-loja-virtual/');
    
    define('INCLUDE_PATH_PAINEL', INCLUDE_PATH.'Painel/');
    
    define('BASE_DIR_PAINEL', __DIR__.'/Painel');
    /*acrescentar diretório /Painel/ após incluir o site, para isso crie,
    uma pasta chamada Painel e coloque todo o painel dentro */
    
    const host = 'localhost';
    const dbname = 'controle_estoque';
    const user = 'root';
    const senha = '';

    
    
?>