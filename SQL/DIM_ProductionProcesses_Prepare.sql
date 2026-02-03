--Isolating the work process that led to product waste, for a combination of one item and one work center

--INSERT INTO [RadniProcesi]
;WITH cte AS (
    SELECT 
        DpSifra AS SifraRP, 
        DpNaziv AS NazivRP, 
        DpSifMp AS MatPodRP, 
        DpSifDelovnegaCentra AS RadCenRP,
        ROW_NUMBER() OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra ORDER BY DpNaziv) AS rn,
        COUNT(*) OVER (PARTITION BY DpSifMp, DpSifDelovnegaCentra) AS cnt
    FROM 
         delpostopek
)
--INSERT INTO RadniPostupci(SifraRP, NazivRP, MatPodRP,  RadCenRP)
SELECT
    SifraRP, 
    NazivRP, 
    MatPodRP, 
    RadCenRP
FROM 
    cte
WHERE 
    cnt = 1 OR (cnt > 1 AND rn = 1);
