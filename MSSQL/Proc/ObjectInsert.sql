create or alter proc ObjectInsert
	@ParentID int,
	@ClassID int,
	@ObjectName varchar(255),
	@ObjectId int output
as
begin
	declare @TObjId Table (Obj Integer);
	declare @newhid hierarchyid;
	
	exec getchildhid @ParentID, @newhid out;
	
	insert into "Objects"
	output
	INSERTED.Objects_id into @TObjId
	values(@newhid,@ClassID,@ObjectName);
	
	set @ObjectId = (select Obj from @TObjId);
end