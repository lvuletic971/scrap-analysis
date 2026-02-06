/*
Purpose:
Preparation of source data for the manufacturing fact table.

This script extracts production transactions for the observed period and separates waste (scrap) records from regular production records.
Waste records include additional attributes related to error type and error cause.
*/

------------------------------------------------------------
-- 1. Waste (scrap) production transactions
------------------------------------------------------------

--INSERT INTO [PrometStavkePro]
SELECT 
	[PrStZapisa] AS SifraSDok,
	[PrStDokumenta] AS BrojDokumentaSDok,
	[PrDatTrans] AS DatumSDok,
	[PrSifMp] AS ArtiklSDok,
	SUM([PrPrevKol]) AS KolicinaPrimljenaSDok,
	PrSifStroskMesta AS MestTroskaSDok,
	[PrSifVrstePrometa] AS VrstaPrometaSDok,
	PrTpVrstaNapake AS GreskaSDok,
	PrTpVzrokNapake AS UzrokGreskeSDok
FROM [Promet] pr
LEFT JOIN PrometTransPos pos ON pr.PrStPrTrans = pos.PrTpStDokumenta
WHERE PrPrevKol >= 0 
AND PrSifVrstePrometa = 'SKA'
AND PrDatTrans BETWEEN '2021-01-01' AND '2023-12-31'  
GROUP BY PrStZapisa, PrStDokumenta, PrDatTrans, PrSifMp, PrSifStroskMesta, PrSifVrstePrometa, PrTpVrstaNapake, PrTpVzrokNapake
--ORDER BY PrDatTrans

------------------------------------------------------------
-- 2. Regular production transactions (non-waste)
------------------------------------------------------------
    
--INSERT INTO [PrometStavkeSka]
SELECT 
	[PrStZapisa] AS SifraSDok,
	[PrStDokumenta] AS BrojDokumentaSDok,
	[PrDatTrans] AS DatumSDok,
	[PrSifMp] AS ArtiklSDok,
	SUM([PrPrevKol]) AS KolicinaPrimljenaSDok,
	PrSifStroskMesta AS MestTroskaSDok,
	[PrSifVrstePrometa] AS VrstaPrometaSDok
FROM [Promet] pr
LEFT JOIN PrometTransPos pos ON pr.PrStPrTrans = pos.PrTpStDokumenta
WHERE PrPrevKol >= 0 
AND PrSifVrstePrometa IN ('PPP', 'PGP') 
AND PrDatTrans BETWEEN '2021-01-01' AND '2023-12-31' 
GROUP BY PrStZapisa, PrStDokumenta, PrDatTrans,PrSifMp, PrSifStroskMesta, PrSifVrstePrometa
--ORDER BY PrDatTrans


SELECT 
	b1.DatumSDok, 
	b1.BrojDokumentaSDok, 
	b1.ArtiklSDok, 
	b1.KolicinaPrimljenaSDok AS ProizvedenaKolicina, 
	COALESCE(b2.KolicinaPrimljenaSDok, 0) AS Skart
FROM [PrometStavkePro] AS b1 
LEFT JOIN PrometStavkeSka AS b2 ON b1.DatumSDok = b2.DatumSDok 
AND b1.BrojDokumentaSDok = b2.BrojDokumentaSDok
AND b1.ArtiklSDok = b2.ArtiklSDok 
---ORDER BY 2,3
