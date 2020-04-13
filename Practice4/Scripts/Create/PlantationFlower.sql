--PlantationFlower
CREATE TABLE [dbo].[PlantationFlower]
(
	[PlantationId] INT NOT NULL,
	[FlowerId] INT NOT NULL,
	[Amount] INT NOT NULL,

	CONSTRAINT[FK_PlantationFlower_ToPlantation] FOREIGN KEY ([PlantationId]) REFERENCES [Plantation]([Id]),
	CONSTRAINT[FK_PlantationFlower_ToFlower] FOREIGN KEY ([FlowerId]) REFERENCES Flower([Id])
);