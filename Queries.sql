SELECT 
    he.id_disciplina,
    d.nome AS nome_disciplina,
    he.ano,
    he.semestre,
    he.nota,
    he.status
FROM 
    HISTORICO_ESCOLAR he
JOIN 
    DISCIPLINA d ON he.id_disciplina = d.id_disciplina
WHERE 
    he.id_aluno = [ID_DO_ALUNO]
    AND he.id_disciplina IN (
        SELECT id_disciplina
        FROM HISTORICO_ESCOLAR
        WHERE id_aluno = [ID_DO_ALUNO]
        GROUP BY id_disciplina
        HAVING COUNT(*) > 1 AND COUNT(*) FILTER (WHERE status = 'Reprovado') > 0
    )
ORDER BY he.id_disciplina, he.ano, he.semestre;

SELECT 
    t.titulo,
    t.ano,
    p.nome AS nome_orientador,
    a.nome AS nome_aluno
FROM 
    TCC t
JOIN 
    PROFESSOR p ON t.orientador_id = p.id_professor
JOIN 
    GRUPO_TCC g ON t.id_grupo = g.id_grupo
JOIN 
    ALUNO_GRUPO ag ON ag.id_grupo = g.id_grupo
JOIN 
    ALUNO a ON ag.id_aluno = a.id_aluno
WHERE 
    p.id_professor = [ID_DO_PROFESSOR];

SELECT 
    t.titulo,
    t.ano,
    p.nome AS nome_orientador,
    a.nome AS nome_aluno
FROM 
    TCC t
JOIN 
    PROFESSOR p ON t.orientador_id = p.id_professor
JOIN 
    GRUPO_TCC g ON t.id_grupo = g.id_grupo
JOIN 
    ALUNO_GRUPO ag ON ag.id_grupo = g.id_grupo
JOIN 
    ALUNO a ON ag.id_aluno = a.id_aluno
WHERE 
    p.id_professor = [ID_DO_PROFESSOR];

SELECT 
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    cd.semestre,
    cd.obrigatoria
FROM 
    CURSO_DISCIPLINA cd
JOIN 
    CURSO c ON cd.id_curso = c.id_curso
JOIN 
    DISCIPLINA d ON cd.id_disciplina = d.id_disciplina
WHERE 
    c.id_curso = [ID_CURSO_1];

SELECT 
    c.nome AS nome_curso,
    d.nome AS nome_disciplina,
    cd.semestre,
    cd.obrigatoria
FROM 
    CURSO_DISCIPLINA cd
JOIN 
    CURSO c ON cd.id_curso = c.id_curso
JOIN 
    DISCIPLINA d ON cd.id_disciplina = d.id_disciplina
WHERE 
    c.id_curso = [ID_CURSO_2];

SELECT 
    d.id_disciplina,
    d.nome AS nome_disciplina,
    p.nome AS nome_professor,
    he.ano,
    he.semestre,
    he.nota,
    he.status
FROM 
    HISTORICO_ESCOLAR he
JOIN 
    DISCIPLINA d ON he.id_disciplina = d.id_disciplina
JOIN 
    PROFESSOR p ON he.id_professor = p.id_professor
WHERE 
    he.id_aluno = [ID_DO_ALUNO]
ORDER BY 
    he.ano, he.semestre;

SELECT 
    COALESCE(p.nome, 'nenhum') AS nome_professor,
    COALESCE(d.nome, 'nenhum') AS departamento,
    COALESCE(c.nome, 'nenhum') AS curso
FROM 
    PROFESSOR p
LEFT JOIN 
    DEPARTAMENTO d ON d.chefe_id = p.id_professor
LEFT JOIN 
    CURSO c ON c.coordenador_id = p.id_professor
WHERE 
    d.chefe_id IS NOT NULL OR c.coordenador_id IS NOT NULL;

SELECT DISTINCT 
    p.id_professor,
    p.nome
FROM 
    LECIONA l
JOIN 
    PROFESSOR p ON l.id_professor = p.id_professor
WHERE 
    l.ano = 2023;

SELECT DISTINCT 
    a.id_aluno,
    a.nome
FROM 
    ALUNO a
JOIN 
    ALUNO_GRUPO ag ON a.id_aluno = ag.id_aluno
JOIN 
    TCC t ON ag.id_grupo = t.id_grupo;

SELECT 
    d.id_disciplina,
    d.nome,
    COUNT(DISTINCT l.id_professor) AS num_professores
FROM 
    LECIONA l
JOIN 
    DISCIPLINA d ON l.id_disciplina = d.id_disciplina
GROUP BY 
    d.id_disciplina, d.nome
HAVING 
    COUNT(DISTINCT l.id_professor) > 1;

SELECT 
    c.nome AS nome_curso,
    COUNT(ac.id_aluno) AS total_alunos
FROM 
    CURSO c
JOIN 
    ALUNO_CURSO ac ON c.id_curso = ac.id_curso
GROUP BY 
    c.nome;

SELECT 
    a.id_aluno,
    a.nome
FROM 
    ALUNO a
LEFT JOIN 
    ALUNO_GRUPO ag ON a.id_aluno = ag.id_aluno
LEFT JOIN 
    TCC t ON ag.id_grupo = t.id_grupo
WHERE 
    t.id_tcc IS NULL;

SELECT 
    p.id_professor,
    p.nome
FROM 
    PROFESSOR p
LEFT JOIN 
    TCC t ON p.id_professor = t.orientador_id
WHERE 
    t.id_tcc IS NULL;

SELECT 
    d.nome
FROM 
    CURSO_DISCIPLINA cd
JOIN 
    DISCIPLINA d ON cd.id_disciplina = d.id_disciplina
WHERE 
    cd.id_curso = [ID_CURSO]
    AND cd.semestre = 1
    AND cd.obrigatoria = TRUE;

SELECT 
    a.id_aluno,
    a.nome,
    ROUND(AVG(he.nota), 2) AS media_notas
FROM 
    ALUNO a
JOIN 
    HISTORICO_ESCOLAR he ON a.id_aluno = he.id_aluno
GROUP BY 
    a.id_aluno, a.nome;

SELECT 
    d.id_disciplina,
    d.nome
FROM 
    DISCIPLINA d
LEFT JOIN 
    LECIONA l ON d.id_disciplina = l.id_disciplina
WHERE 
    l.id_disciplina IS NULL;

