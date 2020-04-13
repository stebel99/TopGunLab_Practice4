--Supply
CREATE TABLE [dbo].Supply
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[PlantationId] INT NOT NULL,
	[WarehouseId] INT NOT NULL,
	[ScheduledDate] DATE NOT NULL,
	[ClosedDate] DATE NULL,
	[Status] NVARCHAR(50) NOT NULL,

	CONSTRAINT[FK_Supply_ToPlantation] FOREIGN KEY ([PlantationId]) REFERENCES [Plantation]([Id]),
	CONSTRAINT[FK_Supply_ToWarehouse] FOREIGN KEY ([WarehouseId]) REFERENCES [Warehouse]([Id])
);