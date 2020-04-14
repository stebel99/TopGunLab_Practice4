--1.Вывод всех плантаций
SELECT [Id],[Name] FROM [Practice4db].[dbo].[Plantation];

--2.Вывод данных по плантации: 
--список цветов и их количество. 
--Столбцы в результате: Id плантации, имя, адрес, ИМЯ ВИДА ЦВЕТОВ, количество
USE [Practice4db]

SELECT P.[Id], P.[Name], P.[Adress], F.[Name], PF.[Amount]
FROM [Plantation] P, [Flower] F, [PlantationFlower] PF
WHERE P.[Id] = PF.[PlantationId] AND F.[Id]= PF.[FlowerId];

--3.Вывод данных по видам цветов: 
--для каждого вида количество плантаций, на которых есть цветы данного вида. 
--Столбцы в результате: Id вида цветов, имя, количество плантаций (должно выводиться имя столбца "Plantations number");
USE [Practice4db]

SELECT F.[Id], F.[Name],(SELECT COUNT(PF.[PlantationId]) 
	FROM [PlantationFlower] PF
	WHERE PF.[FlowerId] =F.[Id]) AS [Plantations number] 
FROM[Flower] F;


--4.Вывод данных по видам цветов: 
--для каждого вида количество плантаций, на которых есть цветы данного вида в количестве больше 1000.
--Столбцы, как и в предыдущем пункте;
USE [Practice4db]

SELECT F.[Id], F.[Name],(SELECT COUNT(PF.[PlantationId]) 
	FROM [PlantationFlower] PF
	WHERE PF.[FlowerId] =F.[Id] AND PF.[Amount]>1000) AS [Plantations number] 
FROM[Flower] F;

--5.Вывод данных по поставкам: 
--список цветов и их количество (общее по каждому виду), поставки которых назначены из определенной плантации.
--Столбцы в результате: Id вида цветов, имя, количество. Это будут данные по какой-то одной плантации;
USE [Practice4db]

SELECT F.[Id], F.[Name], SF.[Amount]
FROM [Supply] S 
INNER JOIN [SupplyFlower] SF ON SF.SupplyId = S.Id AND SF.SupplyId = 1 -- 1 Поставка == 1 Плантация
INNER JOIN [Flower] F ON SF.FlowerId = F.Id

--6.данные по поставкам: 
--успешно выполненные поставки за последний месяц. 
--Столбцы в результате: Id поставки, имя плантации, имя склада, дата выполнения 
USE [Practice4db]

SELECT S.[Id], P.[Name] AS [Name Plantation], W.[Name] AS [Name Warehouse], S.[ClosedDate]
FROM [Supply] S
INNER JOIN [Plantation] P ON S.PlantationId = P.Id
INNER JOIN [Warehouse] W ON S.WarehouseId = W.Id
WHERE DATEDIFF(day, S.[ClosedDate], GETDATE()) < 30