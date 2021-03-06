<?php
/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen
Date:			4/27/2018
Description:	Creates the DAL class for  File table and respective stored procedures

*/



class File {

	// This is for local purposes only! In hosted environments the db_settings.php file should be outside of the webroot, such as: include("/outside-webroot/db_settings.php");
	protected static function getDbSettings() { return "DAL/db_localsettings.php"; }

	/******************************************************************/
	// Properties
	/******************************************************************/

	protected $id;
	protected $userId;
	protected $fileName;
	protected $uploadIP;
	protected $uploadDate;
	protected $fileSize;
	protected $fileExtension;
	protected $fileType;
	protected $isPublic;
	protected $categoryTypeId;


	/******************************************************************/
	// Constructors
	/******************************************************************/
	public function __construct() {
		$argv = func_get_args();
		switch( func_num_args() ) {
			case 0:
				self::__constructBase();
				break;
			case 1:
				self::__constructPK( $argv[0] );
				break;
			case 10:
				self::__constructFull( $argv[0], $argv[1], $argv[2], $argv[3], $argv[4], $argv[5], $argv[6], $argv[7], $argv[8], $argv[9] );
		}
	}


	public function __constructBase() {
		$this->id = 0;
		$this->userId = 0;
		$this->fileName = "";
		$this->uploadIP = "";
		$this->uploadDate = "";
		$this->fileSize = 0;
		$this->fileExtension = "";
		$this->fileType = "";
		$this->isPublic = 0;
		$this->categoryTypeId = 0;
	}


	public function __constructPK($paramId) {
		$this->load($paramId);
	}


	public function __constructFull($paramId,$paramUserId,$paramFileName,$paramUploadIP,$paramUploadDate,$paramFileSize,$paramFileExtension,$paramFileType,$paramIsPublic,$paramCategoryTypeId) {
		$this->id = $paramId;
		$this->userId = $paramUserId;
		$this->fileName = $paramFileName;
		$this->uploadIP = $paramUploadIP;
		$this->uploadDate = $paramUploadDate;
		$this->fileSize = $paramFileSize;
		$this->fileExtension = $paramFileExtension;
		$this->fileType = $paramFileType;
		$this->isPublic = $paramIsPublic;
		$this->categoryTypeId = $paramCategoryTypeId;
	}


	/******************************************************************/
	// Accessors / Mutators
	/******************************************************************/

	public function getId(){
		return $this->id;
	}
	public function setId($value){
		$this->id = $value;
	}
	public function getUserId(){
		return $this->userId;
	}
	public function setUserId($value){
		$this->userId = $value;
	}
	public function getFileName(){
		return $this->fileName;
	}
	public function setFileName($value){
		$this->fileName = $value;
	}
	public function getUploadIP(){
		return $this->uploadIP;
	}
	public function setUploadIP($value){
		$this->uploadIP = $value;
	}
	public function getUploadDate(){
		return $this->uploadDate;
	}
	public function setUploadDate($value){
		$this->uploadDate = $value;
	}
	public function getFileSize(){
		return $this->fileSize;
	}
	public function setFileSize($value){
		$this->fileSize = $value;
	}
	public function getFileExtension(){
		return $this->fileExtension;
	}
	public function setFileExtension($value){
		$this->fileExtension = $value;
	}
	public function getFileType(){
		return $this->fileType;
	}
	public function setFileType($value){
		$this->fileType = $value;
	}
	public function getIsPublic(){
		return $this->isPublic;
	}
	public function setIsPublic($value){
		$this->isPublic = $value;
	}
	public function getCategoryTypeId(){
		return $this->categoryTypeId;
	}
	public function setCategoryTypeId($value){
		$this->categoryTypeId = $value;
	}


	/******************************************************************/
	// Public Methods
	/******************************************************************/


