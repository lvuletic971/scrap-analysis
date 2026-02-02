## DimArticle – ETL process
The ETL process for DimArticle includes the initial preparation of the target table through the Execute SQL Task, followed by a Data Flow Task in which data from multiple tables is transformed and loaded into the dimension table.

### Data source - transaction tables
- Products
- Price list
- Item classifications
- Price and weight categories

### Transformations
- Lookup for item classification
- Lookup for weight categories
- Price list lookup and price category lookup (match / no match)
- Union All for unifying data
- Replace NULL values
- Data type conversion

### Goal
- Filling dimension DimArticle in DW
