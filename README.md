# Manufacturing Waste Analysis – Data Warehouse Project

This project presents the design and implementation of a data warehouse solution for analyzing manufacturing waste in the production of bakery products.

The analysis covers the three-year period 2021–2023, with a business assumption that an acceptable manufacturing waste level should remain below 1% of total production.

The solution covers the complete data pipeline:
- extraction of transactional data
- preparation and transformation using SQL and SSIS
- dimensional data modeling
- and analytical reporting using BI tools.

---

## Data Model

The data warehouse is designed using a **star schema**.

It consists of a central **fact table** that stores manufacturing transactions,
surrounded by multiple **dimension tables** describing:

- products  
- production processes  
- error types and causes  
- time  

The complete [Data Model](./DOCS/DW_model.png) and schema diagram are available in the [DOCS](./DOCS) folder.

---

## Source Data & Staging Approach

To avoid performance impact on the **OLTP production system**, all required transactional and master data is first **extracted into staging tables**
located in a **separate database**.

These staging tables serve as:

- a controlled and stable data source for ETL  
- an isolation layer between OLTP and the data warehouse  
- a place for initial filtering, aggregation, and cleansing  

Only **prepared staging data** is later used for loading dimension and fact tables in the data warehouse.

---

## SQL Preparation Layer

The [SQL](./SQL) folder contains SQL scripts used for preparing **staging datasets** prior to the ETL process.

Each script focuses on a specific **dimension or fact domain** and performs:

- filtering of relevant records  
- deduplication logic  
- aggregation where required  
- preparation of clean, structured datasets for ETL loading  

### SQL Scripts Overview

- **DIM_Article_extract.sql**  
  Prepares article-related data, including finished and semi-finished products,
  classifications, and cost prices.

- **DIM_Error_extract.sql**  
  Extracts error types and error causes associated with manufacturing waste.

- **DIM_ProductionProcesses_extract.sql**  
  Identifies production processes and resolves duplicates using window functions
  to ensure a single process per **item–work center** combination.

- **FACT_Manufacturing_extract.sql**  
  Prepares manufacturing transaction data, separates **waste (scrap)** from
  **regular production**, and produces aggregated quantities used for fact loading.

---

## ETL Process (SSIS)

The ETL layer is implemented using **SQL Server Integration Services (SSIS)**.

ETL packages are responsible for:

- extracting data from prepared **staging tables**  
- performing data cleansing and enrichment via **Lookup transformations**  
- handling missing, unmatched, or inconsistent records  
- loading validated data into **dimension and fact tables**  

Due to their complexity, ETL packages for:

- the **Article dimension**
- the **Manufacturing Fact table**

are documented in additional detail within the project in the folder [ETL](./ETL).

---

## BI & Visualization

The data warehouse serves as the foundation for **analytical reporting**.

Dashboards and visualizations enable analysis of:

- waste trends over time  
- waste distribution by product and production unit  
- key performance indicators related to manufacturing efficiency  

Example reports and dashboards are available in the [BI](./BI) folder.

---

## Tools & Technologies

- SQL Server  
- T-SQL  
- SQL Server Integration Services (SSIS)  
- Power BI / Tableau  
- GitHub
