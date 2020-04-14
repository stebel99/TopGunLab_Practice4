--1.Удалить данные о виде цветов на опредленной плантации; 
USE [Practice4db]

DELETE FROM [PlantationFlower] WHERE [PlantationId] = 1 AND [FlowerId] = 1

--2.Удалить данные о виде цветов из всей БД.
USE [Practice4db]
DECLARE @DeleteId int 
SET @DeleteId = 1
DELETE FROM [PlantationFlower] WHERE [FlowerId] = @DeleteId
DELETE FROM [SupplyFlower] WHERE [FlowerId] = @DeleteId
DELETE FROM [WarehouseFlower] WHERE [FlowerId] = @DeleteId
DELETE FROM [Flower] WHERE [Id] = @DeleteId