	public function load($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_Load(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);

		while ($row = $result->fetch_assoc()) {
		 $this->setId($row['id']);
		 $this->setUserId($row['userId']);
		 $this->setFileName($row['fileName']);
		 $this->setUploadIP($row['uploadIP']);
		 $this->setUploadDate($row['uploadDate']);
		 $this->setFileSize($row['fileSize']);
		 $this->setFileExtension($row['fileExtension']);
		 $this->setFileType($row['fileType']);
		 $this->setIsPublic($row['isPublic']);
		 $this->setCategoryTypeId($row['categoryTypeId']);
		}
	}


	public function save() {
		if ($this->getId() == 0)
			$this->insert();
		else
			$this->update();
	}

	/******************************************************************/
	// Private Methods
	/******************************************************************/



	private function insert() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_Add(?,?,?,?,?,?,?,?,?)');
		$arg1 = $this->getUserId();
		$arg2 = $this->getFileName();
		$arg3 = $this->getUploadIP();
		$arg4 = $this->getUploadDate();
		$arg5 = $this->getFileSize();
		$arg6 = $this->getFileExtension();
		$arg7 = $this->getFileType();
		$arg8 = $this->getIsPublic();
		$arg9 = $this->getCategoryTypeId();
		$stmt->bind_param('isssissii',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7,$arg8,$arg9);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		while ($row = $result->fetch_assoc()) {
			// By default, the DALGen generated INSERT procedure returns the scope identity as id
			$this->load($row['id']);
		}
	}


	private function update() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_Update(?,?,?,?,?,?,?,?,?,?)');
		$arg1 = $this->getId();
		$arg2 = $this->getUserId();
		$arg3 = $this->getFileName();
		$arg4 = $this->getUploadIP();
		$arg5 = $this->getUploadDate();
		$arg6 = $this->getFileSize();
		$arg7 = $this->getFileExtension();
		$arg8 = $this->getFileType();
		$arg9 = $this->getIsPublic();
		$arg10 = $this->getCategoryTypeId();
		$stmt->bind_param('iisssissii',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7,$arg8,$arg9,$arg10);
		$stmt->execute();
	}

	private static function setNullValue($value){
		if ($value == "")
			return null;
		else
			return $value;
	}

	/******************************************************************/
	// Static Methods
	/******************************************************************/



	public static function loadall() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_LoadAll()');
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$file = new File($row['id'],$row['userId'],$row['fileName'],$row['uploadIP'],$row['uploadDate'],$row['fileSize'],$row['fileExtension'],$row['fileType'],$row['isPublic'],$row['categoryTypeId']);
				$arr[] = $file;
			}
			return $arr;
		}
		else {
			die("The query yielded zero results.No rows found.");
		}
	}


	public static function remove($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_Delete(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();
	}


	public static function search($paramId,$paramUserId,$paramFileName,$paramUploadIP,$paramUploadDate,$paramFileSize,$paramFileExtension,$paramFileType,$paramIsPublic,$paramCategoryTypeId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_File_Search(?,?,?,?,?,?,?,?,?,?)');
		$arg1 = File::setNullValue($paramId);
		$arg2 = File::setNullValue($paramUserId);
		$arg3 = File::setNullValue($paramFileName);
		$arg4 = File::setNullValue($paramUploadIP);
		$arg5 = File::setNullValue($paramUploadDate);
		$arg6 = File::setNullValue($paramFileSize);
		$arg7 = File::setNullValue($paramFileExtension);
		$arg8 = File::setNullValue($paramFileType);
		$arg9 = File::setNullValue($paramIsPublic);
		$arg10 = File::setNullValue($paramCategoryTypeId);
		$stmt->bind_param('iisssissii',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7,$arg8,$arg9,$arg10);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$file = new File($row['id'],$row['userId'],$row['fileName'],$row['uploadIP'],$row['uploadDate'],$row['fileSize'],$row['fileExtension'],$row['fileType'],$row['isPublic'],$row['categoryTypeId']);
				$arr[] = $file;
			}
			return $arr;
		}
		else {
			die("The query yielded zero results.No rows found.");
		}
	}
}
