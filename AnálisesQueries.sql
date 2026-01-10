-- Quem comprou, quando, onde, valor, como pagou? 

select
v.venda_id,
v.data_venda,
c.nome as clientes,
c.estado,
cv.nome as canal_venda,
p.metodo_pagamento,
p.valor_pago,
p.status
from vendas v 
inner join clientes c on c.cliente_id = v.cliente
inner join canais_venda cv on cv.canal_id = v.canal_id
JOIN pagamentos p ON p.venda_id = v.venda_id;


SELECT COUNT(DISTINCT cliente) FROM vendas;

-- Produtos por categoria, fornecedor e estoque.

SELECT 
pr.produto_id,
pr.nome AS produto,
cat.nome AS categoria,
f.nome AS fornecedor,
f.país,
pr.preco,
e.quantidade_disponivel,
e.ultima_atualizacao
FROM produtos pr
JOIN categorias cat   ON cat.categoria_id = pr.categoria_id
JOIN fornecedores f  ON f.fornecedor_id = pr.fornecedor_id
LEFT JOIN estoque e  ON e.produto_id = pr.produto_id;


-- Faturamento total

SELECT 
SUM(valor_pago) AS faturamento_total
FROM pagamentos
WHERE status = 'Pago'

-- Faturamento por estado

SELECT 
c.estado,
SUM(p.valor_pago) AS faturamento
FROM pagamentos p
JOIN vendas v   ON v.venda_id = p.venda_id
JOIN clientes c ON c.cliente_id = v.cliente
WHERE p.status = 'Pago'
GROUP BY c.estado
ORDER BY faturamento DESC;

-- Ticket médio/ticket médio por estado

SELECT 
ROUND(AVG(valor_pago),2) AS ticket_medio
FROM pagamentos
WHERE status = 'Pago';


select
round(avg(pg.valor_pago), 2) as ticket_medio,
c.estado
from pagamentos pg
join vendas v on pg.venda_id   = v.venda_id
join clientes c on v.cliente  = c.cliente_id
where pg.status = 'Pago'
group by c.estado
order by ticket_medio desc;






