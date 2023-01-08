/* criando a database */
CREATE DATABASE LIVRARIA


/*CRIANDO a tabela */

CREATE TABLE LIVRO (
	NOME_DO_LIVRO VARCHAR(40),
	NOME_DO_AUTOR VARCHAR(40),
	SEXO_DO_AUTOR CHAR(1),
	NUMERO_DE_PAGINAS VARCHAR(20),
	NOME_DA_EDITORA VARCHAR(30),
	VALOR_DO_LIVRO FLOAT(7),
	ESTADO_DA_EDITORA CHAR(2),
	ANO_PUBLICACAO INT(4)
);

/* inserindo dados */

INSERT INTO LIVRO VALUE ('Cavaleiro Real','Ana Claudia','F','465','Atlas',49.9,'RJ',2009);
INSERT INTO LIVRO VALUE('SQL para leigos','João nunes','M','450','Addison',98,'SP',2018),
('Receitas Caseiras','Celia Tavares','F','210','Atlas',45,'RJ',2008),
('Pessoas Efetivas','Eduardo Santos','M','390','Beta',78.99,'RJ',2018),
('Habitos Sauávies','Eduardo Santos','M','630','Beta',150.98,'RJ',2019),
('A Casa Marrom','Hermes Marcedo','M','250','Bubba',60,'MG',2016),
('Estacio Querido','Geraldo Francisco','M','310','Insignia',100,'ES',2015),
('Pra Sempre Amigas','Leda Silva','F','510','Insignia',78.98,'ES',2011),
('Copas Inesqueciveis','Marco Alcantara','M','200','Larson',130.98,'RS',2018),
('O poder da mente','Clara mafra','F','120','Continental',56.58,'SP',2017);


/* Trazendo todos os dados */
SELECT * FROM livro;

/* trazendo o nome do livro e da editora */
select NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVRO;

/*trazendo o nome do livro e UF dos livros por autores do sexo masculino */
SELECT NOME_DO_LIVRO, ESTADO_DA_EDITORA FROM LIVRO WHERE SEXO_DO_AUTOR = 'M';

/* Trazendo o nome do livro o número de páginas  por autores do sexo feminino */
SELECT NOME_DO_LIVRO, NUMERO_DE_PAGINAS FROM LIVRO WHERE SEXO_DO_AUTOR = 'F';

/* Trazendo os valores dos livros das editoras de São Paulo */
SELECT VALOR_DO_LIVRO FROM LIVRO WHERE ESTADO_DA_EDITORA = 'SP';

/* Trazendo os dados dos autros deo sexo masculino que tiveram livros publicados
por São Paulo ou Rio de Janeiro */
SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR FROM LIVRO WHERE SEXO_DO_AUTOR = 'M' 
and ESTADO_DA_EDITORA = 'SP'
or ESTADO_DA_EDITORA = 'RJ';




