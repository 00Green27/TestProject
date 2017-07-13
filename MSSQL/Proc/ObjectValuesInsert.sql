create or alter proc ObjectValuesInsert
	@ObjectId int,
	@AttributId int,
	@AttributValue varchar(255) 
as
begin
	declare @TableType varchar(255);

	select @TableType = TableType.Type
	from TableType 
	join Attributes on Attributes.TableTypeOf = TableType.TableType_Id
	where Attributes.Attributes_Id = @AttributId;

	if @TableType ='float'
	insert into FloatValue
	values (@ObjectId,@AttributId,replace(@AttributValue,',','.'));
	if @TableType ='datetime'
	insert into DateTimeValue
	values (@ObjectId,@AttributId,@AttributValue);	
	if @TableType ='varchar(255)'
	insert into StringValue
	values (@ObjectId,@AttributId,@AttributValue);
end