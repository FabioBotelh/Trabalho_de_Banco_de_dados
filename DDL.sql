DDL para criação de tabelas
-- Criação das Tabelas

-- Tabela Professor
CREATE TABLE PROFESSOR (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela Departamento
CREATE TABLE DEPARTAMENTO (
    id_departamento SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    chefe_id INT,
    CONSTRAINT fk_chefe_professor FOREIGN KEY (chefe_id) REFERENCES PROFESSOR(id_professor)
);

-- Tabela Curso
CREATE TABLE CURSO (
    id_curso SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    coordenador_id INT,
    CONSTRAINT fk_coordenador FOREIGN KEY (coordenador_id) REFERENCES PROFESSOR(id_professor)
);

-- Tabela Disciplina
CREATE TABLE DISCIPLINA (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Curso_Disciplina (Matriz Curricular)
CREATE TABLE CURSO_DISCIPLINA (
    id_curso INT,
    id_disciplina INT,
    semestre INT,
    obrigatoria BOOLEAN,
    PRIMARY KEY (id_curso, id_disciplina),
    CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso),
    CONSTRAINT fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

-- Tabela Aluno
CREATE TABLE ALUNO (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Tabela Histórico Escolar
CREATE TABLE HISTORICO_ESCOLAR (
    id_aluno INT,
    id_disciplina INT,
    ano INT,
    semestre INT,
    nota FLOAT,
    aprovado BOOLEAN,
    PRIMARY KEY (id_aluno, id_disciplina, ano, semestre),
    CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno),
    CONSTRAINT fk_disciplina_historico FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

-- Tabela Lecciona (professor lecionando disciplinas)
CREATE TABLE LECIONA (
    id_professor INT,
    id_disciplina INT,
    ano INT,
    semestre INT,
    PRIMARY KEY (id_professor, id_disciplina),
    CONSTRAINT fk_professor FOREIGN KEY (id_professor) REFERENCES PROFESSOR(id_professor),
    CONSTRAINT fk_disciplina_leciona FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)
);

-- Tabela Grupo_TCC
CREATE TABLE GRUPO_TCC (
    id_grupo SERIAL PRIMARY KEY,
    nome_opcional VARCHAR(100)
);

-- Tabela Aluno_Grupo (relacionando alunos aos grupos de TCC)
CREATE TABLE ALUNO_GRUPO (
    id_aluno INT,
    id_grupo INT,
    PRIMARY KEY (id_aluno, id_grupo),
    CONSTRAINT fk_aluno_grupo FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno),
    CONSTRAINT fk_grupo FOREIGN KEY (id_grupo) REFERENCES GRUPO_TCC(id_grupo)
);

-- Tabela TCC
CREATE TABLE TCC (
    id_tcc SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
    ano INT,
    id_grupo INT,
    orientador_id INT,
    CONSTRAINT fk_grupo_tcc FOREIGN KEY (id_grupo) REFERENCES GRUPO_TCC(id_grupo),
    CONSTRAINT fk_orientador FOREIGN KEY (orientador_id) REFERENCES PROFESSOR(id_professor)
);
