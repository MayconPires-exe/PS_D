# Prova de Sistemas Distribuídos

## Ferramentas utilizadas 
> [Node](https://nodejs.org/en), [Knex](https://knexjs.org), [Fastify](https://www.fastify.io), [ESLint](https://eslint.org)
 * ### Biblioteca Utilizada / Linguagem utilizada
   * > [TypeScript](https://www.typescriptlang.org)

## Informações sobre o projeto
  ### Como baixar o projeto
  ```bash
  # Clone este repositório
  $ git clone https://github.com/MayconPires-exe/PS_D.git
  # Acesse a pasta do projeto no terminal/cmd
  $ cd PS_D/02-api-rest-nodejs
  # Instale as dependências
  $ npm install
  ```
  ## Como executar o projeto
  ```bash
  # Execute a aplicação
  $ npm run dev
  ```

## Notas sobre o banco utilizado
* O banco por ser uma aplicação simples, será feito em SQLite podendo sim ser feito a migração para outros bancos relacionais tendo como referencia o [Knex](https://knexjs.org)
* Tabela usada como (PK) interger sera um uuid => (Universally Unique Identifier) poís a representação de um projeto real é melhor recomendado.
