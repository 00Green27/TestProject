/*Процедура получения атрибутов объекта со значениями*/
CREATE or Alter PROC GetObjectAttributes 
	@objects_id INT
AS
BEGIN		
	SELECT 
	Attributes.Name as AtribName
	,convert(varchar(10),DateTimeValue.Value,120) as Value
	,TableType.Type
	FROM "Objects"
	join DateTimeValue on DateTimeValue.ObjectOf = "Objects".Objects_Id
	join Attributes on Attributes.Attributes_Id = DateTimeValue.AttributeOf
	join TableType on TableType.TableType_Id = Attributes.TableTypeOf
	where "Objects".Objects_Id = @objects_id
	union all
	SELECT  
	Attributes.Name as AtribName
	,cast(FloatValue.Value as varchar)  as Value
	,TableType.Type  
	FROM "Objects"
	join FloatValue on FloatValue.ObjectOf = "Objects".Objects_Id
	join Attributes on Attributes.Attributes_Id = FloatValue.AttributeOf
	join TableType on TableType.TableType_Id = Attributes.TableTypeOf
	where "Objects".Objects_Id = @objects_id
	union all
	SELECT 
	Attributes.Name as AtribName
	,StringValue.Value as Value 
	,TableType.Type 
	FROM "Objects"
	join StringValue on StringValue.ObjectOf = "Objects".Objects_Id
	join Attributes on Attributes.Attributes_Id = StringValue.AttributeOf
	join TableType on TableType.TableType_Id = Attributes.TableTypeOf
	where "Objects".Objects_Id = @objects_id
END