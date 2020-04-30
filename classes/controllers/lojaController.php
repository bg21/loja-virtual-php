<?php
    namespace controllers; //o namespace precisa ser o nome da pasta 

    class lojaController{
        public function __construct(){
            $this->lojaModels = new \models\lojaModels();
        }
        
        public function home(){
            if(isset($_GET['addCarrinho'])){
                $idProduto = (int) $_GET['addCarrinho'];
                if(isset($_SESSION['carrinho']) == false){
                    $_SESSION['carrinho'] = [];
                }
                if(isset($_SESSION['carrinho'][$idProduto]) == false){
                    //é a primeira vez que está adicionando o produto
                    $_SESSION['carrinho'][$idProduto] = 1;
                }else{
                    $_SESSION['carrinho'][$idProduto]++;
                }
                \Painel::redirectPHP(INCLUDE_PATH);
                \Painel::redirect(INCLUDE_PATH);
                die();
            }
            $this->lojaModels->index(); 
        }
    }
?>
