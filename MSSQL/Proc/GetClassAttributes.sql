CREATE or Alter PROC GetClassAttributes 
	@Classes_id INT
AS
/*выбор атрибутов по классу*/
BEGIN
	
	SELECT Attributes.Attributes_id,
	Attributes.Name,
	TableType."Type"
	FROM Attributes 
	join ClassAttributes on ClassAttributes.AttributeOf = Attributes.Attributes_id
	join Classes on Classes.Classes_id = ClassAttributes.ClassOf
	join TableType on TableType.TableType_Id = Attributes.TableTypeOf 
	WHERE Classes.Classes_id = @Classes_id;
END

