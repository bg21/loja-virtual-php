<?php 
    class Painel{
        public static function redirect($url){
			echo '<script>location.href="'.$url.'"</script>';
			die();
        }
        public static function redirectPHP($url){
            header('Location: '.$url);
            die();
        }
        public static function logado(){
            return isset($_SESSION['login']) ? true : false;
        }
        public static function logout(){
            setcookie('lembrarme', true, time() - 1, '/'); /*quando sair 
            //vai destruir o cookie se existir
            //essa '/' é pra pegar em todo o site*/
            session_destroy();
            header('Location: '.INCLUDE_PATH_PAINEL);
            die();
        }
        public static function alerta($tipo, $mensagem){
            if($tipo == 'sucesso'){
                echo '<div class="box_alerta sucesso"><i class="fas fa-check-circle"></i> '.$mensagem.'</div>';
            }else if($tipo == 'erro'){
                echo '<div class="box_alerta erro"><i class="fas fa-exclamation-circle"></i> '.$mensagem.'</div>';
            }else if($tipo == 'aviso'){
                echo '<div class="box_alerta aviso"><i class="fas fa-exclamation-circle"></i> '.$mensagem.'</div>';
            }
        }

        //carregar js dinamicamente
         public static function carregarJS($arquivos, $page){
            $url = @explode('/', $_GET['url'])[0];
            if($page == $url){
                foreach ($arquivos as $key => $value) {
                    echo '<script src="'.INCLUDE_PATH_PAINEL.'js/'.$value.'"></script>';
                }
            }
        }


        
        public static function convertMoney($valor){
            return number_format($valor, 2, ',', '.');
        }
        



        public static function formatarMoeda($valor){
            $valor = str_replace('.', '', $valor);
            $valor = str_replace(',', '.', $valor);
            return $valor;
        }


        public static function carregarPagina(){
            if(isset($_GET['url'])){
                $url = explode('/', $_GET['url']);
                if(file_exists('pages/'.$url[0].'.php')){
                    include('pages/'.$url[0].'.php');
                }else{
                    //Caso não exista a página
                    //dê um include em uma página 404 personalizada
                    //header('Location: '.INCLUDE_PATH_PAINEL);
                    include('pages/erro404.php');
                }
            }else{
                include('pages/home.php');
            }
        }
        public static function imagemValida($img){
            //https://www.php.net/manual/pt_BR/function.image-type-to-mime-type.php
            if( $img['type'] == 'image/jpeg' || 
                $img['type'] == 'image/png' || 
                $img['type'] == 'image/jpg'){
                //Verificar o tamanho agora
                $tamanho = intval($img['size']/1024);
                if($tamanho < 400){
                    return true;
                }else{
                    return false;
                }
                //é uma imagem
            }else{
                return false;
                //não é uma imagem
            }
        }
        public static function uploadFile($file){
            $formatoArquivo = explode('.',$file['name']); //assim vc pega o nome do arquivo
            $nomeImagem = uniqid().'.'.$formatoArquivo[count($formatoArquivo) - 1]; //vai gerar um id único
            if(move_uploaded_file($file['tmp_name'], BASE_DIR_PAINEL.'/uploads/'.$nomeImagem)){
                return $nomeImagem;
            }else{
                return false;
            }
        }
        public static function deletarFile($file){
            @unlink('uploads/'.$file);
        }

        public static function select($tabela, $query, $arr){
            $sql = Conexao::conectar()->prepare("SELECT * FROM $tabela WHERE $query");
            $sql->execute($arr);
            return $sql->fetch();
        }
        //Vamos usar esse método pra selecionar tudo, já com paginação
        public static function selectAll($tabela, $inicio = null, $final = null){
            if($inicio == null && $final == null){ //quer dizer que tá selecionando tudo, é o padrão
                $sql = Conexao::conectar()->prepare("SELECT * FROM $tabela ");
            }else{
                $sql = Conexao::conectar()->prepare("SELECT * FROM $tabela LIMIT $inicio, $final");
            }
            $sql->execute();
            return $sql->fetchAll();
        }

        //Usuários online
        public static function listarUsuariosOnline(){
            self::limparUsuariosOnline();
            $sql = Conexao::conectar()->prepare("SELECT * FROM tb_painel_online");
            $sql->execute();
            return $sql->fetchAll();
        }
        public static function limparUsuariosOnline(){
            /*Quando passar do tempo limite de dois minutos o usuário
            online será deletado*/
            /*Aqui ñ precisa preparar a execução */
            $date = date('Y-m-d H:i:s');
            $sql = Conexao::conectar()->exec("DELETE FROM tb_painel_online WHERE ultima_acao < '$date' - INTERVAL 2 MINUTE");
        }
        public static function visitasTotais(){
            $sql = Conexao::conectar()->prepare("SELECT * FROM tb_painel_browser");
            $sql->execute();
            return $visitasTotais = $sql->rowCount();
        }
        public function visitasHoje(){
            $data = date('Y-m-d');
            $sql = Conexao::conectar()->prepare("SELECT * FROM tb_painel_browser WHERE dia = ?");
            $sql->execute([$data]);
            return $visitasHoje = $sql->rowCount();
        }

        public static $cargos = [
            '1' => 'Usuário',
            '2' => 'Administrador'
        ];
        function verificaPermissaoMenu($permissao){
            if($_SESSION['cargo'] >= $permissao){
                //dá pra continuar na página
                return;
            }else{
                echo 'style="display:none;"';
            }
        }
        function verificaPermissaoPagina($permissao){
            if($_SESSION['cargo'] >= $permissao){
                //dá pra continuar na página
                return;
            }else{
                include('../Painel/pages/permissao_negada.php');
                die();
            } 
        }

        //Gerar slug
        public static function gerarSlug($str){
            $str = mb_strtolower($str); //Vai converter todas as letras maiúsculas pra minúsculas
			$str = preg_replace('/(â|á|ã)/', 'a', $str);
			$str = preg_replace('/(ê|é)/', 'e', $str);
			$str = preg_replace('/(í|Í)/', 'i', $str);
			$str = preg_replace('/(ú)/', 'u', $str);
			$str = preg_replace('/(ó|ô|õ|Ô)/', 'o',$str);
			$str = preg_replace('/(_|\/|!|\?|#)/', '',$str);
			$str = preg_replace('/( )/', '-',$str);
			$str = preg_replace('/ç/','c',$str);
			$str = preg_replace('/(-[-]{1,})/','-',$str);
			$str = preg_replace('/(,)/','-',$str);
			$str=strtolower($str);
            return $str;
            /*Significa que vai procurar por  qualquer um desses â|á|ã ou as outras 
            letras e, i, o, u e caracteres especiais e vai trocar pela letra normal ou pelo -
            e em seguida vai informar em qual variável quer que isso ocorra, no caso, a $str, 
            que lá no formulário é o $slug*/
        }

        /*Vai deixar os campos preenchidos com o que o usuário preencheu mesmo 
        depois de ocorrer um erro na página */
        //Lembrar campos
        public static function lembrarCampo($post){
            if(isset($_POST[$post])){
                echo $_POST[$post];
            }
        }



    }
?>