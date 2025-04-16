# Projeto 1 - Banco de Dados para uma Universidade

## 📘 Descrição

Este projeto tem como objetivo implementar um sistema de banco de dados para uma universidade. O sistema é responsável por armazenar e gerenciar diversas informações acadêmicas, como:

- Alunos  
- Professores  
- Departamentos  
- Cursos  
- Disciplinas  
- Históricos escolares  
- TCCs (incluindo grupo de alunos e professor orientador)

Além disso, o projeto inclui a criação de **queries em SQL** que atendem a casos de uso específicos para validação do funcionamento do banco.

## 🧠 Consultas SQL Implementadas

1. **Histórico escolar de um aluno com reprovações**  
   - Exibe as reprovações em disciplinas e as aprovações subsequentes, se houverem.

2. **TCCs orientados por um professor**  
   - Lista os TCCs orientados por determinado professor, com os nomes dos alunos envolvidos.

3. **Matriz curricular de dois cursos com disciplinas em comum**  
   - Duas queries distintas, cada uma retornando a matriz curricular de um curso.

4. **Disciplinas cursadas por um aluno com nomes dos professores**  
   - Mostra as disciplinas já cursadas por um aluno e os respectivos professores.

5. **Lista de chefes de departamento e coordenadores de curso**  
   - Uma única query retorna:
     - Nome do professor  
     - Nome do departamento (ou "nenhum")  
     - Nome do curso (ou "nenhum")  

## 🛠️ Tecnologias utilizadas

- **SQL**

## 🚀 Como executar o projeto

### 1. Clone este repositório
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2. Crie o banco de dados

Acesse seu SGBD (MySQL, PostgreSQL, etc.) e crie um banco de dados:

```sql
CREATE DATABASE universidade;
```

### 3. Importe o script SQL

Utilize o arquivo `script.sql` (ou o nome que você definiu) para popular o banco com as tabelas e dados iniciais. Exemplo usando o terminal:

#### Para MySQL:
```bash
mysql -u seu_usuario -p universidade < script.sql
```

#### Para PostgreSQL:
```bash
psql -U seu_usuario -d universidade -f script.sql
```

> **Observação**: Substitua `seu_usuario` pelo seu nome de usuário no banco.

### 4. Teste as queries

Você pode executar os comandos SQL das consultas propostas em qualquer interface de banco de dados como:

- DBeaver  
- MySQL Workbench  
- pgAdmin  
- Linha de comando

## 👥 Autores

- Fabio M. Botelho  
- Larissa S. Fiusa

## 📄 Licença

Este projeto não possui uma licença definida no momento.

---
