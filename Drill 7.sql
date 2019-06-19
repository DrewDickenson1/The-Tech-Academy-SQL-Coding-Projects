CREATE DATABASE drill_7
USE drill_7
CREATE TABLE tbl_nameInfo (
		fName VARCHAR(50) NOT NULL,
		LName VARCHAR(50) NOT NULL,
		contactInfo VARCHAR(50) PRIMARY KEY NOT NULL,
	);

	Select * From tbl_nameInfo

	INSERT INTO tbl_nameInfo
		(fName, LName, contactInfo)
		VALUES
		('Steve', 'Smith' , '242-343-5758'),
		('Matt', 'Lowder' , '245-343-5758'),
		('Shannon', 'Kennedy' , '243-343-5758'),
		('Jimmy', 'John' , '241-343-5758'),
		('Apple', 'Pie' , '240-343-5758')
	;

CREATE TABLE tbl_personData (
		person_income MONEY PRIMARY KEY NOT NULL,
		person_sex VARCHAR(50) NOT NULL,
		person_phoneNumber VARCHAR(50) FOREIGN KEY NOT NULL, 
	);

	Select * From tbl_personData

	INSERT INTO tbl_personData
		(person_income, person_sex, person_phoneNumber)
		VALUES
		(80000, 'Male' , '242-343-5758'),
		(100000, 'Male' , '245-343-5758'),
		(95000, 'Female' , '243-343-5758'),
		(1000000, 'Male' , '241-343-5758'),
		(50, 'Female' , '240-343-5758')
	;

	SELECT
			a1.fName , a1.LName , a2.person_income ,  a2.person_sex 
			FROM tbl_nameInfo a1
			INNER JOIN tbl_personData a2 ON a2.person_phoneNumber =  a1.contactInfo

	;

drop table tbl_nameInfo;
drop table tbl_personData;