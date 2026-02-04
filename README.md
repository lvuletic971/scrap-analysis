# Manufacturing Waste Analysis – Data Warehouse Project

This project presents the design and implementation of a data warehouse solution for analyzing manufacturing waste in the production of bakery products.

The solution covers the complete data pipeline:
- extraction of transactional data
- preparation and transformation using SQL and SSIS
- dimensional data modeling
- and analytical reporting using BI tools.

## Data Model

The data warehouse is designed using a star schema.
It consists of a central fact table that stores manufacturing transactions, surrounded by multiple dimensions that describe products, production processes,
errors, time.

The complete data model is available in the `/docs` folder.

## SQL Preparation Layer

The `/SQL` folder contains SQL scripts used for preparing source data prior to the ETL process.

Each script focuses on a specific dimension or fact and performs:
- filtering of relevant records
- deduplication logic
- aggregation where needed
- and preparation of clean datasets for loading into the data warehouse.

### SQL Scripts Overview

- **dim_article_prepare.sql**  
  Prepares article-related data, including finished and semi-finished products, classifications and cost prices.

- **dim_error_prepare.sql**  
  Extracts error types and error causes related to manufacturing waste.

- **dim_production_process_prepare.sql**  
  Identifies production processes and resolves duplicates using window functions to ensure one process per item and work center.

- **fact_manufacturing_prepare.sql**  
  Prepares manufacturing transactions and separates waste (scrap) records from regular production records.

## ETL Process (SSIS)

The ETL layer is implemented using SQL Server Integration Services (SSIS).

ETL packages handle:
- data extraction from prepared SQL datasets,
- data cleansing and enrichment using lookup transformations,
- handling of missing and unmatched records,
- and loading of data into dimension and fact tables.

Due to their complexity, ETL packages for the Article dimension and
the Manufacturing Fact table are documented in detail.

## BI & Visualization

The data warehouse is used as a source for analytical reporting.
Dashboards and visualizations were created to analyze:
- waste trends over time,
- waste distribution by product and production unit,
- key performance indicators related to manufacturing efficiency.

Example reports and dashboards are available in the `/BI` folder.

## Tools & Technologies

- SQL Server
- SQL (T-SQL)
- SQL Server Integration Services (SSIS)
- Power BI / Tableau
- GitHub
