--Добавим один вид цветов
INSERT INTO [Practice4db].[dbo].[Flower]([Name]) VALUES ('Ромашка');

--Добавим несколько плантаций
INSERT INTO [Practice4db].[dbo].[Plantation]  ([Name],[Adress]) 
    VALUES 
    ('Квітковий рай','Ось там'),
    ('Квіткове пекло', 'Ось тут');