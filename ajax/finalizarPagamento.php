<?php
    include('../config.php'); 

    $data['token'] = "tokengeradopravc"; //está em "Vendedor"
    $data['email'] = 'oseuemail'; //está em "Vendedor"
    $data['currency'] = 'BRL'; //vai ficar em real
    $data['reference'] = uniqid();
    $data['notificationURL'] = 'http://localhost/34-loja-virtual/retorno.php';

    $index = 1;

    $itensCarrinho = $_SESSION['carrinho'];
    foreach ($itensCarrinho as $key => $value) {
        $idProduto = $key;
        $produto = \Conexao::conectar()->prepare("SELECT * FROM tb_painel_produtos WHERE id = ?");
        $produto->execute([$idProduto]);
        $produto = $produto->fetch();
        
        $preco = $produto['preco'];
        $data["itemId$index"] = $index;
        $data["itemQuantity$index"] = $value;
        $data["itemDescription$index"] = $produto['nome'];
        $data["itemAmount$index"] = number_format($produto['preco'], 2, '.', '');

        $index++;
        $sql = \Conexao::conectar()->prepare("INSERT INTO tb_painel_pedidos VALUES (null, ?, ?, ?, ?)");
        $sql->execute([$data['reference'], $produto['id'], $value, 'Pendente']);
    }
    
    $url = "https://ws.sandbox.pagseguro.uol.com.br/v2/checkout";
	$data = http_build_query($data);

	$curl = curl_init($url);
	curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
	curl_setopt($curl,CURLOPT_POST,true);
	curl_setopt($curl,CURLOPT_POSTFIELDS,$data);
	curl_setopt($curl,CURLOPT_HTTP_VERSION,CURL_HTTP_VERSION_1_1);
	$xml = curl_exec($curl);


	curl_close($curl);
	$xml = simplexml_load_string($xml);

    echo $xml->code;
    
    $_SESSION['carrinho'] = []; //vai esvaziar o carrinho
    //unset($_SESSION['carrinho']); //vai esvaziar o carrinho
?>