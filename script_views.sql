use bd_mise_en_place;
-- view mais vendidos por mes
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_mes
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'Quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
GROUP BY 
    MONTH(p.dt_pedido);

SELECT * FROM vw_quantidade_vendidos_mes;

UPDATE metas SET valor = 2000 WHERE id_meta = 1;

-- view mais vendidos por dia 
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_dia
AS
SELECT 
    DAY(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'Quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
GROUP BY 
    DAY(p.dt_pedido);

desc vw_quantidade_vendidos_dia; 
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

SELECT * FROM vw_quantidade_vendidos_semana;
SELECT * FROM pedido;

-- view mais vendidos por tipo de produto
CREATE OR REPLACE VIEW vw_tipo_produto
AS
SELECT
	tp.id_tipo_produto AS id,
    tp.tipo AS Tipo_Produto,
    SUM(pp.qt_produto) AS Quantidade_Vendida
FROM 
    produto_pedido pp
JOIN 
    produto p ON pp.fk_produto = p.id_produto
JOIN 
    tipo_produto tp ON p.fk_tipo_produto = tp.id_tipo_produto
GROUP BY 
    tp.id_tipo_produto
ORDER BY 
    SUM(pp.qt_produto) DESC;

SELECT * FROM vw_tipo_produto;
-- views quantidade para grafico de valor vendido por quantidade vendida(Por mês)
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido 
AS
SELECT 
	pr.nome 'nome',
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
    MONTH(p.dt_pedido),pr.nome
ORDER BY 
     MONTH(p.dt_pedido);
     

-- views quantidade para grafico de valor vendido por quantidade vendida(Por semana)
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido_semana
AS
SELECT 
	pr.nome 'nome',
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
    DATE(p.dt_pedido),pr.nome
ORDER BY
    DATE(p.dt_pedido);

SELECT * FROM vw_quantidade_vendida_valor_vendido_semana;
    
    

SELECT * FROM vw_quantidade_vendida_valor_vendido_semana;	
-- view para quantidade vendida por valor vendido por dia
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido_dia
AS
SELECT 
	pr.nome 'nome',
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
	p.dt_pedido, pr.nome;

DESC metas;

