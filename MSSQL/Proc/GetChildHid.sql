/*Процедура получения дочерних узлов*/
CREATE OR ALTER PROC GetChildHid 
	@parent_id INT,
	@child_hid HIERARCHYID OUT
AS
/*Процедура получения дочерних узлов для правильного построения иерархии*/
BEGIN
	DECLARE @parentHid HIERARCHYID, @maxChildHid HIERARCHYID;
    /*Получение hid родителя*/
	SELECT @parentHid = objects_hid FROM "Objects" WHERE objects_id = @parent_id;
    /*Получение максимального hid потомков*/
	SELECT @maxChildHid = MAX(objects_hid)
	FROM "Objects"
	WHERE objects_hid.GetAncestor(1) = @parentHid;
    /*Вычисление следующего hid*/
	SET @child_hid = @parentHid.GetDescendant(@maxChildHid, null);
END