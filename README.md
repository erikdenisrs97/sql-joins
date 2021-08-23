# sql-joins
Repositório utilizado para a prática de SQL. Através do arquivo *docker-compose.yml* é possível instanciar um banco PostgreSQL, ter tabelas com alguns dados e testar duas VIEWs que já estarão criadas.

## VIEW exercicio1

```sql
SELECT  pedido.id_pessoa,
        COUNT(pedido.id_pessoa) AS total_pedidos,
        COUNT(DISTINCT(pedido_produto.id_produto)) AS produtos_distintos,
        SUM(pedido.valor_total) AS valor_total,
        AVG(pedido.valor_total)::NUMERIC(10,2) AS ticket_medio,
        MAX(pedido.dt_pedido) AS ultima_compra
FROM pedido
JOIN pessoa ON pessoa.id_pessoa = pedido.id_pessoa AND pedido.dt_pedido > '201801/01'
JOIN pedido_produto ON pedido_produto.id_pedido = pedido.id_pedido
JOIN loja ON loja.id_loja = pedido.id_loja AND loja.nome_loja LIKE 'Super Barato- São José dos Pinhais'
GROUP BY pedido.id_pessoa
```

## VIEW exercicio2

```sql
CREATE OR REPLACE VIEW exercicio2 AS (
  SELECT  loja.uf_loja,
          SUM(pedido.valor_total) AS valor_total,
          AVG(pedido.valor_total)::NUMERIC(10,2) AS ticket_medio,
          MAX(pedido.dt_pedido) AS ultima_compra
  FROM pedido
  JOIN pessoa ON pessoa.id_pessoa = pedido.id_pessoa
  JOIN pedido_produto ON pedido_produto.id_pedido = pedido.id_pedido AND pedido.valor_total > 1000.00
  FULL JOIN loja ON loja.id_loja = pedido.id_loja
  JOIN produto ON produto.id_produto = pedido_produto.id_produto AND produto.departamento SIMILAR TO 'Móveis de Cozinha|Móveis de Sala de Estar'
  GROUP BY loja.uf_loja;
);
```