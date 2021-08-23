CREATE TABLE IF NOT EXISTS pessoa (
  id_pessoa SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  data_cadastro DATE NOT NULL,
  uf CHAR(2) NOT NULL,
  tipo_pessoa CHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS produto (
  id_produto SERIAL PRIMARY KEY,
  nome_produto VARCHAR(50) NOT NULL,
  departamento VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS loja (
  id_loja SERIAL PRIMARY KEY,
  nome_loja VARCHAR(50) NOT NULL,
  uf_loja CHAR(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
  id_pedido SERIAL, 
  id_pessoa INTEGER NOT NULL,
  dt_pedido DATE NOT NULL,
  valor_total NUMERIC(15,2) NOT NULL,
  id_loja INTEGER NOT NULL,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_pessoa) REFERENCES pessoa (id_pessoa),
  FOREIGN KEY (id_loja) REFERENCES loja (id_loja)
);

CREATE TABLE IF NOT EXISTS pedido_produto (
  id_ped_produto SERIAL,
  id_pedido INTEGER NOT NULL,
  id_produto INTEGER NOT NULL,
  quant_itens INTEGER NOT NULL,
  dt_pedido DATE NOT NULL,
  valor_total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (id_ped_produto),
  FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Erik', '2018/05/24', 'PR', 'PF');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Rosicleide', '2019/09/17', 'PR', 'PF');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Sorumbático', '2019/09/17', 'PR', 'PJ');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Apoplético', '2020/02/09', 'PR', 'PJ');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Ronaldo Fenômeno', '2021/02/09', 'PR', 'PJ');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Tupac Shakur', '2015/11/01', 'SC', 'PJ');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Blanka', '2008/01/23', 'AC', 'PF');
INSERT INTO pessoa(nome, data_cadastro, uf, tipo_pessoa) VALUES ('Dalborga', '2016/05/01', 'RJ', 'PF');

INSERT INTO produto(nome_produto, departamento) VALUES ('Cadeira para Cozinha', 'Móveis de Cozinha');
INSERT INTO produto(nome_produto, departamento) VALUES ('Cadeira para Sala', 'Móveis de Sala de Estar');
INSERT INTO produto(nome_produto, departamento) VALUES ('Sofá', 'Móveis de Sala de Estar');
INSERT INTO produto(nome_produto, departamento) VALUES ('Mesa de Centro', 'Móveis de Sala de Estar');
INSERT INTO produto(nome_produto, departamento) VALUES ('Poltrona', 'Móveis de Sala de Estar');
INSERT INTO produto(nome_produto, departamento) VALUES ('Prateleira', 'Móveis de Cozinha');
INSERT INTO produto(nome_produto, departamento) VALUES ('Cozinha Compacta', 'Móveis de Cozinha');
INSERT INTO produto(nome_produto, departamento) VALUES ('Cozinha Completa Madesa', 'Móveis de Cozinha');

INSERT INTO loja(nome_loja, uf_loja) VALUES ('Super Barato - São José dos Pinhais', 'PR');
INSERT INTO loja(nome_loja, uf_loja) VALUES ('Super Barato - Curitiba', 'PR');
INSERT INTO loja(nome_loja, uf_loja) VALUES ('Super Barato - Rio de Janeiro', 'RJ');
INSERT INTO loja(nome_loja, uf_loja) VALUES ('Super Barato - Rio Branco', 'AC');
INSERT INTO loja(nome_loja, uf_loja) VALUES ('Super Barato - Balneário Camboriú', 'SC');

INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (1, '2018/05/24', 500.00, 1); -- OK C
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (1, '2021/08/24', 1500.00, 1); -- OK C
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (2, '2019/09/17', 2000.00, 2); -- OK C 
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (2, '2020/05/24', 5500.90, 2); -- OK C
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (3, '2018/01/17', 1550.55, 1); -- OK 
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (3, '2021/04/21', 5500.90, 1); -- OK C
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (3, '2020/02/15', 2500.00, 1); -- OK C
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (3, '2018/05/12', 2500.00, 1); -- OK
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (8, '2017/07/15', 500.60, 3); -- OK
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (6, '2015/04/07', 680.60, 5); -- OK
INSERT INTO pedido(id_pessoa, dt_pedido, valor_total, id_loja) VALUES (6, '2019/08/12', 1200.60, 5); -- OK

INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (1, 1, 1, '2018/05/24', 500.00); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (2, 1, 3, '2021/08/24', 1500.00); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (3, 1, 4, '2019/09/17', 2000.00); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (4, 8, 1, '2020/05/24', 5500.90); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (5, 5, 1, '2018/01/17', 1550.55); -- OK
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (6, 8, 1, '2021/04/21', 5500.90); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (7, 8, 1, '2018/05/12', 5500.90); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (8, 3, 1, '2020/02/15', 2500.00); -- OK
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (9, 4, 1, '2017/07/15', 500.60); -- OK
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (10, 6, 1, '2015/04/07', 680.60); -- OK - C
INSERT INTO pedido_produto(id_pedido, id_produto, quant_itens, dt_pedido, valor_total) VALUES (11, 3, 1, '2019/08/12', 1200.60); -- OK

CREATE OR REPLACE VIEW exercicio1 AS (
  SELECT  pedido.id_pessoa,
          COUNT(pedido.id_pessoa) AS total_pedidos,
          COUNT(DISTINCT(pedido_produto.id_produto)) AS produtos_distintos,
          SUM(pedido.valor_total) AS valor_total,
          AVG(pedido.valor_total)::NUMERIC(10,2) AS ticket_medio,
          MAX(pedido.dt_pedido) AS ultima_compra
  FROM pedido
  JOIN pessoa ON pessoa.id_pessoa = pedido.id_pessoa AND pedido.dt_pedido > '2018/01/01'
  JOIN pedido_produto ON pedido_produto.id_pedido = pedido.id_pedido
  JOIN loja ON loja.id_loja = pedido.id_loja AND loja.nome_loja LIKE 'Super Barato - São José dos Pinhais'
  GROUP BY pedido.id_pessoa
);

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