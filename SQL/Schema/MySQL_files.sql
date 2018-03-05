/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen 
Date:			11/26/2017
Description:	Creates the files table and respective stored procedures

*/


USE tafers;



-- ------------------------------------------------------------
-- Drop existing objects
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `tafers`.`files`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_Load`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_LoadAll`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_Add`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_Update`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_Delete`;
DROP PROCEDURE IF EXISTS `tafers`.`usp_files_Search`;


-- ------------------------------------------------------------
-- Create table
-- ------------------------------------------------------------



CREATE TABLE `tafers`.`files` (
id INT AUTO_INCREMENT,
fileName VARCHAR(512),
uploadIP VARCHAR(64),
uploadDate DATETIME,
fileExtension VARCHAR(64),
fileSize INT,
fileType VARCHAR(255),
CONSTRAINT pk_files_id PRIMARY KEY (id)
);


-- ------------------------------------------------------------
-- Create default SCRUD sprocs for this table
-- ------------------------------------------------------------


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_Load`
(
	 IN paramid INT
)
BEGIN
	SELECT
		`files`.`id` AS `id`,
		`files`.`fileName` AS `fileName`,
		`files`.`uploadIP` AS `uploadIP`,
		`files`.`uploadDate` AS `uploadDate`,
		`files`.`fileExtension` AS `fileExtension`,
		`files`.`fileSize` AS `fileSize`,
		`files`.`fileType` AS `fileType`
	FROM `files`
	WHERE 		`files`.`id` = paramid;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_LoadAll`
()
BEGIN
	SELECT
		`files`.`id` AS `id`,
		`files`.`fileName` AS `fileName`,
		`files`.`uploadIP` AS `uploadIP`,
		`files`.`uploadDate` AS `uploadDate`,
		`files`.`fileExtension` AS `fileExtension`,
		`files`.`fileSize` AS `fileSize`,
		`files`.`fileType` AS `fileType`
	FROM `files`;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_Add`
(
	 IN paramfileName VARCHAR(512),
	 IN paramuploadIP VARCHAR(64),
	 IN paramuploadDate DATETIME,
	 IN paramfileExtension VARCHAR(64),
	 IN paramfileSize INT,
	 IN paramfileType VARCHAR(255)
)
BEGIN
	INSERT INTO `files` (fileName,uploadIP,uploadDate,fileExtension,fileSize,fileType)
	VALUES (paramfileName, paramuploadIP, paramuploadDate, paramfileExtension, paramfileSize, paramfileType);
	-- Return last inserted ID as result
	SELECT LAST_INSERT_ID() as id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_Update`
(
	IN paramid INT,
	IN paramfileName VARCHAR(512),
	IN paramuploadIP VARCHAR(64),
	IN paramuploadDate DATETIME,
	IN paramfileExtension VARCHAR(64),
	IN paramfileSize INT,
	IN paramfileType VARCHAR(255)
)
BEGIN
	UPDATE `files`
	SET fileName = paramfileName
		,uploadIP = paramuploadIP
		,uploadDate = paramuploadDate
		,fileExtension = paramfileExtension
		,fileSize = paramfileSize
		,fileType = paramfileType
	WHERE		`files`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_Delete`
(
	IN paramid INT
)
BEGIN
	DELETE FROM `files`
	WHERE		`files`.`id` = paramid;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `tafers`.`usp_files_Search`
(
	IN paramid INT,
	IN paramfileName VARCHAR(512),
	IN paramuploadIP VARCHAR(64),
	IN paramuploadDate DATETIME,
	IN paramfileExtension VARCHAR(64),
	IN paramfileSize INT,
	IN paramfileType VARCHAR(255)
)
BEGIN
	SELECT
		`files`.`id` AS `id`,
		`files`.`fileName` AS `fileName`,
		`files`.`uploadIP` AS `uploadIP`,
		`files`.`uploadDate` AS `uploadDate`,
		`files`.`fileExtension` AS `fileExtension`,
		`files`.`fileSize` AS `fileSize`,
		`files`.`fileType` AS `fileType`
	FROM `files`
	WHERE
		COALESCE(files.`id`,0) = COALESCE(paramid,files.`id`,0)
		AND COALESCE(files.`fileName`,'') = COALESCE(paramfileName,files.`fileName`,'')
		AND COALESCE(files.`uploadIP`,'') = COALESCE(paramuploadIP,files.`uploadIP`,'')
		AND COALESCE(CAST(files.`uploadDate` AS DATE), CAST(NOW() AS DATE)) = COALESCE(CAST(paramuploadDate AS DATE),CAST(files.`uploadDate` AS DATE), CAST(NOW() AS DATE))
		AND COALESCE(files.`fileExtension`,'') = COALESCE(paramfileExtension,files.`fileExtension`,'')
		AND COALESCE(files.`fileSize`,0) = COALESCE(paramfileSize,files.`fileSize`,0)
		AND COALESCE(files.`fileType`,'') = COALESCE(paramfileType,files.`fileType`,'');
END //
DELIMITER ;

