/*Генерация тестовых данных*/
declare @newhid hierarchyid;
declare @TObjId Table (Obj Integer);
declare @ObjId Int;
exec getchildhid 1, @newhid out;
insert into "objects"
output
INSERTED.Objects_id into @TObjId
values(@newhid,1,'Насос 1');
set @ObjId = (select Obj from @TObjId);
insert into FloatValue
values (@ObjId,2,11);
insert into FloatValue
values (@ObjId,3,9990);
insert into StringValue
values (@ObjId,1,'Bosh');			
insert into FloatValue
values (@ObjId,5,6);
insert into DateTimeValue
values (@ObjId,4,'07.07.2017');
set @ObjId = 0;
delete from @TObjId;
go
/*-----------------------------------------------*/
declare @newhid hierarchyid;
declare @TObjId Table (Obj Integer);
declare @ObjId Int;
exec getchildhid 1, @newhid out;
insert into "objects"
output
INSERTED.Objects_id into @TObjId
values(@newhid,1,'Насос 2');
set @ObjId = (select Obj from @TObjId);
insert into FloatValue
values (@ObjId,2,124);
insert into FloatValue
values (@ObjId,3,119990);
insert into StringValue
values (@ObjId,1,'Cat');			
insert into FloatValue
values (@ObjId,5,54);
insert into DateTimeValue
values (@ObjId,4,'07.06.2017');
set @ObjId = 0;
delete from @TObjId;
go
/*-----------------------------------------------*/
declare @newhid hierarchyid;
declare @TObjId Table (Obj Integer);
declare @ObjId Int;
exec getchildhid 1, @newhid out;
insert into "objects"
output
INSERTED.Objects_id into @TObjId
values(@newhid,2,'Двигатель 1');
set @ObjId = (select Obj from @TObjId);
insert into FloatValue
values (@ObjId,2,325);
insert into FloatValue
values (@ObjId,3,99990);
insert into StringValue
values (@ObjId,1,'Kamaz');			
insert into DateTimeValue
values (@ObjId,7,'13.02.2017' );
set @ObjId = 0;
delete from @TObjId
go
/*-----------------------------------------------*/
declare @newhid hierarchyid;
declare @TObjId Table (Obj Integer);
declare @ObjId Int;
exec getchildhid 1, @newhid out;
insert into "objects"
output
INSERTED.Objects_id into @TObjId
values(@newhid,3,'Пылесос 1');
set @ObjId = (select Obj from @TObjId);
insert into FloatValue
values (@ObjId,2,1.6);
insert into FloatValue
values (@ObjId,3,15000);
insert into StringValue
values (@ObjId,1,'Siemens');			
insert into DateTimeValue
values (@ObjId,6,'30.06.2017' );
set @ObjId = 0;
delete from @TObjId
go
/*-----------------------------------------------------*/
exec DataGenerator 1,1,2
go
exec DataGenerator 1,2,2 
go
exec DataGenerator 1,3,2
go 
/*-----------------------------------------------------*/
exec DataGenerator 2,1,2
go
exec DataGenerator 2,2,2 
go
exec DataGenerator 2,3,2 
go
/*-----------------------------------------------------*/
exec DataGenerator 3,1,2
go
exec DataGenerator 3,2,2 
go
exec DataGenerator 3,3,2 
go
/*-----------------------------------------------------*/
exec DataGenerator 4,1,2
go
exec DataGenerator 4,2,2 
go
exec DataGenerator 4,3,2 
go
/*-----------------------------------------------------*/
exec DataGenerator 5,1,2
go
exec DataGenerator 5,2,2 
go
exec DataGenerator 5,3,2 
go


/*-----------------------------------------------------*/
exec DataGenerator 6,1,1
go
exec DataGenerator 6,2,1 
go
exec DataGenerator 6,3,1 
go
/*-----------------------------------------------------*/
exec DataGenerator 7,1,1
go
exec DataGenerator 8,1,1 
go
exec DataGenerator 9,1,1 
go
exec DataGenerator 10,1,1 




