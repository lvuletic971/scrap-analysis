## SQL_Data_Preparation_Layer

This folder contains SQL scripts used to prepare source data before loading it into the data warehouse.

The goal of this layer is to:

- extract relevant transactional and master data

- perform filtering, deduplication, and aggregation

- separate waste (scrap) production from regular manufacturing

- create clean staging datasets used by SSIS ETL processes

- avoid direct querying of the OLTP system to preserve performance.

All scripts follow the same workflow:

- Data is extracted from OLTP tables

- Cleaned data is stored in a staging database

- SSIS loads the data into dimension and fact tables

## Scripts Overview:

### DIM_Article_extract.sql

Prepares data for the Article dimension:

- finished and semi-finished products

- product classifications

- valid cost prices.

### DIM_Error_extract.sql

- extracts error types and causes related to manufacturing waste, used for building error dimensions.

### DIM_ProductionProcesses_extract.sql

- identifies unique production processes per item and work center and removes duplicates using window functions.

### FACT_Manufacturing_extract.sql

Prepares the manufacturing fact dataset by:

- separating scrap vs. regular production

- aggregating produced quantities

- preserving error attributes for scrap records

## Architectural Role

This SQL layer represents the staging boundary between the transactional OLTP system and the analytical data warehouse,
ensuring clean, consistent, and performance-safe data for ETL.
