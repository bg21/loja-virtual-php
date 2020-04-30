$(function(){
    $('a.pagar').click(function(e){
        e.preventDefault();
        $.ajax({
            url: include_path_js+'ajax/finalizarPagamento.php'
        }).done(function(data){
            console.log(data);
            var lightBoxAberto = PagSeguroLightbox({
                code: data 
                //código da requisição de pagamento
            },{
                //foi aberto um outro objeto
                //cliente chegou até o final do pagaemtno
                success: function(transactionCode){
                    console.log('Usuário foi até o final');
                    location.href=include_path_js;
                    //criar página de sucesso
                },
                abort: function(){
                    console.log('Usuário não foi até o final');
                    location.href=include_path_js;
                    //criar página de erro
                }
            });
        });
    });
}); 