--WarehouseFlower
CREATE TABLE [dbo].[WarehouseFlower]
(
	[WarehouseId] INT NOT NULL,
	[FlowerId] INT NOT NULL,
	[Amount] INT NOT NULL,

	CONSTRAINT[FK_WarehouseFlower_ToWarehouse] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouse]([Id]),
	CONSTRAINT[FK_WarehouseFlower_ToFlower] FOREIGN KEY ([FlowerId]) REFERENCES Flower([Id])
);