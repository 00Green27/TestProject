/*Добавление типов*/
insert into TableType values ('float');
insert into TableType values ('datetime');
insert into TableType values ('varchar(255)');

/*Добавление классов*/
insert into Classes values ('Насос');
insert into Classes values ('Двигатель');
insert into Classes values ('Пылесос');

/*Добавление атрибутов*/
/*общие*/
insert into Attributes values ('Марка',(select TableType_id from TableType where "Type" = 'varchar(255)') );
insert into Attributes values ('Масса',(select TableType_id from TableType where "Type" = 'float') );
insert into Attributes values ('Цена',(select TableType_id from TableType where "Type" = 'float') );
/*Насос*/
insert into Attributes values ('Дата установки',(select TableType_id from TableType where "Type" = 'datetime') );
insert into Attributes values ('Мощность',(select TableType_id from TableType where "Type" = 'float') );
/*Пылесос*/
insert into Attributes values ('Дата поступления на склад',(select TableType_id from TableType where "Type" = 'datetime') );
/*Двигатель*/
insert into Attributes values ('Дата выпуска',(select TableType_id from TableType where "Type" = 'datetime') );

/*Добавление связей атрибута и класса*/
/*Класс насос*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Насос'),(select Attributes_id from Attributes where Name = 'Марка') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Насос'),(select Attributes_id from Attributes where Name = 'Масса') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Насос'),(select Attributes_id from Attributes where Name = 'Цена') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Насос'),(select Attributes_id from Attributes where Name = 'Дата установки') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Насос'),(select Attributes_id from Attributes where Name = 'Мощность') );
/*Класс Двигатель*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Двигатель'),(select Attributes_id from Attributes where Name = 'Марка') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Двигатель'),(select Attributes_id from Attributes where Name = 'Масса') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Двигатель'),(select Attributes_id from Attributes where Name = 'Цена') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Двигатель'),(select Attributes_id from Attributes where Name = 'Дата выпуска') );
/*Класс Пылесос*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Пылесос'),(select Attributes_id from Attributes where Name = 'Марка') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Пылесос'),(select Attributes_id from Attributes where Name = 'Масса') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Пылесос'),(select Attributes_id from Attributes where Name = 'Цена') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = 'Пылесос'),(select Attributes_id from Attributes where Name = 'Дата поступления на склад') );
/*Добавление корневого значения в Objects*/
INSERT INTO "Objects" 
VALUES (HIERARCHYID::GetRoot(),(select Classes_id from Classes where Name = 'Насос') , 'Глава всея объектов');





