#!/bin/bash

# Entrar na pasta do MongoDB
cd mongo/

# Rodar docker-compose up --build
docker-compose down -v
cd ..
# Sair da pasta do MongoDB
cd elasticsearch/
docker-compose down -v
cd ..

