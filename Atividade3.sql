SELECT *
FROM medicos
WHERE idade < 40
or especialidade != 'traumatologia';

SELECT nome, idade
FROM pacientes
where cidade != 'Florianopolis';

SELECT nome, idade * 12 as IdadeMeses
FROm funcionarios;

SELECT max(hora) as UltimaConsulta
from consultas
WHERE data = '2020/10/13';

SELECT AVG(idade) as MediaIdade, COUNT(DISTINCT nroa) as TotalAmbulatorios
from medicos;

SELECT codf, nome, salario * 0.8 as SalarioLiquido
from funcionarios;

SELECT nome
from funcionarios
WHERE nome like '%a';

SELECT nome, especialidade
FROM medicos
WHERE nome LIKE '_o%o';

SELECT codp, nome 
from pacientes
where idade > 25 and doenca in ('tendinite', 'fratura', 'gripe', 'sarampo');

SELECT cpf, nome, idade
from medicos
WHERE cidade = 'Florianopolis'
UNION
SELECT cpf, nome, idade
from pacientes
WHERE cidade = 'Florianopolis'
UNION
SELECT cpf, nome, idade
from funcionarios
WHERE cidade = 'Florianopolis';