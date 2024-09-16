# Documentação do Projeto em TypeScript com Prisma e PostgreSQL - Padrão Server

Este projeto é uma aplicação web backend desenvolvida em TypeScript, utilizando o Prisma como ORM (Object-Relational Mapping) para interagir com o banco de dados PostgreSQL. O projeto adere à arquitetura MVC (Model-View-Controller), com uma adição de uma camada de serviço para manter a lógica de negócios complexa separada do controller.

## **Linguagem de programação**

O projeto é desenvolvido utilizando TypeScript, uma extensão tipada do JavaScript. TypeScript adiciona tipos estáticos ao JavaScript, o que pode facilitar o desenvolvimento e a depuração ao tornar os erros mais previsíveis.

## **Banco de dados**

O PostgreSQL é utilizado como banco de dados deste projeto. É um poderoso sistema de banco de dados relacional de código aberto com mais de 30 anos de desenvolvimento ativo.

## **ORM**

Prisma é utilizado como o ORM. Prisma ajuda a mapear os objetos TypeScript para o banco de dados relacional PostgreSQL. Ele oferece uma forma abstrata de interagir com o banco de dados, o que pode simplificar o processo de desenvolvimento e reduzir o potencial para erros.

## **Estrutura de Pastas**

A estrutura de pastas segue o padrão MVC, com adições para serviços e middlewares.

### **`src/controllers`**

Esta pasta contém todos os controladores da aplicação. Os controladores são responsáveis por aceitar as requisições, chamar os serviços apropriados para processar essas requisições, e então responder ao cliente.

### **`src/services`**

A pasta de serviços contém a lógica de negócios. Quando um controlador recebe uma requisição, ele chamará um ou mais serviços para processar essa requisição. Ao manter a lógica de negócios em serviços, o código fica mais modular e mais fácil de manter.

### **`src/middlewares`**

Esta pasta contém todos os middlewares da aplicação. Middlewares são funções que têm acesso ao objeto de requisição, ao objeto de resposta e à próxima função do ciclo de requisição-resposta. Eles são utilizados para executar funções como autenticação, registro, tratamento de erros, etc.

### **`src/routes`**

A pasta de rotas define as rotas da aplicação, isto é, quais controladores e funções são chamados com base na URL e no método HTTP de uma solicitação.

### **`src/server.ts`**

Este é o arquivo que inicializa e configura o servidor. Ele importará todas as rotas, configurará os middlewares e iniciará o servidor para escutar em uma porta específica.

## **Conclusão**

Esta arquitetura é bem organizada e modular, o que a torna escalável e de fácil manutenção. Utilizando TypeScript, Prisma e PostgreSQL, a aplicação é robusta e flexível para lidar com várias necessidades de negócios.