--Хранимую процедуру, которая закрывает поставку: 
--проставляет статус поставки, дату закрытия текущую.
--Снять нужное количество у плантации и добавить к запасам на складе.
USE [Practice4db]
GO
--CREATE PROCEDURE CloseSupply @SupplyId INT AS
ALTER PROCEDURE CloseSupply @SupplyId INT AS
BEGIN
--Обьявляем нужные нам переменные для дальнейшей работы
DECLARE @PlantationId INT, @WarehouseId INT
SET @PlantationId = (SELECT S.[PlantationId] 
					FROM Supply S 
					WHERE S.[Id] = @SupplyId)
SET @WarehouseId = (SELECT S.[WarehouseId] 
					FROM Supply S 
					WHERE S.[Id] = @SupplyId)

-- Создаем временную таблицу где будут все цветы с поставки
CREATE TABLE #FlowersInSupply
(Id INT PRIMARY KEY IDENTITY, FlowerId INT, Amount INT)
 
INSERT INTO #FlowersInSupply ([FlowerId], [Amount])
SELECT SF.[FlowerId] , SF.[Amount] FROM SupplyFlower SF WHERE SF.[SupplyId] = @SupplyId

--Реализуем цикл, где будем проходится по временной таблице 
DECLARE @Iterator INT = 0, @Max INT = (SELECT COUNT(*) FROM #FlowersInSupply)
WHILE @Iterator < @Max
	BEGIN
	SET @Iterator += 1
	--Получаем нужные значения и присваеваем их переменным
	DECLARE @FlowerId INT = (SELECT FlowerId FROM #FlowersInSupply WHERE [Id] = @Iterator)
	DECLARE @Amount INT = (SELECT Amount FROM #FlowersInSupply WHERE [Id] = @Iterator)
	--Допустим что перед вызовом процедуры люди убедились что на плантации есть нужные цветы в нужном кол-ве
	--Снимаем количество цветов с плантации
	UPDATE PlantationFlower SET [Amount] -= @Amount WHERE [FlowerId] = @FlowerId  AND [PlantationId] = @PlantationId
	--Проверяем есть ли уже на складе нужные нам цветы
	DECLARE @Consist INT = (SELECT COUNT(*) FROM WarehouseFlower WF WHERE WF.FlowerId = @FlowerId AND WF.WarehouseId = @WarehouseId)
	IF @Consist = 0  --Если нет,  пишем туда значения
		INSERT INTO WarehouseFlower([WarehouseId],[FlowerId],[Amount]) VALUES (@WarehouseId, @FlowerId, @Amount)
	ELSE --Если да, обновляем старые
		UPDATE WarehouseFlower SET WarehouseFlower.[Amount] += @Amount WHERE [FlowerId] = @FlowerId AND [WarehouseId] = @WarehouseId
	END
	--Пишем текущую дату в дату закрытия, Меняем статус на Closed
UPDATE Supply SET [ClosedDate] = GETDATE(), [Status] = 'Closed' WHERE [Id] = @SupplyId
END

--TEST
EXEC CloseSupply 1
