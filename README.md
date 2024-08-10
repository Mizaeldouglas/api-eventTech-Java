# API EventTech Java

## Descrição do Projeto

Este projeto é uma API desenvolvida em Java para o EventTech. A API permite a gestão de eventos, incluindo criação, atualização, exclusão e consulta de eventos. É construída utilizando o framework Spring Boot, que facilita a criação de aplicações Java robustas e escaláveis.

## Tecnologias Utilizadas

- Java 17
- Spring Boot 3.3.2
- Maven
- postgresql
- AWS S3 (para armazenamento de imagens)
- Swagger (para documentação da API)

## Como Instalar e Executar

1. Clone este repositório:
   `git clone https://github.com/Mizaeldouglas/api-eventTech-Java.git`
2. Navegue até a pasta do projeto:
   `cd api-eventTech-Java`
3. Instale as dependências do projeto utilizando Maven:
   `mvn clean install`
4. Configure as variáveis de ambiente:
   ```ini
   APP_NAME=api
   DATABASE_URL=jdbc:postgresql://<seu-host>/<seu-database>
   DATABASE_USER=<seu-usuario>
   DATABASE_PASSWORD=<sua-senha>
   AWS_REGION=us-east-1
   AWS_BUCKET_NAME=eventostec-imagens-mizael
   SWAGGER_PATH=/swagger-ui.html
   MULTIPART_ENABLED=true
   MULTIPART_MAX_FILE_SIZE=10MB
   MULTIPART_MAX_REQUEST_SIZE=10MB
   ```
5. Inicie a aplicação:
   `mvn spring-boot:run`

<hr>

 A aplicação estará disponível em `http://localhost:8080`

## Funcionalidades

API oferece as seguintes funcionalidades:

- **Criação de Eventos**: Permite criar novos eventos com detalhes como nome, data, local e descrição.
- **Consulta de Eventos**: Permite consultar eventos por diferentes critérios, como data e local.
- **Upload de Imagens**: Permite o upload de imagens para eventos utilizando AWS S3.
- **Gestão de Cupons**: Permite adicionar e consultar cupons associados a eventos.

## Exemplo de endpoint para criação de evento:
* obs: utilizar no body o Multipart Form Data para envio de imagem


### POST /api/events
```json
{
  "name": "Tech Conference",
  "date": "2023-10-01",
  "city": "São Paulo",
  "description": "A conference about the latest in tech.",
  "state": "SP",
  "remote": false,
  "eventUrl": "https://techconference.com",
  "image": "aquivo de imagem (file)"
}
```

### POST /api/events/{eventId}/coupons
```json
{
   "code": "DISCOUNT10",
   "discount": 10.0,
   "valid": "2023-12-31"
}
```

### GET /api/event?page=0&size=10
```json
{
   "page": 0,
   "size": 10
}
```

### GET /api/event/filter?page=0&size=8&state=SP&city=Paulo&title=Tech
```json
{
   "page": 0,
   "size": 10,
   "title": "Tech",
   "city": "São Paulo",
   "uf": "SP",
   "startDate": "2023-09-01",
   "endDate": "2023-12-31"
}
```

### GET /api/event/{eventId}
```json
{
   "id": "edc45493-c59b-41c2-b754-55a90aff80ce",
   "name": "Tech Conference",
   "date": "2023-10-01",
   "city": "São Paulo",
   "description": "A conference about the latest in tech.",
   "state": "SP",
   "remote": false,
   "eventUrl": "https://techconference.com",
   "image": "aquivo de imagem (file)",
   "coupons": []
}
```

## Documentação da API
* A documentação da API pode ser acessada através do Swagger em https://api-eventtech-java.onrender.com/swagger-ui/index.html.  
