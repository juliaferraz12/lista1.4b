--1

CREATE VIEW AlunosDisciplinasCursos AS
SELECT a.nome AS aluno, d.nome AS disciplina, c.nome AS curso
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id
JOIN Cursos c ON d.curso_id = c.id;

--2

CREATE VIEW TotalAlunosPorDisciplina AS
SELECT d.nome AS disciplina, COUNT(m.aluno_id) AS total_alunos
FROM Matriculas m
JOIN Disciplinas d ON m.disciplina_id = d.id
GROUP BY d.nome;

--3 
CREATE VIEW AlunosStatusMatriculas AS
SELECT a.nome AS aluno, d.nome AS disciplina, m.status AS status_matricula
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
JOIN Disciplinas d ON m.disciplina_id = d.id;

--4
CREATE VIEW ProfessoresTurmas AS
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM Professores p
JOIN Turmas t ON p.id = t.professor_id
JOIN Disciplinas d ON t.disciplina_id = d.id;

--5
CREATE VIEW AlunosMaiores20 AS
SELECT nome, data_nascimento
FROM Alunos
WHERE YEAR(CURDATE()) - YEAR(data_nascimento) > 20;

--6
CREATE VIEW CargaHorariaPorCurso AS
SELECT c.nome AS curso, COUNT(d.id) AS total_disciplinas, SUM(d.carga_horaria) AS carga_horaria_total
FROM Cursos c
JOIN Disciplinas d ON c.id = d.curso_id
GROUP BY c.nome;

--7
CREATE VIEW ProfessoresEspecialidades AS
SELECT nome, especialidade
FROM Professores;

--8
CREATE VIEW AlunosMaisDeUmaDisciplina AS
SELECT a.nome, COUNT(m.disciplina_id) AS total_disciplinas
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
GROUP BY a.nome
HAVING COUNT(m.disciplina_id) > 1;

--9
CREATE VIEW AlunosDisciplinasConcluidas AS
SELECT a.nome, COUNT(m.disciplina_id) AS disciplinas_concluidas
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Concluído'
GROUP BY a.nome;

--10
CREATE VIEW TurmasPorSemestre AS
SELECT t.*
FROM Turmas t
WHERE t.semestre = '2024.1';

--11
CREATE VIEW AlunosMatriculasTrancadas AS
SELECT a.nome
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
WHERE m.status = 'Trancado';

--12
CREATE VIEW DisciplinasSemAlunos AS
SELECT d.nome
FROM Disciplinas d
LEFT JOIN Matriculas m ON d.id = m.disciplina_id
WHERE m.aluno_id IS NULL;

--13
CREATE VIEW AlunosPorStatusMatricula AS
SELECT m.status, COUNT(m.aluno_id) AS total_alunos
FROM Matriculas m
GROUP BY m.status;

--14
CREATE VIEW TotalProfessoresPorEspecialidade AS
SELECT p.especialidade, COUNT(p.id) AS total_professores
FROM Professores p
GROUP BY p.especialidade;

--15
CREATE VIEW AlunosIdades AS
SELECT nome, YEAR(CURDATE()) - YEAR(data_nascimento) AS idade
FROM Alunos;

--16
CREATE VIEW UltimasMatriculasAlunos AS
SELECT a.nome, MAX(m.data_matricula) AS ultima_matricula
FROM Alunos a
JOIN Matriculas m ON a.id = m.aluno_id
GROUP BY a.nome;

--17
CREATE VIEW DisciplinasPorCurso AS
SELECT d.nome AS disciplina, c.nome AS curso
FROM Disciplinas d
JOIN Cursos c ON d.curso_id = c.id
WHERE c.nome = 'Engenharia de Software';

--18
CREATE VIEW ProfessoresSemTurmas AS
SELECT p.nome
FROM Professores p
LEFT JOIN Turmas t ON p.id = t.professor_id
WHERE t.professor_id IS NULL;

--19
CREATE VIEW AlunosCpfEmail AS
SELECT nome, cpf, email
FROM Alunos;

--20
CREATE VIEW DisciplinasPorProfessor AS
SELECT p.nome AS professor, COUNT(t.disciplina_id) AS total_disciplinas
FROM Professores p
JOIN Turmas t ON p.id = t.professor_id
GROUP BY p.nome;
