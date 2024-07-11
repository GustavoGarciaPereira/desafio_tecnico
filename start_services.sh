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
