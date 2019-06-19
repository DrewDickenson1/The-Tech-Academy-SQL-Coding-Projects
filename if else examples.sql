
PRINT 'hello world';


DECLARE @myVariable INT 
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT 'I have ' + CONVERT(varchar(50),@var1) + ' dollars...'

PRINT 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) +' dollars...'

PRINT CHAR(9) + 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) +' dollars...'

DECLARE @var1 INT, @var2 INT
SET @var1 = 7
SET @var2 = 5

PRINT 'Variable 1 = ' + CONVERT(varchar(5),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(varchar(5),@var2)

PRINT 'Variable 1 = ' + CONVERT(varchar(5),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(varchar(5),@var2) + CHAR(13) + 'Total: '
PRINT @var1 + @var2

IF @var1 <=3
	BEGIN
	PRINT 'Variable 1 <= ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END

ELSE
	BEGIN
	PRINT 'Variable 1 is not < ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END

IF @var1 != 3
	BEGIN
	PRINT 'Variable 1 is ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END

ELSE
	BEGIN
	PRINT 'Variable 1 is NOT ' + CONVERT(varchar(5),@var1) + CHAR(13)
	END

	/* This is how you make a comment */