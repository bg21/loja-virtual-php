
<?php
    include('config.php');
    $lojaController = new \controllers\lojaController();
    $finalizarController = new \controllers\finalizarController();

    Router::get('/', function() use ($lojaController){
        $lojaController->home();
    }); 

    Router::get('/finalizar-pedido', function() use ($finalizarController){
        $finalizarController->finalizarPedido();
    }); 


?>
