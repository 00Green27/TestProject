CREATE or alter PROC GetObjectTree 
	@objects_id INT
AS
/*��������� ��������� �������� �� ��������� �������*/
BEGIN
	 
	exec SetTempObjectTree @objects_id;

	select Objects_hid,
	Name
	from ##TempTreeTable	
    order by Objects_hid;
  
	drop table ##TempTreeTable;

END