/*Процедура добавления тестовых данных для каждого уровня иерархии*/
create or alter proc DataGenerator
	@Level Int,--уровень иерархии для которого нужно добавить потомков
	@ClassId int,--класс добавляемых потомков
	@MaxChild int--количество потомков созданных каждому родителю
as
begin
	declare @i int;
	declare @j int;
	declare @Minj int;
	declare @Maxj int;
	declare @newhid hierarchyid;
	declare @TObjId Table (Obj Integer);
	declare @ObjId Int;
	declare @ClassName varchar(255);
	
	select @Minj = min(Objects_id) from "Objects" where [level] = @Level;--получаем минимальное id объекта на заданном уровне
	select @Maxj = max(Objects_id) from "Objects" where [level] = @Level;--получаем максимальное id объекта на заданном уровне
	select @ClassName = Name from Classes where Classes_Id = @ClassId;
	
	set @j = @Minj;
	
	while @j <= @Maxj
	/*запускаем выполнение цикла по всем родительским объектам*/
	begin
		set @i = 1;
		while @i <= @MaxChild
		begin
			/*Получаем свободный hid потомка для заданного родителя и добавляем новую запись в таблицу объектов*/
			exec getchildhid @j, @newhid out;
			insert into "objects"
			output
			INSERTED.Objects_id into @TObjId
			values(@newhid,@ClassId,@ClassName+cast(@j as varchar)+'/'+cast(@i as varchar));
			
			set @ObjId = (select Obj from @TObjId);
			/*Наполнение тестовыми данными в зависимости от класса*/
			insert into FloatValue
			values (@ObjId,2,(select round((rand()* 1000),0)));
			insert into FloatValue
			values (@ObjId,3,(select round((rand()* 1000),0)));
			insert into StringValue
			values (@ObjId,1,'новый  '+@ClassName+ cast((select round((rand()* 100000000),0)) as varchar));			
			
			if @ClassId = 1
			begin 
				insert into FloatValue
				values (@ObjId,5,(select round((rand()* 1000),0)));
		    
				insert into DateTimeValue
				values (@ObjId,4,(select rand() * (42923 - 42736) + 42736) );
			end
			if @ClassId = 2
			insert into DateTimeValue
			values (@ObjId,7,(select rand() * (42923 - 42736) + 42736) );
			if @ClassId = 3
			insert into DateTimeValue
			values (@ObjId,6,(select rand() * (42923 - 42736) + 42736) );

			
			set @ObjId = 0;
			delete from @TObjId;
			set @i=@i+1; 
		end
		set @j=@j+1;
	end
end