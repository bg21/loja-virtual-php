<?php
   include('includes/carregaHead.php'); 
?>

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
   início
   <div class="produtos">

      <?php
         foreach ($produtos as $key => $value) {
            $imagens = \Conexao::conectar()->prepare("SELECT * FROM tb_painel_produtos_imagens WHERE produto_id = ? LIMIT 1");
            $imagens->execute([$value['id']]);
            $imagens = $imagens->fetch();
      ?>
      <div class="single_produtos">
         <div class="single_wraper">
            <div class="single_wraper_img">
               <img src="<?php echo INCLUDE_PATH_PAINEL; ?>uploads/<?php echo $imagens['imagem']; ?>" alt="">
            
            <p><?php echo $value['nome']; ?></p>
            <p>Preço: <?php echo Painel::convertMoney($value['preco']); ?></p>
            <a href="<?php echo INCLUDE_PATH; ?>?addCarrinho=<?php echo $value['id']; ?>">Comprar</a>
            </div>
         </div>
      </div>
      <?php
         } 
      ?>
   </div>
</div>

<?php
   include('includes/carregaScripts.php'); 
?>