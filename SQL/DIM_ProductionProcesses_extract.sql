/*
Purpose:
Preparation of source data in staging tables used for building the data warehouse dimension.

This script extracts production processes that led to product waste.
For each combination of item and work center, only one production process is selected to avoid duplicates in the dimension.
*/

------------------------------------------------------------
-- Production processes (deduplicated by item and work center)
------------------------------------------------------------

;WITH cte AS (
    SELECT 
        DpSifra AS SifraRPostupka, 
        DpNaziv AS NazivRPostupka, 
        DpSifMp AS MatPodRPpostupka, 
        DpSifDelovnegaCentra AS SifraRCentra,
        DcNaziv AS NazivRCentra,
        ROW_NUMBER() OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra ORDER BY DpNaziv) AS rn,
        COUNT(*) OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra) AS cnt
    FROM 
         DelPostopek
    INNER JOIN 
         DelovniCentri on DpSifDelovnegaCentra = DcSifra
)
--INSERT INTO [KG].[dbo].RadniProcesi (SifraRPostupka, NazivRPostupka, MatPodRPpostupka, SifraRCentra, NazivRCentra)
SELECT
    SifraRPostupka, 
    NazivRPostupka, 
    MatPodRPpostupka, 
    SifraRCentra,
    NazivRCentra
FROM 
    cte
WHERE 
    cnt = 1 OR (cnt > 1 AND rn = 1);
