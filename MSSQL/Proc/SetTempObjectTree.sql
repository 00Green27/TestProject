CREATE or alter PROC SetTempObjectTree 
	@objects_id INT
AS
/*Создание поддерева объектов по заданному объекту во временной таблице*/
BEGIN
	DECLARE @parent_hid HIERARCHYID;
 
	--drop table ##TempTreeTable;
	/*Получаем hid  по id объекта*/
	SELECT @parent_hid = Objects_hid 
	FROM "Objects"  
	WHERE Objects_id = @objects_id;
	/*Помещаем поддерево объектов во временную таблицу*/ 
	SELECT Objects_id,
    Objects_hid,
    Objects_hid.ToString() AS Objects_hid_string,
    name,
	[level]
	into ##TempTreeTable
	FROM "Objects" 
	WHERE Objects_hid.IsDescendantOf(@parent_hid) = 1;	
END