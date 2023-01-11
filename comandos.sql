-- Active: 1672849679546@@127.0.0.1@3306@comercio
/* modelagem básica */

CLIENTE - 	

NOME -  caracter (30)
CPF  -  numerico (11)
EMAIL - caracter(30)
TELEFONE - caracter (30)
ENDERECO - caracter (100)
SEXO  - caracter(1)

/* PRECESSOS DE MODELAGEM */


/*criando o banco de dados */

CREATE DATABASE projeto;

/*conectando ao banco */
USE projeto

/*criando a tabela clientes */

CREATE TABLE CLIENTE( 
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF int(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)
);
/*verificando as tabelas do banco */
show TABLES;

/* descobrindo como é a estrutura de uma tabela */

DESC CLIENTE;

/* colocando dados na tabela */

INSERT INTO CLIENTE(NOME,SEXO,EMAIL,TELEFONE,ENDERECO) VALUE('LEANDRO','M','LEANDROCASTILIONE@HOTMAIL.COM',
'14998034120','RUA PAULO VI BAURU SP'); 



/* Comando select */

SELECT now();

SELECT 'LEANDRO';


/* alias de colunas */
SELECT NOME as CLIENTE, SEXO, EMAIL FROM CLIENTE;


/* filtrando com where e like */

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

/* utilizand o like */
SELECT NOME, SEXO FROM CLIENTE LIKE ENDERECO = 'VI';

/* CARACTER CORINGA % */
SELECT NOME, SEXO FROM CLIENTE LIKE '%SP';
SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%SP'

/* Operadores lógicos or, and */

select nome, sexo, endereco from cliente
where sexo = 'M' or endereco like '%SP';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES LÓGICOS */

/*CONTANDO OS REGISTROS DE UMA TABELA */

SELECT count(*) as Quantidade from cliente;

select sexo , count(*) from cliente group by sexo;

/*Exercicios */


--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21 | Filmes   53 | Roupas




select nome from funcionarios
 WHERE (departamento ='roupas' or departamento = 'filmes');


select nome, email from funcionarios 
where sexo = 'Feminino' and (departamento = 'lar' or departamento = 'filmes');

select nome from funcionarios where sexo = 'Masculino' or departamento = 'Jardim';




-- sempre usar o group by e o count para fazer o processo de tunning nos operadores



INSERT INTO CLIENTE(NOME,SEXO,EMAIL,TELEFONE,ENDERECO) VALUE('Guilherme','M',NULL,
'14928328','Rua marechal pedro, SP'); 

/* filtrando valores NULL */


select nome, sexo, endereco from cliente WHERE email is null;
select nome, sexo, endereco from cliente where email is not null;


/* utilizando o update para atualizar valores */
update cliente set email = 'guilhermer@gmail.com'
 WHERE nome ='Guilherme';
 -- sempre utilizar o wherer para delimitar aonde vai ocorrer o update
 
 
 /* deletando registros com a clausula DELETE */
select count(*) from cliente --total 2 
 
select count(*) from cliente where nome = 'Guilherme'; --1

DELETE from cliente where nome = 'Guilherme'; -- comando delete
--sempre use o select antes do delete para ter certeza 
--que as condições estão certas

select count(*) from cliente;

insert into cliente values ('Matheus','M',
'theumaligno@gmail.com', 4323, '1823940','Rua José bonifácio, SP');

update cliente set CPF = 4567 where nome = 'LEANDRO';

insert into cliente values ('Guilhermer','M',
'abacaximaldito@gmail.com',38855,'14993840','Rua cacete, SP');


/* joins */

select nome, sexo, bairro, cidade
from cliente 
	INNER JOIN endereco
	on IDCLIENTE = ID_CLIENTE;

-- on é a regra que será usada junto com o join
SELECT nome, sexo, email, tipo, numero  
from cliente 
	inner join telefone 
	on idcliente = id_cliente
where nome = 'joão';

/* joins com duas tabelas */
select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
from cliente 
	inner join endereco
	on cliente.IDCLIENTE = endereco.ID_CLIENTE
	inner join telefone 
	on cliente.IDCLIENTE = telefone.ID_CLIENTE;

-- DANDO APELIDDOS PARAS AS TABELAS
select C.nome, C.sexo, E.bairro, E.cidade, T.tipo, T.numero
from cliente C
	inner join endereco E
	on C.IDCLIENTE = E.ID_CLIENTE
	inner join telefone T
	on C.IDCLIENTE = T.ID_CLIENTE;

/*  
		DML - DATA MANIPULATION LANGUAGE
		DDL - DATA DEFINITION LANGUAGE
		DCL - DATA CONTROL LANGUAGE
		TCL - TRANSACTION CONTROL LANGUAGE
*/

-- DML 
select 
UPDATE 
set 
/* tudo que é usado para a manipulação dos dados é DML 

--DDL

/* DDL é basicamente tudo que envolve o tipo do dado por exemplo float, int, string, etc.

alguns comandos... */

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT, -- COMANDO AUTO INCREMENT EXISTE APENAS NO MYSQL
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT (10,2) NOT NULL
);

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

