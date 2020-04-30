<?php
    class Conexao{
        private static $pdo;
        
        public static function conectar(){
            if(self::$pdo == null){
                try {
                    self::$pdo = new PDO('mysql:host='.host.';dbname='.dbname, user, senha, [PDO::MYSQL_ATTR_INIT_COMMAND =>  "SET NAMES 'UTF8'"]);
                    self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Vai mostrar erros caso exista.
                } catch (Exception $e) { /*Pegue a exception e coloque na variável $e */
                    echo 'Erro ao conectar ao banco de dados';
                } 
            }
            return self::$pdo;   
        }
    }
?>