<?php
    namespace models; //o namespace precisa ser o nome da pasta 

    class finalizarModels{
        public function finalizarPedido(){
            $itensCarrinho = $_SESSION['carrinho'];

            include('classes/views/finalizar-pedido.php');
        }
    }
?>