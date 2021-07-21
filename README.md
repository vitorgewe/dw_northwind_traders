# Welcome to my new data warehouse project!

## Main Objective

The goal of this project is to serve as a training to my skills in ELT (yes ELT not ETL) and for everyone that want to learn something from it.
In this repository you will found the third step of ELT (Transform) via DBT, a very practical tool to manipulate raw data to develop a data warehouse to use for deeper analytics works.  

The source data from Northwind Traders can be fund in https://github.com/jasontaylordev/NorthwindTraders.

## DBT docs

You can acess the documentation via this commands inside project:
- dbt docs generate
- dbt docs serve
  
Or you can enter in https://app.netlify.com/sites/lucid-jackson-b876f9/overview

## Tools

Tools used in this project:
- Kondado (https://kondado.com.br/) (Extract)
- GoogleBigQuery (https://cloud.google.com/bigquery) (Load)
- DBT (https://www.getdbt.com/) (Transform)

## Install dependencies

All dependencies are in requirements.txt.
- pip install -r requirements.txt

## Useful commands in the project

To make use of dbt in this project try the following commands:
- dbt run
- dbt test
