# API EventTech Java

## Descrição do Projeto

Este projeto é uma API desenvolvida em Java para o EventTech. A API permite a gestão de eventos, incluindo criação, atualização, exclusão e consulta de eventos. É construída utilizando o framework Spring Boot, que facilita a criação de aplicações Java robustas e escaláveis.

## Tecnologias Utilizadas

- Java 11
- Spring Boot 2.5
- Maven 3.6
- H2 Database (ou outro banco de dados de sua escolha)
- JUnit 5 (para testes)

## Como Instalar e Executar

1. Clone este repositório:  
   `git clone https://github.com/seu-usuario/eventtech-api.git`
2. Navegue até a pasta do projeto:  
   `cd eventtech-api`
3. Instale as dependências do projeto utilizando Maven:  
   `mvn clean install`
4. Inicie a aplicação:  
   `mvn spring-boot:run`

A aplicação estará disponível em `http://localhost:8080`.

## Funcionalidades

A API oferece as seguintes funcionalidades:

- Criação de Eventos: Permite criar novos eventos com detalhes como nome, data, local e descrição.
- Atualização de Eventos: Permite atualizar informações de eventos existentes.
- Exclusão de Eventos: Permite excluir eventos.
- Consulta de Eventos: Permite consultar eventos por diferentes critérios, como data e local.

Exemplo de endpoint para criação de evento:

```json
POST /api/events
{
  "name": "Tech Conference",
  "date": "2023-10-01",
  "city": "São Paulo",
  "description": "A conference about the latest in tech.",
  "state": "SP",
  "remote": false,
  "eventUrl": "https://techconference.com",
  "image": "https://techconference.com/logo.png"
}
