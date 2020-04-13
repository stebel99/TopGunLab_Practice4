--SupplyFlower
CREATE TABLE [dbo].[SupplyFlower]
(
	[SupplyId] INT NOT NULL,
	[FlowerId] INT NOT NULL,
	[Amount] INT NOT NULL,

	CONSTRAINT[FK_SupplyFlower_ToSupply] FOREIGN KEY ([SupplyId]) REFERENCES [Supply]([Id]),
	CONSTRAINT[FK_SupplyFlower_ToFlower] FOREIGN KEY ([FlowerId]) REFERENCES Flower([Id])
);