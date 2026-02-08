/*
Purpose:
Preparation of source data in staging tables used for building the data warehouse dimensions.

This script extracts error types and error causes related to production waste.
The data is used to populate two dimensions in the data warehouse:
- DimErrorType
- DimErrorCause
*/

------------------------------------------------------------
-- Error types and error causes
------------------------------------------------------------

--INSERT INTO [KG].[dbo].[DodatniPodaci]
SELECT 
	MSSifra AS SifrDP,
	MSTipSif AS TipDP,
	MSNaziv AS NazivDP
FROM MaliSifranti
WHERE MSTipSif IN ('VRN', 'VZN') 
