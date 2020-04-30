<?php
    namespace controllers; //o namespace precisa ser o nome da pasta 

    class finalizarController{
        public function __construct(){
            $this->finalizarModels = new \models\finalizarModels();
        }
        public function finalizarPedido(){
            $this->finalizarModels->finalizarPedido(); 
        } 
    }
?>