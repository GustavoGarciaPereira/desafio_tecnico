Claro! Aqui está um README que resume o que discutimos até agora e explica o projeto:

---

# Projeto de Desafio Técnico DataOps

## Visão Geral

Este projeto tem como objetivo desenvolver uma aplicação para captura, cruzamento e disponibilização de informações de empresas utilizando tecnologias como Ruby on Rails, MongoDB, Elasticsearch e Docker. O foco principal é criar uma infraestrutura que permita o enriquecimento de dados de CNPJs e a exposição desses dados via API.

## Tecnologias Utilizadas

- **Ruby on Rails**: Framework web para construção da aplicação back-end.
- **MongoDB**: Banco de dados NoSQL para armazenamento dos dados das empresas.
- **Elasticsearch**: Motor de busca e análise de dados utilizado para indexação e pesquisa avançada.
- **Docker**: Plataforma de conteinerização para facilitar o desenvolvimento, implantação e execução do ambiente de desenvolvimento.
- **Ruby**: Linguagem de programação utilizada no desenvolvimento da lógica de negócios e manipulação de dados.

## Configuração do Ambiente

1. **Clone o Repositório:**

   ```bash
   git clone <url-do-seu-repositorio>
   cd <nome-do-seu-repositorio>
   ```

2. **Configuração do Docker Compose:**

   O arquivo `docker-compose.yml` contém a configuração dos serviços necessários (Rails, MongoDB, Elasticsearch).

   Exemplo de `docker-compose.yml`:

   ```yaml
   version: '3'
   services:
     app:
       build:
         context: .
         dockerfile: Dockerfile
       depends_on:
         - db
         - elasticsearch
       ports:
         - "3000:3000"
       volumes:
         - .:/app
     db:
       image: mongo:latest
       environment:
         MONGO_INITDB_ROOT_USERNAME: adminUser
         MONGO_INITDB_ROOT_PASSWORD: adminPassword
       ports:
         - "27017:27017"
       volumes:
         - mongo-data:/data/db
     elasticsearch:
       image: docker.elastic.co/elasticsearch/elasticsearch:7.15.1
       environment:
         - discovery.type=single-node
       ports:
         - "9200:9200"
   ```

3. **Construção e Inicialização do Ambiente:**

   ```bash
   docker-compose up --build
   ```

4. **Execução de Comandos Rails:**

   Para executar comandos do Rails dentro do container:

   ```bash
   docker-compose run app rails <comando-do-rails>
   ```

5. **Testar a Aplicação:**

   Abra o navegador e acesse `http://localhost:3000` para acessar a aplicação Ruby on Rails.
   Abra o navegador e acesse`http://localhost:3000/search?name=exemplo`para acessar a aplicação Ruby on Rails.
   Abra o navegador e acesse`http://localhost:3000/search`para acessar a aplicação Ruby on Rails.

## Funcionalidades Implementadas

- **Captura de Dados**: Integração com API de enriquecimento de CNPJs para captura de informações básicas das empresas.
- **Armazenamento e Indexação**: Utilização do MongoDB para armazenar os dados e Elasticsearch para indexação e pesquisa avançada.
- **Exposição via API**: Desenvolvimento de endpoints para acesso aos dados enriquecidos via API RESTful.
- **Integração de Serviços**: Uso de Docker Compose para facilitar a integração e execução dos serviços necessários.

Este projeto está em constante evolução e adaptação às necessidades específicas do desafio técnico DataOps, focando em eficiência na manipulação e disponibilização de dados de empresas brasileiras.

---

Personalize o README com mais detalhes específicos conforme o desenvolvimento do projeto avança e novas funcionalidades são implementadas.
