--1.Удалить данные о виде цветов на опредленной плантации; 
USE [Practice4db]

DELETE FROM [PlantationFlower] WHERE [PlantationId] = 1 AND [FlowerId] = 1

--2.Удалить данные о виде цветов из всей БД.
USE [Practice4db]

DELETE FROM [PlantationFlower] WHERE [FlowerId] = 1
DELETE FROM [SupplyFlower] WHERE [FlowerId] = 1
DELETE FROM [WarehouseFlower] WHERE [FlowerId] =1
DELETE FROM [Flower] WHERE [Id] = 1




