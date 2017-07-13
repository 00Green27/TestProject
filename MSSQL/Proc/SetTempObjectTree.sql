CREATE or alter PROC SetTempObjectTree 
	@objects_id INT
AS
/*�������� ��������� �������� �� ��������� ������� �� ��������� �������*/
BEGIN
	DECLARE @parent_hid HIERARCHYID;
 
	--drop table ##TempTreeTable;
	/*�������� hid  �� id �������*/
	SELECT @parent_hid = Objects_hid 
	FROM "Objects"  
	WHERE Objects_id = @objects_id;
	/*�������� ��������� �������� �� ��������� �������*/ 
	SELECT Objects_id,
    Objects_hid,
    Objects_hid.ToString() AS Objects_hid_string,
    name,
	[level]
	into ##TempTreeTable
	FROM "Objects" 
	WHERE Objects_hid.IsDescendantOf(@parent_hid) = 1;	
END