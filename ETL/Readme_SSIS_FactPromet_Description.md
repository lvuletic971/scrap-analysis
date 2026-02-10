## FactPromet – ETL process

The process begins with an Execute SQL Task that ensures the target fact table structure is ready for loading.
This is followed by a Data Flow Task where production and waste transactions are extracted, transformed, and merged into a unified analytical dataset.

### Data source – transaction tables

Production and waste information is extracted from:

- Production transaction records

- Waste (scrap) transaction records

- Supporting lookup tables for errors, causes, dates, products, and production processes

These datasets are first prepared in a staging database to avoid performance impact on the operational system.

### Transformations

Key transformations in the Data Flow include:

- Separation of waste vs. regular production transactions

- Aggregation of produced quantities and waste amounts

- Joining staging datasets to align production and scrap by date, document, and product

- Lookup transformations for:

  - Product dimension

  - Date dimension

  - Production process dimension

  - Error type and error cause dimensions

- Handling of missing matches and default values

- Calculation of analytical measures:

  - produced quantity

  - waste quantity

  - waste percentage

  - waste value

Goal

The final goal of this ETL process is:

➡️ Populating the FactPromet table
➡️ Providing a clean, aggregated, analysis-ready dataset
➡️ Enabling time-series, product-level, and root-cause waste analysis in BI tools.
