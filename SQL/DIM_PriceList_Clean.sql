--INSERT INTO [Cenovnik]
SELECT 
	CnStZapisa AS SifraC,
	CnSifMp AS ArtiklC,
	CAST(CnDatSpremembe AS date) AS DatumC,
	CnRazTipCn AS TipCenovnika,
	CnSklad AS SkladisteC,
	CnCena AS CenaC
FROM Cenik c --to je view na KG
WHERE c.CnRazTipCn ='4' AND c.CnDatSpremembe BETWEEN '2021-10-01' AND '2021-12-31' 
ORDER BY DatumC DESC, ArtiklC, ArtiklCS
