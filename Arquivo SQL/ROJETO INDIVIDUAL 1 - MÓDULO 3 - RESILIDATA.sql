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
VALUES (1, 'Resilia', 'Rua R, 123', 2112345678, 'resilia@email.com'),
       (2, 'Senac', 'Rua S, 123', 2187654321, 'senac@email.com');

INSERT INTO tecnologia (id_tecnologia, nome_tecnologia, area)
VALUES (1, 'Java', 'webdev'),
       (2, 'Python', 'dados');

INSERT INTO tecnologia_empresa (id_tecnologia_empresa, id_empresa, id_tecnologia)
VALUES (1, 1, 1),
       (2, 1, 1);
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
