<?php
   include('includes/carregaHead.php'); 
?>

<base base="<?php echo INCLUDE_PATH; ?>">

<header>
   <div class="container">
      <a href="<?php echo INCLUDE_PATH; ?>">Loja virtual</a>
      <nav>
         <ul>
            <li><a href="javascript:void(0);">Carrinho (<?php echo \models\lojaModels::totalItensCarrinho(); ?>)</a></li>
            <li><a href="<?php echo INCLUDE_PATH; ?>finalizar-pedido">Finalizar pedido</a></li>
         </ul>
      </nav>
   </div>
</header>

<div class="container">
    <div class="pedidos">
        <h2>Meu carrinho</h2>
        <table>
            <tr>
                <td>Produto</td>
                <td>Quantidade</td>
                <td>Preço</td>
            </tr>
            <?php
                $total = 0;
                foreach ($itensCarrinho as $key => $value) {
                    $idProduto = $key;
                    $produto = \Conexao::conectar()->prepare("SELECT * FROM tb_painel_produtos WHERE id = ?");
                    $produto->execute([$idProduto]);
                    $produto = $produto->fetch();
                    
                    $preco = $value * $produto['preco'];
                    $total+=$preco;
            ?>
            <tr>
                <td><?php echo $produto['nome']; ?></td>
                <td><?php echo $value; ?></td>
                <td>R$ <?php echo \Painel::convertMoney($preco); ?></td>
            </tr>
            <?php
                } 
            ?>
        </table>
    </div>


    <div class="finalizar_pedido">
        <h3>Total: R$ <?php echo \Painel::convertMoney($total); ?></h3>
        <a class="btn pagar" href="">Realizar pagamento</a>
        <div class="clear"></div>
    </div>
</div>

<?php
   include('includes/carregaScripts.php'); 
?>