/*
Author:			This code was generated by DALGen Web available at https://dalgen.opendevtools.org
Date:			10/31/2019
Description:		Creates the Band table and respective stored procedures

*/

USE tafers;

-- Overwrite existing objects that conflict. 
-- WARNING: To avoid loss of data please prepare a backup if necessary

DROP TABLE IF EXISTS `tafers`.`Band`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_LoadAll`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_Search`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_Add`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_Load`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_Delete`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_Band_Update`;


-- Create Table 

CREATE TABLE `tafers`.`Band` (
id INT AUTO_INCREMENT,
name VARCHAR(255),
createDate DATE,
genre VARCHAR(255),
description VARCHAR(1024),
CONSTRAINT pk_Band_id PRIMARY KEY (id)
);


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_Load`
(
	IN paramid INT
)
BEGIN
	SELECT
		`Band`.`id` AS `id`,
		`Band`.`name` AS `name`,
		`Band`.`createDate` AS `createDate`,
		`Band`.`genre` AS `genre`,
		`Band`.`description` AS `description`
	FROM `Band`
	WHERE `Band`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_LoadAll`
(
)
BEGIN
	SELECT
		`Band`.`id` AS `id`,
		`Band`.`name` AS `name`,
		`Band`.`createDate` AS `createDate`,
		`Band`.`genre` AS `genre`,
		`Band`.`description` AS `description`
	FROM `Band`;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_Add`
(
	IN paramname VARCHAR(255),
	IN paramcreateDate DATE,
	IN paramgenre VARCHAR(255),
	IN paramdescription VARCHAR(1024)
)
BEGIN
	INSERT INTO `Band` (name,createDate,genre,description)
	VALUES (paramname,paramcreateDate,paramgenre,paramdescription);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_Update`
(
	IN paramid INT,
	IN paramname VARCHAR(255),
	IN paramcreateDate DATE,
	IN paramgenre VARCHAR(255),
	IN paramdescription VARCHAR(1024)
)
BEGIN
	UPDATE `Band`
	SET
		name = paramname,
		createDate = paramcreateDate,
		genre = paramgenre,
		description = paramdescription
	WHERE 
		id = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_Delete`
(
	IN paramid INT
)
BEGIN
	DELETE FROM `Band`
	WHERE `Band`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_Band_Search`
(
	IN paramid INT,
	IN paramname VARCHAR(255),
	IN paramcreateDate DATE,
	IN paramgenre VARCHAR(255),
	IN paramdescription VARCHAR(1024)
)
BEGIN
	SELECT
		`Band`.`id` AS `id`,
		`Band`.`name` AS `name`,
		`Band`.`createDate` AS `createDate`,
		`Band`.`genre` AS `genre`,
		`Band`.`description` AS `description`
	FROM Band
	WHERE 
		COALESCE(`Band`.`id`,0) = COALESCE(paramid,`Band`.`id`,0)
		 AND COALESCE(`Band`.`name`,'') LIKE COALESCE(CONCAT('%', paramname, '%'),`Band`.`name`,'')
		 AND COALESCE(`Band`.`genre`,'') LIKE COALESCE(CONCAT('%', paramgenre, '%'),`Band`.`genre`,'')
		 AND COALESCE(`Band`.`description`,'') LIKE COALESCE(CONCAT('%', paramdescription, '%'),`Band`.`description`,'');
END //
DELIMITER ;



