--Separation of waste items in the overall observed period of 3 years

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
LEFT JOIN PrometTransPos pos on pr.PrStPrTrans = pos.PrTpStDokumenta
WHERE PrPrevKol >= 0 
AND PrSifVrstePrometa = 'SKA'
AND PrDatTrans >= '2021-10-01' AND PrDatTrans <= '2023-12-31' 
GROUP BY PrStZapisa, PrStDokumenta, PrDatTrans, PrSifMp, PrSifStroskMesta, PrSifVrstePrometa, PrTpVrstaNapake, PrTpVzrokNapake
ORDER BY PrDatTrans

--Separation of other manufactured items that are not waste in the observed period
    
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
LEFT JOIN PrometTransPos pos on pr.PrStPrTrans = pos.PrTpStDokumenta
WHERE PrPrevKol >= 0 
AND (PrSifVrstePrometa = 'PPP' OR PrSifVrstePrometa = 'PGP') 
AND PrDatTrans >= '2021-10-01' AND PrDatTrans <= '2023-12-31' 
GROUP BY PrStZapisa, PrStDokumenta, PrDatTrans,PrSifMp, PrSifStroskMesta, PrSifVrstePrometa
ORDER BY PrDatTrans
