# Desafio DevOps Apiki.

Objetivo é criar um processo automatizado para construção de um servidor web para WordPress em sua última versão.

## 🚀 Começando

Foi criado um processo automatizado para provisionar pelo terraform um ambiente na AWS de alta disponibilidade utilizando ECS.

A arquitetura escolhida ECS - ASG - ALB - VPC - RDS - ROUTE53



### 📋 Pré-requisitos

Necessário adicionar as secrets no repositório do Github para realizar o deploy da aplicação (chaves serão informadas por e-mail)

```
AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY 
```
### 🔧 Instalação

Uma vez configurado os secrets conforme informado nos Pré-requesitos, é necessário executar o o pipeline terraform-deploy para provisionar todo o ambiente dentro da AWS

## ⚙️ Executando os testes

Após a conclusão do pipeline, a aplicação estará disponível na URL https://wp.clusterpoc.com/

### 🔩 Finalização

Após realizar os testes basta rodar o pipeline terraform-destroy que todo o ambiente possa ser desprovisionado

## 📦 Acesso a AWS

Os dados do usuário root para acesso ao console da AWS para verificar a estrutura serão informados por e-mail

## ✒️ Autor

Diego Ramos