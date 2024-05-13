use mise_en_plass;
-- view mais vendidos por mes
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_mes
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
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
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
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
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
WHERE 
	p.dt_pedido >= CURDATE() - INTERVAL 7 DAY
GROUP BY 
    DATE(p.dt_pedido)
ORDER BY
	DATE(p.dt_pedido);

SELECT * FROM pedido;

-- view mais vendidos por tipo de produto
CREATE OR REPLACE VIEW vw_tipo_produto
AS
SELECT 
    tp.tipo AS Tipo_Produto,
    SUM(pp.qt_produto) AS Quantidade_Vendida
FROM 
    produto_pedido pp
JOIN 
    produto p ON pp.fk_produto = p.id_produto
JOIN 
    tipo_produto tp ON p.fk_tipo_produto = tp.id_tipo_produto
GROUP BY 
    tp.tipo
ORDER BY 
    SUM(pp.qt_produto) DESC;


-- views quantidade para grafico de valor vendido por quantidade vendida(Por mês)
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido 
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'valor vendido'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN 
    produto pr ON pp.fk_produto = pr.id_produto
GROUP BY 
    MONTH(p.dt_pedido)
ORDER BY 
     MONTH(p.dt_pedido);

-- views quantidade para grafico de valor vendido por quantidade vendida(Por semana)
SELECT 
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'Valor Vendido'
FROM
    pedido p 
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN
    produto pr ON pp.fk_produto = pr.id_produto
WHERE 
    P.dt_pedido >= CURDATE() - INTERVAL 7 DAY
GROUP BY
    DATE(p.dt_pedido)
ORDER BY
    DATE(p.dt_pedido);

-- view para quantidade vendida por valor vendido por dia
SELECT 
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'Valor Vendido'
FROM
    pedido p 
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN
    produto pr ON pp.fk_produto = pr.id_produto
WHERE
    P.dt_pedido >= CURDATE() - INTERVAL 1 DAY
GROUP BY
    DATE(p.dt_pedido);


