/*��������� ��������� ������ �������� � ��������� ����������� ������� � ����������� ���������� � �4 ��������� �������*/
CREATE or Alter PROC GetObjectsWithParam 
	@ParentId INT
AS
BEGIN
	exec SetTempObjectTree @ParentId;	
		
	select distinct T.Objects_Id 
	from ##TempTreeTable T 
	inner join [Objects] O 	on O.Objects_id = T.Objects_id 
	inner join FloatValue FV on FV.ObjectOf = O.Objects_id 
	inner join Attributes FA on FA.Attributes_Id = FV.AttributeOf 
	inner join DateTimeValue DTV on DTV.ObjectOf = O.Objects_id 
	inner join Attributes DTA on DTA.Attributes_Id = DTV.AttributeOf 
	where O.Name like'%�����%'
	and FA.Name = '�����' 
	and FV.Value > 10 
	and DTA.Name = '���� ���������' 
	and DTV.Value <= CURRENT_TIMESTAMP

	drop table ##TempTreeTable;
END