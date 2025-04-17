# gerador.py

from faker import Faker
import random
from datetime import datetime

def gerar_dados():
    fake = Faker('pt_BR')
    random.seed(42)

    NUM_CURSOS = 6
    NUM_PROFESSORES = 15
    NUM_ALUNOS = 80
    ANO_ATUAL = 2025
    SEMESTRE_ATUAL = 1
    MIN_SEMESTRES_CURSO = 4
    MAX_SEMESTRES_CURSO = 12

    # Listas para armazenar os dados
    departamentos = []
    professores = []
    cursos = []
    disciplinas = []
    curso_disciplinas = {}
    alunos = []
    turmas = []
    turma_disciplinas = []
    turma_alunos = []
    boletins = []

    def gerar_cpf():
        return f"{random.randint(100, 999)}.{random.randint(100, 999)}.{random.randint(100, 999)}-{random.randint(10, 99)}"

    def calcular_semestre_atual(ano_entrada, semestre_entrada):
        return (ANO_ATUAL - ano_entrada) * 2 + (SEMESTRE_ATUAL - semestre_entrada) + 1

    # Gerar departamentos
    for i in range(3):
        departamentos.append((i+1, f"Departamento de {fake.word().capitalize()}"))

    # Gerar professores
    for i in range(NUM_PROFESSORES):
        professores.append((i+1, fake.name(), gerar_cpf(), fake.email()))

    # Gerar cursos
    for i in range(NUM_CURSOS):
        id_departamento = random.choice(departamentos)[0]
        id_coordenador = random.choice(professores)[0]
        nome_curso = f"{fake.word().capitalize()} Aplicada"
        num_semestres = random.randint(MIN_SEMESTRES_CURSO, MAX_SEMESTRES_CURSO)
        cursos.append((i+1, nome_curso, id_departamento, id_coordenador, num_semestres))

    # Gerar disciplinas
    for i in range(20):
        nome = f"{fake.word().capitalize()} Avançada"
        codigo = f"D{i+1:03}"
        carga = random.choice([60, 80, 100])
        disciplinas.append((i+1, nome, codigo, carga))

    # Gerar relação Curso-Disciplina
    for curso in cursos:
        id_curso, _, _, _, num_semestres = curso
        curso_disciplinas[id_curso] = random.sample([d[0] for d in disciplinas], random.randint(6, 10))

    # Gerar alunos
    for i in range(NUM_ALUNOS):
        nome = fake.name()
        cpf = gerar_cpf()
        email = fake.email()
        id_curso = random.choice(cursos)[0]
        ano_entrada = random.choice([2021, 2022, 2023, 2024])
        semestre_entrada = random.choice([1, 2])
        alunos.append((i+1, nome, cpf, email, id_curso, ano_entrada, semestre_entrada))

    # Gerar turmas
    id_turma = 1
    for ano in range(2021, ANO_ATUAL + 1):
        for semestre in [1, 2]:
            if ano == ANO_ATUAL and semestre > SEMESTRE_ATUAL:
                continue
            for _ in range(2):
                turmas.append((id_turma, ano, semestre))
                id_turma += 1

    # Gerar relações de turmas e disciplinas
    for turma in turmas:
        id_turma, _, _ = turma
        disciplinas_escolhidas = random.sample(disciplinas, 3)
        for d in disciplinas_escolhidas:
            id_disciplina = d[0]
            turma_disciplinas.append((id_turma, id_disciplina))

    # Gerar relação de turmas e alunos
    for aluno in alunos:
        id_aluno, _, _, _, id_curso, ano_entrada, semestre_entrada = aluno
        semestre_atual = calcular_semestre_atual(ano_entrada, semestre_entrada)
        turmas_compativeis = [t for t in turmas if calcular_semestre_atual(t[1], t[2]) == semestre_atual]
        if turmas_compativeis:
            turma = random.choice(turmas_compativeis)
            turma_alunos.append((turma[0], id_aluno, turma[1]))

    # Gerar boletins
    for aluno in alunos:
        id_aluno, _, _, _, id_curso, ano_entrada, semestre_entrada = aluno
        semestre_atual = calcular_semestre_atual(ano_entrada, semestre_entrada)
        disciplinas_do_curso = curso_disciplinas[id_curso]
        disciplinas_do_aluno = random.sample(disciplinas_do_curso, min(4, len(disciplinas_do_curso)))
        
        for id_disciplina in disciplinas_do_aluno:
            nota = round(random.uniform(5, 10), 2)
            status = "Aprovado" if nota >= 6 else "Reprovado"
            boletins.append((id_aluno, id_disciplina, nota, status, ANO_ATUAL, SEMESTRE_ATUAL))

    return departamentos, professores, cursos, disciplinas, curso_disciplinas, alunos, turmas, turma_disciplinas, turma_alunos, boletins
