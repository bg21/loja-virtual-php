-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Abr-2020 às 21:24
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controle_estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_browser`
--

CREATE TABLE `tb_painel_browser` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `dia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_calendario`
--

CREATE TABLE `tb_painel_calendario` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `color` varchar(20) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_cargos`
--

CREATE TABLE `tb_painel_cargos` (
  `id_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(255) NOT NULL,
  `descricao_cargo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_painel_cargos`
--

INSERT INTO `tb_painel_cargos` (`id_cargo`, `nome_cargo`, `descricao_cargo`) VALUES
(1, 'Usuário', 'bla bla'),
(2, 'Administrador', 'asdfasdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_configuracoes`
--

CREATE TABLE `tb_painel_configuracoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `geral_fonte` varchar(60) NOT NULL,
  `geral_fonte_tamanho` int(11) NOT NULL,
  `cor_sidebar` varchar(30) NOT NULL,
  `sidebar_fonte` varchar(60) NOT NULL,
  `sidebar_fonte_tamanho` int(11) NOT NULL,
  `cor_menu` varchar(30) NOT NULL,
  `cor_hover_menu` varchar(30) NOT NULL,
  `menu_fonte` varchar(60) NOT NULL,
  `menu_fonte_tamanho` int(11) NOT NULL,
  `cor_breadcumb` varchar(30) NOT NULL,
  `cor_breadcumb_fonte` varchar(60) NOT NULL,
  `cor_breadcumb_tamanho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_configuracoes_fontes`
--

CREATE TABLE `tb_painel_configuracoes_fontes` (
  `id_fontes` int(11) NOT NULL,
  `fontes` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_configuracoes_fontes_tamanhos`
--

CREATE TABLE `tb_painel_configuracoes_fontes_tamanhos` (
  `id_fontes_tamanhos` int(11) NOT NULL,
  `tamanhos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_online`
--

CREATE TABLE `tb_painel_online` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `ultima_acao` datetime NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_pedidos`
--

CREATE TABLE `tb_painel_pedidos` (
  `id` int(11) NOT NULL,
  `reference_id` varchar(100) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_produtos`
--

CREATE TABLE `tb_painel_produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `largura` varchar(20) NOT NULL,
  `altura` varchar(20) NOT NULL,
  `comprimento` varchar(20) NOT NULL,
  `peso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_painel_produtos`
--

INSERT INTO `tb_painel_produtos` (`id`, `nome`, `descricao`, `preco`, `quantidade`, `largura`, `altura`, `comprimento`, `peso`) VALUES
(1, 'Produto 1', 'Produto', '12.00', 1, '	43.2', '36.3', '30', '3.4'),
(2, 'Produto 2', 'Produto', '320.00', 1, '22', '22', '22', '22');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_produtos_imagens`
--

CREATE TABLE `tb_painel_produtos_imagens` (
  `id_produto` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_painel_produtos_imagens`
--

INSERT INTO `tb_painel_produtos_imagens` (`id_produto`, `produto_id`, `imagem`) VALUES
(1, 1, '5dae473930454.jpg'),
(2, 2, '5dae474ccaffa.jpg'),
(3, 2, '5dae474ccb757.jpg'),
(4, 3, '5daf469e5ba86.jpg'),
(5, 4, '5daf4de6c157b.jpg'),
(6, 5, '5daf4f6f80ad9.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_painel_usuarios`
--

CREATE TABLE `tb_painel_usuarios` (
  `id` int(11) NOT NULL,
  `empresa` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `texto_alternativo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site_depoimento`
--

CREATE TABLE `tb_site_depoimento` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `depoimento` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `texto_alternativo` varchar(255) NOT NULL,
  `ordem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site_depoimento`
--

INSERT INTO `tb_site_depoimento` (`id`, `nome`, `depoimento`, `foto`, `texto_alternativo`, `ordem_id`) VALUES
(21, 'Sasuke Uchiha', '\"Eu odeio um monte de coisas, e eu particularmente não gosto de nada. O que eu tenho não é um sonho, porque eu vou torná-lo uma realidade. Vou restaurar meu clã, e matar um certo alguém.\"', '5d7fc61d1f844.jpg', 'Sasuke', 0),
(22, 'Kakashi Hatake', 'asdf adsf adsf adsf ads afs', '5d7fd0b4481e4.jpg', 'Naruto e Sasukegagadgdaga', 0),
(23, 'Avada askdf asdf sdf ', 'dasf asdf adsf asdf ads fdsa ', '5d7fd0bc18225.jpg', 'Naruto', 0),
(24, 'Por que não está aparecendo', 'asldfjk asdfkjla sfkjldlaskjldfjklasd', '5d7fd0c45f4b2.jpg', 'Naruto e Sasuke', 0),
(25, 'asdfasdf', 'asfasdf', '5d7fc84385141.jpg', 'Naruto e Sasuke', 0),
(26, 'dafsdf', 'asdfasd', '5d7fc9a93e794.jpg', 'Naruto', 0),
(27, 'adsfasdfaf', 'asdfasdfasdf', '5d805019cd920.jpg', 'Naruto e Sasuke', 27),
(29, 'Julian Costa', 'can be attached to any element. When you hover the element with your mouse, the title attribute is displayed in a little box next to the element, just like a native tooltip.', '5d80fa6e396c9.jpg', 'Sasuke', 29),
(30, 'adsfasdfasdf', 'adsfasdfasdf', '5d8102a6eb917.jpg', 'adsfasdfasdfa sd asdf asdfasdf', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site_geral`
--

CREATE TABLE `tb_site_geral` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site_geral`
--

INSERT INTO `tb_site_geral` (`id`, `nome`, `descricao`) VALUES
(1, 'Juliana da Silva Costa', 'Duis sed lacus consequat orci rutrum ornare id ac leo. Fusce rhoncus cursus massa quis aliquam. Phasellus et gravida sapien. Nam tempus mollis mauris, ut mollis leo mollis et. Cras dolor odio, condimentum et felis ut, suscipit rutrum sem.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site_localizacao`
--

CREATE TABLE `tb_site_localizacao` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `regionName` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `horarioAtual` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site_localizacao`
--

INSERT INTO `tb_site_localizacao` (`id`, `ip`, `country`, `regionName`, `city`, `horarioAtual`) VALUES
(1, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(2, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(3, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(4, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(5, '::1', 'Desconhecido', 'Desconhecido', 'Desconhecido', '2019-09-16'),
(6, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(7, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(8, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-16'),
(9, '::1', 'Desconhecido', 'Desconhecido', 'Desconhecido', '2019-09-17'),
(10, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(11, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(12, '::1', 'Desconhecido', 'Desconhecido', 'Desconhecido', '2019-09-18'),
(13, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(14, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(15, '::1', 'Desconhecido', 'Desconhecido', 'Desconhecido', '2019-09-18'),
(16, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(17, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(18, '127.0.0.1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(19, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-18'),
(20, '::1', 'Desconhecido', 'Desconhecido', 'Desconhecido', '2019-09-20'),
(21, '::1', 'Brazil', 'Federal District', 'Brasília', '2019-09-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site_servico`
--

CREATE TABLE `tb_site_servico` (
  `id` int(11) NOT NULL,
  `icone` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `texto_alternativo` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site_servico`
--

INSERT INTO `tb_site_servico` (`id`, `icone`, `imagem`, `texto_alternativo`, `titulo`, `descricao`) VALUES
(2, '', '5d7fc65c2ed68.jpg', 'adfasdfa', 'Marketing Digital', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
(5, '', '5d7fc6efbac7c.jpg', 'asdfasdfasd', 'Marketing', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
(6, '', '5d7fd05ccd72b.jpg', 'adfasdfasdf', 'PHP 7', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum non quam augue. In tincidunt ante ut consectetur molestie. Donec quis efficitur libero, et pellentesque urna. Phasellus viverra ultricies sem ullamcorper faucibus. Editado'),
(7, '', '5d7fd06561041.jpg', 'asdfasdfsdf', 'akjlsdfk', '<p>kjlkjlklajkjldf</p>'),
(8, '', '5d7fca4605d9a.jpg', 'asdfasdfasdf', 'asdfasdf', 'dafdfasd'),
(9, '', '5d7fca9e90ae1.jpg', 'asdfasdfasdf', 'asdfasdfasdf', 'asfasdf'),
(10, '', '5d810263d5cea.jpg', 'Sasukeeeee', 'ahkdlsflhkashkldfhklsdf', 'ad asdafsdfa sd f asdf asdfasdfa sdfa sdfasdf asdfa ds');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_site_slide`
--

CREATE TABLE `tb_site_slide` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `slide` varchar(255) NOT NULL,
  `texto_alternativo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_site_slide`
--

INSERT INTO `tb_site_slide` (`id`, `nome`, `slide`, `texto_alternativo`) VALUES
(1, 'Slide Naruto', '5d7fd08656541.jpg', 'ddddddddddddddddddddd'),
(2, 'Slide Sasuke', '5d7fd07bdbc58.jpg', 'Sasukeeeee'),
(3, 'asdfadfa', '5d7fcae5df738.jpg', 'Sasukeeeee'),
(4, 'asdfasdf', '5d7fcb3196d1f.jpg', 'Naruto e Sasuke'),
(5, 'asdfsdf', '5d7fcb3a63ead.jpg', 'Naruto'),
(6, 'asdfasdf', '5d7fcb436d19a.jpg', 'asdfasdfasdf'),
(7, 'adfasdfasdf', '5d810673bb69d.jpg', 'dfdsfasdf');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_painel_browser`
--
ALTER TABLE `tb_painel_browser`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_calendario`
--
ALTER TABLE `tb_painel_calendario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_cargos`
--
ALTER TABLE `tb_painel_cargos`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Índices para tabela `tb_painel_configuracoes`
--
ALTER TABLE `tb_painel_configuracoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_configuracoes_fontes`
--
ALTER TABLE `tb_painel_configuracoes_fontes`
  ADD PRIMARY KEY (`id_fontes`);

--
-- Índices para tabela `tb_painel_configuracoes_fontes_tamanhos`
--
ALTER TABLE `tb_painel_configuracoes_fontes_tamanhos`
  ADD PRIMARY KEY (`id_fontes_tamanhos`);

--
-- Índices para tabela `tb_painel_online`
--
ALTER TABLE `tb_painel_online`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_pedidos`
--
ALTER TABLE `tb_painel_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_produtos`
--
ALTER TABLE `tb_painel_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_painel_produtos_imagens`
--
ALTER TABLE `tb_painel_produtos_imagens`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `tb_painel_usuarios`
--
ALTER TABLE `tb_painel_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_site_depoimento`
--
ALTER TABLE `tb_site_depoimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_site_geral`
--
ALTER TABLE `tb_site_geral`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_site_localizacao`
--
ALTER TABLE `tb_site_localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_site_servico`
--
ALTER TABLE `tb_site_servico`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_site_slide`
--
ALTER TABLE `tb_site_slide`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_painel_browser`
--
ALTER TABLE `tb_painel_browser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_calendario`
--
ALTER TABLE `tb_painel_calendario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_cargos`
--
ALTER TABLE `tb_painel_cargos`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_painel_configuracoes`
--
ALTER TABLE `tb_painel_configuracoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_configuracoes_fontes`
--
ALTER TABLE `tb_painel_configuracoes_fontes`
  MODIFY `id_fontes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_configuracoes_fontes_tamanhos`
--
ALTER TABLE `tb_painel_configuracoes_fontes_tamanhos`
  MODIFY `id_fontes_tamanhos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_online`
--
ALTER TABLE `tb_painel_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `tb_painel_pedidos`
--
ALTER TABLE `tb_painel_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_painel_produtos`
--
ALTER TABLE `tb_painel_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_painel_produtos_imagens`
--
ALTER TABLE `tb_painel_produtos_imagens`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tb_painel_usuarios`
--
ALTER TABLE `tb_painel_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_site_depoimento`
--
ALTER TABLE `tb_site_depoimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `tb_site_geral`
--
ALTER TABLE `tb_site_geral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_site_localizacao`
--
ALTER TABLE `tb_site_localizacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_site_servico`
--
ALTER TABLE `tb_site_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_site_slide`
--
ALTER TABLE `tb_site_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
