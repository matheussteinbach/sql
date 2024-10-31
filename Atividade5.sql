SELECT nome 
FROM pacientes 
WHERE codp in (
  	SELECT codp 
    FROM consultas 
    where hora > '14:00'
);

SELECT nome, idade
FROM medicos
WHERE codm in (
  	SELECT codm
  	FROM consultas
  	WHERE codp IN(
    	SELECT codp
      	FROM pacientes
      	WHERE nome = 'Ana'
));

SELECT nroa, andar
FROM ambulatorios
WHERE nroa not in(
	SELECT nroa
  	FROM medicos
  	WHERE nroa is not NULL
);

SELECT cpf
FROM medicos
WHERE nroa = some (
	SELECT nroa
  	FROM ambulatorios
  	WHERE andar = 1
);

SELECT nome, cpf
FROM funcionarios
WHERE salario < some (
	SELECT salario
  	FROM funcionarios
);

SELECT nome
FROM pacientes
WHERE codp in (
  	SELECT codp
  	FROM consultas
  	WHERE hora < ALL (
		SELECT hora
      	FROM consultas
      	WHERE data = '2020/10/14'
));

SELECT nroa, andar
FROM ambulatorios
WHERE capacidade > ALL (
	SELECT capacidade
  	FROM ambulatorios
  	WHERE andar = 1
);