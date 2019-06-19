
CREATE PROCEDURE getTable_INFO

@tableName varchar(50)
AS
BEGIN
	SELECT * FROM tbl_habita
	@tableName;
END