<?php
    namespace models; //o namespace precisa ser o nome da pasta 

    class lojaModels{
        public function index(){
            //início da plataforma inteira
            $produtos = \Conexao::conectar()->prepare("SELECT * FROM tb_painel_produtos");
            $produtos->execute();
            $produtos = $produtos->fetchAll();
            
            include('classes/views/home.php');
        }

        public static function totalItensCarrinho(){
            if(isset($_SESSION['carrinho'])){
                $amout = 0;
                foreach ($_SESSION['carrinho'] as $key => $value) {
                    $amout+=$value;
                }
            }else{
                return 0;
            }
            
            return $amout;
        }
    }
?>