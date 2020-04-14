--Функция, которая проверяет, можно ли создать поставку с определенным количеством цветов определенного типа из определённой плантации.
--Т.е. хватает ли на плантации количества цветов с учетом того, что до того, как поставка закрыта, количество цветов на плантации остается неизменным.
--После закрытия поставки количество цветов на плантации уменьшается. 
--Входящие параметры: Id вида цветов, Id плантации, количество. 
--Возвращаемое значение в формате true/false.
USE [Practice4db]

GO
CREATE FUNCTION CanCreateSupply (@FlowerId INT, @PlantationId INT, @Amount INT)
	RETURNS  BIT
BEGIN
	DECLARE @PlantationAmount INT, @Result INT
	SET @PlantationAmount = (SELECT PF.[Amount] FROM [PlantationFlower] PF WHERE PF.FlowerId = @FlowerId AND PF.PlantationId = @PlantationId)
	SET @Result = @PlantationAmount - @Amount
	IF @Result >= 0
		RETURN 1;
	RETURN 0;
END;

----TEST
--GO
--SELECT P.[Name], PF.[Amount], [dbo].CanCreateSupply(3,2,301) FROM [Plantation] P
--INNER JOIN [PlantationFlower] PF ON P.[Id] = PF.[PlantationId]