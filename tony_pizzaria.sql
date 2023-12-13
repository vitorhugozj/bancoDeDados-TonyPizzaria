create database tony_pizzaria;

use tony_pizzaria;

create table endereco(
id_endereco integer primary key not null auto_increment,
bairro varchar(15) not null,
logradouro varchar(30) not null,
cidade varchar(18) not null,
cep varchar(8) not null  
);

create table clientes(
id_clientes integer primary key not null auto_increment,
nome varchar(30) not null,
email varchar(30) not null,
senha varchar(30) not null,
id_endereco integer,  
foreign key (id_endereco) references endereco(id_endereco)
);

create table pedidos(
id_pedidos integer primary key not null auto_increment,
descricao_pedido varchar(100) not null,
data_pedido datetime not null,
hora_entrega time not null,
valor_pedido varchar(8) not null,
avaliacao tinyint,
id_clientes integer,
foreign key (id_clientes) references clientes(id_clientes)
);

create table funcionarios(
id_funcionarios integer primary key not null auto_increment,
cpf varchar(15) not null,
nome varchar(20) not null,
cargo varchar(20) not null,
carga_horaria tinyint not null,
salario varchar(10) not null,
id_pedidos integer,
foreign key (id_pedidos) references pedidos(id_pedidos)
);

create table produtos(
id_produtos integer primary key not null auto_increment,
titulo_produto varchar(30) not null,
preco_produto varchar(6) not null,
qtd_produto integer,
marca_produto varchar(20),
id_pedidos integer,
foreign key (id_pedidos) references pedidos(id_pedidos)
);

create table categorias(
id_categorias integer primary key not null auto_increment,
nome_categoria varchar(25) not null,
id_produtos integer,
foreign key (id_produtos) references produtos(id_produtos)
);

insert into endereco(bairro, logradouro, cidade, cep)values
('Casa 1', 'Rua 1', 'Itapevi', 06694-030),
('Casa 2', 'Rua 2', 'Itapevi', 06694-031),
('Casa 3', 'Rua 3', 'Itapevi', 06694-032),
('Casa 4', 'Rua 4', 'Itapevi', 06694-033);

insert into clientes(nome, email, senha)values
('Luis', 'luis@gmail.com', 'luis1'),
('Felipe', 'felipe@gmail.com', 'felipe1'),
('Paloma', 'paloma@gmail.com', 'vitorlindo1'),
('Guilherme', 'guilherme@gmail.com', 'guigui1');

insert into pedidos(descricao_pedido, data_pedido, hora_entrega, valor_pedido, avaliacao)values
('1 pizza, 1 refrigerantes e 1 brownie', 07/04/2024, 20-54-44, 100.00, 5),
('3 pizzas e 2 refrigerante', 30/02/2024, 19-29-04, 60.00, 5),
('1 pizzas e 1 refrigerante', 22/12/2024, 19-04-01, 78.00, 4),
('2 pizzas', 01/01/2024, 22-34-03, 95.00, 5);

insert into funcionarios(cpf, nome, cargo, carga_horaria, salario)values
('000.000.000-01', 'Juan', 'Motoboy', '4','1800'),
('000.000.000-02', 'Gustavo', 'Chef', '5', '2300'),
('000.000.000-03', 'Bruno', 'Motoboy', '4', '1850'),
('000.000.000-04', 'Pamela', 'Balconista', '5', '2150');

insert into produtos(titulo_produto, preco_produto, qtd_produto,marca_produto)values
('Pizza de calabreza com queijo', 16.00, 1, 1, 'Tonny Pizzas'),
('Pizza de peperoni com queijo', 19.00, 2, 1, 'Tonny Pizzas'),
('Coca-cola 2L', 15.00, 200, 03/02/2024, 'Coca-Cola'),
('Cerveja Heineken', 12.00, 4, 21/06/2025, 'Heineken');

insert into categorias(nome_categoria)values
('Pizza Salgada'),
('Pizza Doce'),
('Bebida'),
('Sobremesa');


drop database tony_pizzaria;