ALTER TABLE PRODUTO 
CHANGE VALOR_UNITARIO VALOR_UNITARIO FLOAT(10,2);

/* MODIFY */

ALTER TABLE PRODUTO 
MODIFY VALOR_UNITARIO VARCHAR(30) NOT NULL;


/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO 
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO 
ADD COLUMN PESO FLOAT(10,2) NOT NULL 
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO 
ADD COLUMN PESO FLOAT (10,2) NOT NULL 
FIRST;

/* COMANDO IN */
SELECT * FROM CLIENTE 
WHERE IDCLIENTE IN (12,13,14,15);



/* CRIANDO UMA FUNC VIEW */ 
CREATE VIEW V_RELATORIO AS
SELECT C.NOME, C.SEXO, IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS E-MAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM V_RELATORIO;


/* DELETANDO UMA VIEW */

DROP VIEW V_RELATORIO 
DROP TABLE 



/* ORDER BY */

SELECT  * FROM ALUNOS 
ORDER BY NUMERO;


SELECT  * FROM ALUNOS 
ORDER BY 2;

/* ORDEDANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS 
ORDER BY NUMERO DESC, NOME;


DROP TABLE ALUNOS;
DROP VIEW V_RELATORIO;


/* delimitador */

-- mudando o delimitador de ; para $

DELIMITER $ 


/* procedimentos armazenados */


-- criando um procedimento 
DELIMITER $
CREATE PROCEDURE NOME()
BEGIN 

		QUALQUER PROGRAMACAO

END


CREATE PROCEDURE NOME_EMPRESA ()
BEGIN 

		SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

/* PROCEDURES COM PARAMETROS */
DELIMITER $
CREATE PROCEDURE CONTA(N1 INT, N2 INT)
BEGIN
		SELECT N1 + N2 AS CONTA;

END 
$

-- APAGANDO PROCEDURE

DROP PROCEDURE CONTA;


-- CHAMANDO A PROCEDURE
CALL CONTA(30,40);

/* FUNÇÃO MAX */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

/* MIN */
SELECT MIN(FEVEREIRO) AS MIN_FEV
FROM VENDEDORES;

/*AVG - MÉDIA */

SELECT AVG(FEVEREIRO) AS MEDIA_FEV 
FROM VENDEDORES;


/* VARIAS FUNC */
SELECT  MAX(JANEIRO) AS MAX_JAN,
		MIN(JANEIRO) AS MIN_JAN, 
		AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

/*TRUNCATE -- LIMITA O NÚMERO DE CASAS */
SELECT  MAX(JANEIRO) AS MAX_JAN,
		MIN(JANEIRO) AS MIN_JAN, 
		TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
FROM VENDEDORES;


/* SOMA SUM() */
SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;


/* VENDAS PRO SEXO */

SELECT NOME, SUM(MARCO) AS TOTAL_MARC
FROM vendedores
GROUP BY NOME ORDER BY TOTAL_MARC DESC;


/* ORDER BY DESC ASC */

SELECT NOME, SUM(MARCO) AS TOTAL_MARC
FROM vendedores
GROUP BY NOME ORDER BY TOTAL_MARC DESC;

SELECT NOME, SUM(MARCO) AS TOTAL_MARC
FROM vendedores
GROUP BY NOME ORDER BY NOME,TOTAL_MARC ASC;


/* ENTRE */
SELECT NOME, SEXO FROM VENDEDORES 
WHERE  JANEIRO BETWEEN 4000 AND 5000;

/* CONCATENANDO */
select CONCAT(NOME,' ',SEXO) FROM vendedores;


/* SUBQUARRYS */

SELECT MARCO, NOME FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

SELECT MARCO, NOME FROM VENDEDORES 
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);
SELECT FEVEREIRO, NOME FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);


/* OPERACOES EM LINHA */

SELECT NOME, 
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO + FEVEREIRO + MARCO) AS 'TOTAL',
	TRUNCATE ((JANEIRO + FEVEREIRO + MARCO) / 3, 2) AS 'MEDIA'
FROM VENDEDORES;



/* ALTERANDO TABELAS */

-- ADICIONANDO UMA PRIMARY KEY 
ALTER TABLE TABELA 
ADD PRIMARY KEY (COLUNA1);

-- ADICIONANDO UMA COLUNA SEM POSICAO
ALTER TABLE TABELA 
ADD COLUNA VARCHAR(30);

-- ADICIONANDO UMA COLUNA COM POSICAO 
ALTER TABLE TABELA
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE 
AFTER COLUNA3;

-- MODIFICANDO O TIPO DE UM CAMPO 
ALTER TABLE TABELA MODIFY COLUNA2 DATE NOT NULL;

--ADICIONANDO UMA FOREIGN KEY
ALTER TABLE TABELA 
ADD FOREIGN KEY(COLUNA)
REFERENCES PESSOA(COLUNA1);

--RENOMEANDO A TABELA
ALTER TABLE TABELA
RENAME PESSOA;


--VERIFICANDO A CHAVE
SHOW CREATE TABLE TABELA;


