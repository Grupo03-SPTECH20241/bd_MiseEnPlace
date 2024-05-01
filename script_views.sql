use mydb;
-- view mais vendidos por mes
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_mes
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.idPedido = pp.fk_pedido
GROUP BY 
    MONTH(p.dt_pedido);
-- view mais vendidos por dia 
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_dia
AS
SELECT 
    DAY(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.idPedido = pp.fk_pedido
GROUP BY 
    DAY(p.dt_pedido);
-- view mais vendidos por semana
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_semana
AS
SELECT 
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.idPedido = pp.fk_pedido
WHERE 
	p.dt_pedido >= CURDATE() - INTERVAL 7 DAY
GROUP BY 
    DATE(p.dt_pedido)
ORDER BY
	DATE(p.dt_pedido);

-- view mais vendidos por tipo de produto
CREATE OR REPLACE VIEW vw_tipo_produto
AS
SELECT 
    tp.tipo AS Tipo_Produto,
    SUM(pp.qt_produto) AS Quantidade_Vendida
FROM 
    produto_pedido pp
INNER JOIN 
    produto p ON pp.fk_produto = p.idProduto
INNER JOIN 
    tipo_produto tp ON p.fk_tipo_produto = tp.id_tipo_produto
GROUP BY 
    tp.tipo
ORDER BY 
    SUM(pp.qt_produto) DESC;

CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido 
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'valor vendido'
FROM 
    pedido p
INNER JOIN 
    produto_pedido pp ON p.idPedido = pp.fk_pedido
INNER JOIN 
    produto pr ON pp.fk_produto = pr.idProduto
GROUP BY 
    MONTH(p.dt_pedido)
ORDER BY 
     MONTH(p.dt_pedido);



    
select * from vw_quantidade_vendidos_mes;
select * from vw_quantidade_vendidos_dia;
select * from vw_quantidade_vendidos_semana;
select * from vw_tipo_produto;
SELECT * FROM vw_quantidade_vendida_valor_vendido;
