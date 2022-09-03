CREATE DATABASE sprint1;
use sprint1;
CREATE TABLE tb_usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf CHAR(14) NOT NULL,
email VARCHAR(45) NOT NULL,
senha  VARCHAR(45) NOT NULL
);

INSERT INTO tb_usuario(nome, cpf, email, senha) VALUES
	('Pamela Silva', '111.222.333-00', 'pamela@gmail.com', '123456'),
	('Flavio Nobre', '125.689.147-14', 'flavio@gmail.com', '25451'),
	('Carlos Antonio Santos', '265.166.145-22', 'carlos@gmail.com', '7899556'),
    ('Lorena Rocha', '464.343.443-12', 'Lorena@gmail.com', '2225565569');
    
CREATE TABLE tb_arduino(
  idArduino INT PRIMARY KEY AUTO_INCREMENT,
  temperatura FLOAT NOT NULL,
  dtTimeTemperatura DATETIME NOT NULL
);

INSERT INTO tb_arduino(temperatura, dtTimeTemperatura) VALUES
	(18.9, '2022-09-03 11:20'),
	(21.6, '2022-09-03 12:00'),
	(20.2, '2022-09-03 14:30'),
    (19.2, '2022-09-05 18:30'),
    (18.0, '2022-09-05 17:20'),
    (21.2, '2022-09-06 14:30'),
    (22.0, '2022-09-06 13:10'),
    (16.6, '2022-09-06 21:30'),
    (16.2, '2022-09-06 22:30');

  CREATE TABLE tb_Animal(
  idAnimal INT PRIMARY KEY AUTO_INCREMENT,
  especie VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  peso FLOAT NOT NULL,
  dtNasci DATE NOT NULL
  );
  
  ALTER TABLE tb_Animal ADD COLUMN fkUsuario INT;
  ALTER TABLE tb_Animal ADD FOREIGN KEY (fkUsuario) REFERENCES tb_usuario(idUsuario);
  
  INSERT INTO tb_Animal(especie, nome, peso, dtNasci, fkUsuario) VALUES
	('Tartaruga-tigre-d’água', 'Tortuguita', 4.9 ,'2000-01-02', 1),
    ('Jabuti-piranga', 'Donatelo', 5 ,'1970-04-12', 2),
    ('Furão', 'Furus', 2.9 ,'2015-11-24', 3),
    ('Iguana', 'Ninja', 3.7 ,'2019-10-17', 4),
    ('Jiboia', 'Naconda', 12.7 ,'2010-10-02', 2),
    ('Sagui', 'Abu', 0.4 ,'2020-11-12', 3);
    
    SELECT * FROM tb_usuario;
    SELECT * FROM tb_arduino;
    SELECT * FROM tb_Animal;
    
	-- DADOS DOS ANIMAIS E O SEUS RESPONSAVEIS 
    SELECT A.nome, A.especie, A.peso, A.dtNasci, U.nome AS 'Responsável' FROM tb_animal A
		INNER JOIN tb_usuario U ON A.fkUsuario = U.idUsuario;
    
    -- DADOS DOS ANIMAIS    
	SELECT especie, peso, dtNasci FROM tb_animal;
   
   -- DADOS DOS ANIMAIS COM MAIS DE KILOS 
   SELECT especie, peso, dtNasci FROM tb_animal
	WHERE peso > 4;
    
       -- DADOS DOS USUARIOS
    SELECT nome, email, cpf FROM tb_usuario;
    
    -- DADOS DO ARDUINO
    SELECT dtTimeTemperatura, temperatura FROM tb_arduino;
    
    -- DADOS DO ARDUINO DO DIA 2022-09-05
    SELECT dtTimeTemperatura, temperatura FROM tb_arduino
    WHERE dtTimeTemperatura >= '2022-09-05' and dtTimeTemperatura < '2022-09-06';
    
    -- DADOS DO ARDUINO APARTIR DO DIA 2022-09-03
    SELECT dtTimeTemperatura, temperatura FROM tb_arduino
    WHERE dtTimeTemperatura >= '2022-09-03';
    