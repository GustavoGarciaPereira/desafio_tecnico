# Desafio Tech DataOps

Este projeto é parte de um desafio técnico para capturar e cruzar informações de empresas, estruturá-las em um banco de dados NoSQL (MongoDB) e disponibilizá-las via uma API usando Ruby on Rails.

## Estrutura do Projeto

- **Ruby on Rails:** Framework principal para desenvolvimento da aplicação.
- **MongoDB:** Banco de dados NoSQL para armazenamento de dados.
- **Elasticsearch:** Utilizado para busca eficiente e indexação de dados.
- **Docker:** Ferramenta de containerização para facilitar a configuração e execução do ambiente de desenvolvimento.
- **Mongoid:** ORM (Object-Relational Mapping) utilizado para integração com o MongoDB.

## Configuração do Ambiente

### Pré-requisitos

Certifique-se de ter Docker e Docker Compose instalados em sua máquina:

- Docker: [Instalação do Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Instalação do Docker Compose](https://docs.docker.com/compose/install/)

### Passos para Configuração

1. **Clone o repositório:**

   ```bash
   git clone git@github.com:GustavoGarciaPereira/desafio_tecnico.git
   cd desafio_tecnico
   ```

2. **Estrutura do Docker Compose:**

   Certifique-se de que os arquivos `docker-compose.yml` para MongoDB e Elasticsearch estejam configurados corretamente.

### Scripts de Inicialização

Existem dois scripts bash para facilitar o gerenciamento dos serviços do MongoDB e Elasticsearch:

#### Script `start_services.sh`

Este script inicializa os serviços do MongoDB e Elasticsearch, executa as tarefas do Rails e inicia o servidor Rails.

```bash
#!/bin/bash

# Entrar na pasta do MongoDB
echo "Entrando na pasta do MongoDB..."
cd mongo/

# Rodar docker-compose up --build
echo "Iniciando MongoDB..."
docker-compose up --build -d
cd ..

# Sair da pasta do MongoDB
echo "Saindo da pasta do MongoDB..."

# Entrar na pasta do Elasticsearch
echo "Entrando na pasta do Elasticsearch..."
cd elasticsearch/

# Rodar docker-compose up --build
echo "Iniciando Elasticsearch..."
docker-compose up --build -d
cd ..

# Sair da pasta do Elasticsearch
echo "Saindo da pasta do Elasticsearch..."

# Executar comandos Rails
echo "Executando comandos Rails..."
rails cnpjs:capture  
rails cnpjs:enrich_basic 
rails cnpjs:enrich_advanced 

# Iniciar servidor Rails
clear
echo "Iniciando servidor Rails..."
echo "http://localhost:3000/search"
echo "http://localhost:3000/search?name=exemplo"
rails server
```

#### Script `down_services.sh`

Este script encerra os serviços do MongoDB e Elasticsearch.

```bash
#!/bin/bash

# Entrar na pasta do MongoDB
cd mongo/

# Rodar docker-compose down -v
docker-compose down -v
cd ..
# Sair da pasta do MongoDB
cd elasticsearch/
docker-compose down -v
cd ..
```

### Executando os Scripts

Para iniciar os serviços e o servidor Rails, execute:

```bash
./start_services.sh
```

Para encerrar os serviços, execute:

```bash
./down_services.sh
```

## Tarefas Automatizadas

### Enriquecimento de CNPJs

Um dos objetivos do projeto é enriquecer dados de CNPJs com informações adicionais. Para isso, criamos uma tarefa Rake:

```ruby
namespace :cnpjs do
  desc "Enriquece CNPJs com informações básicas"
  task enrich_basic: :environment do
    Cnpj.all.each do |cnpj|
      details = CnpjEnrichmentService.enrich(cnpj.value)
      cnpj.update(details)
      puts "Enriched CNPJ #{cnpj.value} with basic details."
    end
  end
end
```


## Conclusão

Este projeto demonstra a integração de Ruby on Rails com MongoDB e Elasticsearch utilizando Docker para simplificar a configuração e execução do ambiente de desenvolvimento. A tarefa de enriquecimento de CNPJs é um exemplo de como automatizar processos dentro da aplicação.

Para mais informações e detalhes sobre o projeto, consulte a documentação completa no repositório.



----------
Considerações 
em vez de usar http://cnpj.info/busca para conseguir os cnpj's eu usei
https://www.idinheiro.com.br/investimentos/cnpj-empresas-listadas-b


a parte do elasticsearch não esta funcionando 100%, não consegui integrar 100%