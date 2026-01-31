--Select for errors

--INSERT INTO [KG].[dbo].[DodatniPodaci]
SELECT 
	MSSifra AS SifrDP,
	MSTipSif AS TipDP,
	MSNaziv AS NazivDP
FROM MaliSifranti
WHERE MSTipSif IN ('VRN', 'VZN') 
