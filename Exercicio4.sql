SELECT med.nome, med.cpf 
from medicos med 
join pacientes on med.cpf = pacientes.cpf;

SELECT fun.nome, med.nome
FROM funcionarios fun 
JOIN medicos med on fun.cidade = med.cidade; 

SELECT med.nome, med.idade
FROM medicos med
JOIN consultas con ON med.codm = con.codm
JOIN pacientes pac ON con.codp = pac.codp
WHERE pac.nome = 'Ana';

SELECT amb.nroa
FROM ambulatorios amb 
JOIN ambulatorios amb5 on amb.andar = amb5.andar
WHERE amb5.nroa = 5 and amb.nroa != 5;

SELECT DISTINCT pac.codp, pac.nome
FROM pacientes pac 
NATURAL JOIN consultas
WHERE consultas.hora > '14:00';

SELECT amb.nroa, amb.andar
FROM ambulatorios amb
NATURAL JOIN medicos
NATURAL JOIN consultas
where consultas.data = '2020/10/12';

SELECT amb.*, med.codm, med.nome
FROM ambulatorios amb
LEFT JOIN medicos med on amb.nroa = med.nroa;

SELECT med.cpf, med.nome, pac.nome, con.data
FROM consultas con
NATURAL JOIN pacientes pac
RIGHT JOIN medicos med ON med.codm = con.codm;