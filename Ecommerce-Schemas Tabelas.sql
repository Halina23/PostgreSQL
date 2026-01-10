CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

create table fornecedores (
fornecedor_id serial primary key,
nome varchar(100),
país varchar (50)

);

create table canais_venda (
canal_id serial primary key,
nome varchar (50)
);

create table produtos (
produto_id serial primary key,
nome varchar (100),
categoria_id int references categorias(categoria_id),
fornecedor_id int references fornecedores(fornecedor_id),
preco numeric (10,2)
);


create table estoque (
produto_id int references produtos(produto_id),
quantidade_disponivel int,
ultima_atualizacao timestamp 
);


create table vendas (
venda_id serial primary key,
data_venda date,
cliente int references clientes(cliente_id),
canal_id int references canais_venda(canal_id)
);

create table clientes (
cliente_id serial primary key,
nome varchar (100),
estado char (2)
);


create table pagamentos (
pagamento_id serial primary key,
venda_id int references vendas(venda_id),
metodo_pagamento varchar (50),
status varchar (20),
valor_pago numeric (10,2)
);

INSERT INTO categorias (nome)
VALUES
('Notebook'),
('Mouse'),
('Teclado'),
('Monitor'),
('Acessorios');

INSERT INTO fornecedores (nome, país)
SELECT
    'Fornecedor' || gs,
    (ARRAY['Brasil','China','EUA','Taiwan'])[floor(random()*4)+1]
FROM generate_series(1,10) gs;

INSERT INTO canais_venda (nome)
VALUES ('Site'), ('Marketplace'), ('Loja Fisica');

INSERT INTO produtos (nome, categoria_id, fornecedor_id, preco)
SELECT
    CASE
        WHEN categoria_id = 1 THEN
            (ARRAY['Notebook Dell','Notebook Lenovo','Notebook Acer','Notebook Asus'])
            [floor(random()*4)+1] || ' ' || (ARRAY['i5','i7','Ryzen 5','Ryzen 7'])[floor(random()*4)+1]

        WHEN categoria_id = 2 THEN
            (ARRAY['Mouse Logitech','Mouse Redragon','Mouse Multilaser','Mouse Razer'])
            [floor(random()*4)+1]

        WHEN categoria_id = 3 THEN
            (ARRAY['Teclado Mecânico','Teclado Gamer','Teclado Sem Fio','Teclado ABNT2'])
            [floor(random()*4)+1]

        WHEN categoria_id = 4 THEN
            (ARRAY['Monitor LG','Monitor Samsung','Monitor Dell','Monitor AOC'])
            [floor(random()*4)+1] || ' ' || (ARRAY['24"','27"','29"','32"'])[floor(random()*4)+1]

        ELSE
            (ARRAY['Headset','Webcam','Hub USB','Carregador','Mousepad'])
            [floor(random()*5)+1]
    END
    || ' ' || gs,

    categoria_id,
    fornecedor_id,

    ROUND(
        (
            CASE
                WHEN categoria_id = 1 THEN random()*6000 + 3500
                WHEN categoria_id = 4 THEN random()*2500 + 900
                WHEN categoria_id = 3 THEN random()*500 + 200
                WHEN categoria_id = 2 THEN random()*250 + 80
                ELSE random()*400 + 60
            END
        )::numeric
    , 2)

FROM (
    SELECT
        gs,
        (gs % 5) + 1 AS categoria_id,
        (random()*9 + 1)::INT AS fornecedor_id
    FROM generate_series(1,200) gs
) base;

INSERT INTO pagamentos (venda_id, metodo_pagamento, status, valor_pago)
SELECT
    v.venda_id,
    (ARRAY['Credito','Debito','Pix','Boleto'])[floor(random()*4)+1],
    (ARRAY['Pago','Pendente','Cancelado'])[floor(random()*3)+1],
    ROUND((random()*5000 + 50)::numeric, 2)
FROM vendas v;


INSERT INTO clientes (nome, estado)
SELECT
    (
        ARRAY[
            'Ana','Bruno','Carla','Daniel','Eduardo','Fernanda','Gabriel','Helena','Igor','Juliana',
            'Lucas','Mariana','Natalia','Otavio','Paula','Rafael','Sabrina','Thiago','Vanessa','William',
            'Aline','Caio','Diego','Elisa','Felipe','Gisele','Hugo','Isabela','Joao','Karen'
        ])[floor(random()*30)+1]
    || ' ' ||
    (
        ARRAY[
            'Silva','Santos','Oliveira','Pereira','Costa','Rodrigues','Alves','Lima','Gomes','Ribeiro',
            'Martins','Araujo','Rocha','Barros','Teixeira','Moreira','Farias','Cunha','Melo','Pacheco'
        ])[floor(random()*20)+1]
    || ' ' || gs AS nome,

    (ARRAY['SP','RJ','MG','PR','SC','RS','BA','PE','CE','DF'])
    [floor(random()*10)+1] AS estado
FROM generate_series(1,300) gs;

select * from clientes;

UPDATE clientes
SET nome = regexp_replace(nome, '\s\d+$', '');


INSERT INTO estoque (produto_id, quantidade_disponivel, ultima_atualizacao)
SELECT
    p.produto_id,
    (random()*200 + 20)::INT AS quantidade_disponivel,
    NOW() - (random()*30 || ' days')::INTERVAL AS ultima_atualizacao
FROM produtos p;

INSERT INTO vendas (data_venda, cliente, canal_id)
SELECT
    CURRENT_DATE - (random()*180)::INT AS data_venda,
    (SELECT cliente_id FROM clientes ORDER BY random() LIMIT 1) AS cliente,
    (SELECT canal_id FROM canais_venda ORDER BY random() LIMIT 1) AS canal_id
FROM generate_series(1,600);




















