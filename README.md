PROJETO INDIVIDUAL 1 - MÓDULO 3 - Sistema RESILIDATA

Criado e editado por Robson Peçanha

Data: 21/03/2023


Você foi contratado para desenvolver um banco de dados que irá armazenar
dados importantes que será utilizado pelo sistema RESILIADATA.

➔ O sistema irá auxiliar na avaliação de quais são as tecnologias que as
empresas parceiras estão utilizando e quais ajustes são necessários nas
stacks dos cursos.

➔ Vamos ter um cadastro de empresa parceira, um cadastro de tecnologias com
a opção de selecionar a área (webdev, dados, marketing, etc.) e uma tabela
para registrar quais tecnologias as empresas estão utilizando.


Realizar essa modelagem e responder algumas perguntas
com nosso modelo:


1. Existem outras entidades além dessas?

    Nao.

3. Quais são os principais campos e tipos?

    Na entidade "Empresa_parceira" foi criado um ID como PRIMARY KEY.

    Na entidade "Tecnologia" foi criado um ID como PRIMARY KEY.

    Na entidade "Utiliza" foram adicionadas duas FOREIGN KEY, fk_Empresa_parceira_ID e fk_Tecnologia_ID.

5. Como essas entidades estão relacionadas?

    No modelo lógico as entidades estão relacionadas por uma entidade relacional chamada por "Utiliza".
    

Linha de comando utlizado para criar a modelagem.

CREATE TABLE empresa_parceira (
  id_empresa INT PRIMARY KEY,
  nome_empresa VARCHAR(50),
  endereco VARCHAR(100),
  telefone VARCHAR(20),
  email VARCHAR(50)
);

CREATE TABLE tecnologia (
  id_tecnologia INT PRIMARY KEY,
  nome_tecnologia VARCHAR(50),
  area VARCHAR(20)
);

CREATE TABLE tecnologia_empresa (
  id_tecnologia_empresa INT PRIMARY KEY,
  id_empresa INT,
  id_tecnologia INT,
  FOREIGN KEY (id_empresa) REFERENCES empresa_parceira(id_empresa),
  FOREIGN KEY (id_tecnologia) REFERENCES tecnologia(id_tecnologia)
);

INSERT INTO empresa_parceira (id_empresa, nome_empresa, endereco, telefone, email)
VALUES (1, 'Resilia', 'Rua R, 123', '(21) 1234-5678', 'resilia@email.com');

INSERT INTO tecnologia (id_tecnologia, nome_tecnologia, area)
VALUES (1, 'Java', 'webdev'),
       (2, 'Python', 'dados'),
       (3, 'JavaScript', 'webdev'),
       (4, 'SQL', 'dados'),
       (5, 'Google Analytics', 'marketing');

INSERT INTO tecnologia_empresa (id_tecnologia_empresa, id_empresa, id_tecnologia)
VALUES (1, 1, 1),
       (2, 1, 3),
       (3, 1, 5);
SELECT e.nome_empresa, t.nome_tecnologia, t.area
FROM empresa_parceira e
JOIN tecnologia_empresa te ON e.id_empresa = te.id_empresa
JOIN tecnologia t ON te.id_tecnologia = t.id_tecnologia;

SELECT t.nome_tecnologia, COUNT(*) AS qtd_empresas
FROM tecnologia t
JOIN tecnologia_empresa te ON t.id_tecnologia = te.id_tecnologia
GROUP BY t.nome_tecnologia
ORDER BY qtd_empresas DESC;

SELECT e.nome_empresa, t.nome_tecnologia
FROM empresa_parceira e
JOIN tecnologia_empresa te ON e.id_empresa = te.id_empresa
JOIN tecnologia t ON te.id_tecnologia = t.id_tecnologia
WHERE t.area = 'webdev';

