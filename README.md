## 🚀  E-commerce & Logística com PostgreSQL

## Projeto prático de Banco de Dados simulando o backend e a camada analítica de um sistema de vendas, com foco em modelagem relacional, consultas SQL, validação de dados e visualização para suporte à decisão.

## 🎯 Objetivo do Projeto

Simular um ambiente corporativo de e-commerce, estruturando:
Banco de dados relacional
Consultas analíticas para indicadores de negócio
Tratamento e validação de dados com Python
Construção de dashboard executivo

## 🗄️ Etapa 1: Modelagem e Banco de Dados
Modelagem Relacional
Criação de tabelas com relacionamentos 1:N e N:N
Aplicação de normalização
Estrutura preparada para maior volume de dados
Queries Analíticas
Desenvolvimento de consultas SQL para:
Faturamento por estado
Ticket Médio
Ranking de receita por região
Receita por canal de venda
Performance

## Uso de EXPLAIN para análise de consultas

Identificação de possíveis gargalos

## 🐍 Etapa 2: Tratamento e Validação com Python

Objetivo: validar e analisar os dados fora do banco, simulando fluxo real de BI.

## Ambiente

Criação de ambiente .conda
Uso de Pandas e Matplotlib
Validação Cruzada
Conferência de valores entre PostgreSQL e Python
Identificação de divergência causada por pedidos cancelados no CSV
Aplicação de filtros de status no Pandas
Validação final com 100% de precisão em relação ao banco

## Exemplo validado:
CE: R$ 33.929,83

## Aprendizados
Estrutura de dados em DataFrame
Tratamento de inconsistências
Correção de erros (ex: NameError)

## Uso de IA como apoio para acelerar escrita de código

## 📊 Etapa 3: Dashboard de Performance Comercial

Com a base estruturada e validada, foi desenvolvido um dashboard com foco executivo.

## Destaques:

KPIs em formato de cards
Ticket Médio: R$ 10.954,96
Receita por canal (Marketplace, Site, Loja Física)
Ranking por estado
Análise mensal de faturamento
Monitoramento de Anomalias
Identificação de queda de -85,60% em março/2026, simulando cenário de investigação técnica.

## ⚠️ Qualidade e Controle de Dados

Durante o projeto foi identificada uma atualização massiva de status em 03/02/2026 que padronizou pedidos como “Pago”.
Impactos:
Métricas de cancelamento ficaram comprometidas
Análises redirecionadas para faturamento e comportamento de compra
Para fins analíticos, foi criada base simulada com distribuição controlada:

## 70% pagos
## 20% cancelados
## 10% pendentes

## A base original foi preservada para controle e rastreabilidade.

## 🛠️ Tecnologias

PostgreSQL
MySQL
Python (Pandas, Matplotlib)
VS Code

