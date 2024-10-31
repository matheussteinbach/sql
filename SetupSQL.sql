CREATE TABLE Ambulatorios (
	nroa INT,
  	andar NUMERIC(2) NOT NULL,
  	capacidade SMALLINT,
  	PRIMARY KEY (nroa)
);

CREATE TABLE Medicos (
	codm INT,
  	nome VARCHAR(40) NOT NULL,
  	idade SMALLINT NOT NULL,
  	cidade VARCHAR(40),
  	CPF NUMERIC(11) NOT NULL UNIQUE,
  	especialidade VARCHAR(30),
  	nroa INT,
  	PRIMARY KEY (codm),
  	FOREIGN KEY (nroa) REFERENCES Ambulatorios
); 

CREATE TABLE Pacientes (
	codp INT,
  	nome VARCHAR(40) NOT NULL,
  	idade SMALLINT NOT NULL,
  	cidade VARCHAR(40),
  	CPF NUMERIC(11) NOT NULL UNIQUE,
  	doenca VARCHAR(40) NOT NULL,
  	PRIMARY KEY (codp)
);

CREATE TABLE Funcionarios (
	codf INT,
  	nome VARCHAR(40) NOT NULL,
  	idade SMALLINT NOT NULL,
  	cidade VARCHAR(40),
  	CPF NUMERIC(11) NOT NULL UNIQUE,
  	salario NUMERIC(10),
  	cargo VARCHAR(40),
  	PRIMARY KEY (codf)
);

CREATE TABLE Consultas (
	codm INT,
  	codp INT,
  	data DATE,
  	hora TIME,
  	PRIMARY KEY ( codm, codp, data ),
  	FOREIGN KEY ( codm ) REFERENCES Medicos,
  	FOREIGN KEY ( codp ) REFERENCES Pacientes
);

ALTER TABLE Funcionarios
	DROP COLUMN cargo;
    
 CREATE INDEX indPac_cidade on Pacientes(cidade);

INSERT INTO ambulatorios VALUES (1, 1, 30),
								(2, 1, 50),
                                (3, 2, 40),
                                (4, 2, 25),
                                (5, 2, 55);

INSERT INTO medicos VALUES (1, 'Joao', 40, 'Florianopolis', 10000100000, 'ortopedia', 1),
						   (2, 'Maria', 42, 'Blumenau', 10000110000, 'traumatologia', 2),
                           (3, 'Pedro', 51, 'Sao Jose',  11000100000, 'pediatria', 2),
                           (4, 'Carlos', 28, 'Joinville', 11000110000, 'ortopedia', NULL),
                           (5, 'Marcia', 33, 'Biguacu', 11000111000, 'neurologia', 3);

INSERT INTO Pacientes VALUES (1, 'Ana', 20, 'Florianopolis', 20000200000, 'gripe'),
							 (2, 'Paulo', 24, 'Palhoca', 20000220000, 'fratura'),
							 (3, 'Lucia', 30, 'Biguacu', 22000200000, 'tendinite'),
							 (4, 'Carlos', 28, 'Joinville', 11000110000, 'sarampo');

INSERT INTO Funcionarios VALUES (1, 'Rita', 32, 'Sao Jose', 20000100000, 1200),
								(2, 'Vera', 55, 'Palhoca', 30000110000, 1220),
								(3, 'Caio', 45, 'Florianopolis', 41000100000, 1100),
								(4, 'Marcelo', 44, 'Florianopolis', 51000110000, 1200),
								(5, 'Paula', 33, 'Florianopolis', 61000111000, 2500);

INSERT INTO Consultas VALUES (1, 1, '2020/10/12', '14:00'),
							 (1, 4, '2020/10/13', '10:00'),
							 (2, 1, '2020/10/13', '09:00'),
							 (2, 2, '2020/10/13', '11:00'),
							 (2, 3, '2020/10/14', '14:00'),
                             (2, 4, '2020/10/14', '17:00'),
                             (3, 1, '2020/10/19', '18:00'),
                             (3, 3, '2020/10/12', '10:00'),
                             (3, 4, '2020/10/19', '13:00'),
                             (4, 4, '2020/10/20', '13:00'),
                             (4, 4, '2020/10/22', '19:30');

UPDATE pacientes
SET cidade = 'Ilhota'
WHERE nome = 'Paulo';

UPDATE consultas
SET hora = '12:00', data = '2020/11/04'
WHERE codm = 1 and codp = 4;

UPDATE consultas
SET hora = '14:30'
WHERE codm = 3 and codp = 4;

DELETE FROM funcionarios
WHERE codf = 4;

DELETE FROM consultas
where hora > '19:00';

DELETE FROM medicos
WHERE cidade = 'Biguacu' or cidade = 'Palhoca';