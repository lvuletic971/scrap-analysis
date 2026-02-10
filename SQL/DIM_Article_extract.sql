/*
Purpose:
Preparation of source data in staging tables used for building the data warehouse dimension.

This script extracts:
- finished and semi-finished products
- article classifications
- cost prices valid for the observed period.

The extracted datasets are later used in the SSIS ETL process for populating the DimArticle table.
*/

------------------------------------------------------------
-- 1. Articles (finished and semi-finished products)
------------------------------------------------------------

--INSERT INTO [KG].[dbo].[Artikli]
SELECT 
	MpSifra AS SifraA,
	MpNaziv AS NazivA,
	MpOsnSklad AS SkladisteA,
	MpSifKarKlj AS KKljucA,
	MpSifPlaKlj AS PKljucA,
	MpSifEnoteMere1 AS JedinicaMereA,
	MpTeza AS TezinaA,
	MpOznKlas AS KlasifikacijaA,
	MpOznTez AS KategorijaTezinaA,
	MpCena AS KategorijaCenaA
FROM MaticniPodatki
WHERE MpSifKarKlj IN ('I', 'P') 
	
------------------------------------------------------------
-- 2. Article classifications
------------------------------------------------------------
	
--INSERT INTO [KG].[dbo].[Klasifikacija]
SELECT 
	KLoStZapisa AS SifraKlasif,
	KLoOpis AS OpisKlasif
FROM KlasOzn
	
------------------------------------------------------------
-- 3. Cost prices from price list
------------------------------------------------------------
	
--INSERT INTO [KG].[dbo].[Cenovnik]
SELECT 
	CnStZapisa AS SifraC,
	CnSifMp AS ArtiklC,
	CAST(CnDatSpremembe AS date) AS DatumC,
	CnRazTipCn AS TipCenovnika,
	CnSklad AS SkladisteC,
	CnCena AS CenaC
FROM Cenik c
WHERE c.CnRazTipCn ='4' AND c.CnDatSpremembe BETWEEN '2021-10-01' AND '2021-12-31' 
ORDER BY DatumC DESC, ArtiklC
