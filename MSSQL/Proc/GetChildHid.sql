/*��������� ��������� �������� �����*/
CREATE OR ALTER PROC GetChildHid 
	@parent_id INT,
	@child_hid HIERARCHYID OUT
AS
/*��������� ��������� �������� ����� ��� ����������� ���������� ��������*/
BEGIN
	DECLARE @parentHid HIERARCHYID, @maxChildHid HIERARCHYID;
    /*��������� hid ��������*/
	SELECT @parentHid = objects_hid FROM "Objects" WHERE objects_id = @parent_id;
    /*��������� ������������� hid ��������*/
	SELECT @maxChildHid = MAX(objects_hid)
	FROM "Objects"
	WHERE objects_hid.GetAncestor(1) = @parentHid;
    /*���������� ���������� hid*/
	SET @child_hid = @parentHid.GetDescendant(@maxChildHid, null);
END