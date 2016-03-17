-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: infoglue
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OS_CURRENTSTEP`
--

DROP TABLE IF EXISTS `OS_CURRENTSTEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_CURRENTSTEP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENTRY_ID` bigint(20) DEFAULT NULL,
  `STEP_ID` int(11) DEFAULT NULL,
  `ACTION_ID` int(11) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `CALLER` varchar(255) DEFAULT NULL,
  `stepIndex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ENTRY_ID` (`ENTRY_ID`),
  KEY `OWNER` (`OWNER`),
  KEY `CALLER` (`CALLER`),
  KEY `CS_OWNER` (`OWNER`),
  KEY `CS_CALLER` (`CALLER`),
  CONSTRAINT `OS_CURRENTSTEP_ibfk_1` FOREIGN KEY (`ENTRY_ID`) REFERENCES `OS_WFENTRY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_CURRENTSTEP`
--

LOCK TABLES `OS_CURRENTSTEP` WRITE;
/*!40000 ALTER TABLE `OS_CURRENTSTEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_CURRENTSTEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_CURRENTSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_CURRENTSTEP_PREV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_CURRENTSTEP_PREV` (
  `ID` bigint(20) NOT NULL,
  `PREVIOUS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`,`PREVIOUS_ID`),
  KEY `ID` (`ID`),
  KEY `PREVIOUS_ID` (`PREVIOUS_ID`),
  CONSTRAINT `OS_CURRENTSTEP_PREV_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `OS_CURRENTSTEP` (`ID`),
  CONSTRAINT `OS_CURRENTSTEP_PREV_ibfk_2` FOREIGN KEY (`PREVIOUS_ID`) REFERENCES `OS_HISTORYSTEP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_CURRENTSTEP_PREV`
--

LOCK TABLES `OS_CURRENTSTEP_PREV` WRITE;
/*!40000 ALTER TABLE `OS_CURRENTSTEP_PREV` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_CURRENTSTEP_PREV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_HISTORYSTEP`
--

DROP TABLE IF EXISTS `OS_HISTORYSTEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_HISTORYSTEP` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENTRY_ID` bigint(20) DEFAULT NULL,
  `STEP_ID` int(11) DEFAULT NULL,
  `ACTION_ID` int(11) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `FINISH_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `CALLER` varchar(255) DEFAULT NULL,
  `stepIndex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ENTRY_ID` (`ENTRY_ID`),
  KEY `OWNER` (`OWNER`),
  KEY `CALLER` (`CALLER`),
  KEY `HS_OWNER` (`OWNER`),
  KEY `HS_CALLER` (`CALLER`),
  CONSTRAINT `OS_HISTORYSTEP_ibfk_1` FOREIGN KEY (`ENTRY_ID`) REFERENCES `OS_WFENTRY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_HISTORYSTEP`
--

LOCK TABLES `OS_HISTORYSTEP` WRITE;
/*!40000 ALTER TABLE `OS_HISTORYSTEP` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_HISTORYSTEP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_HISTORYSTEP_PREV`
--

DROP TABLE IF EXISTS `OS_HISTORYSTEP_PREV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_HISTORYSTEP_PREV` (
  `ID` bigint(20) NOT NULL,
  `PREVIOUS_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`,`PREVIOUS_ID`),
  KEY `ID` (`ID`),
  KEY `PREVIOUS_ID` (`PREVIOUS_ID`),
  CONSTRAINT `OS_HISTORYSTEP_PREV_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `OS_HISTORYSTEP` (`ID`),
  CONSTRAINT `OS_HISTORYSTEP_PREV_ibfk_2` FOREIGN KEY (`PREVIOUS_ID`) REFERENCES `OS_HISTORYSTEP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_HISTORYSTEP_PREV`
--

LOCK TABLES `OS_HISTORYSTEP_PREV` WRITE;
/*!40000 ALTER TABLE `OS_HISTORYSTEP_PREV` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_HISTORYSTEP_PREV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_PROPERTYENTRY`
--

DROP TABLE IF EXISTS `OS_PROPERTYENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_PROPERTYENTRY` (
  `entity_name` varchar(125) NOT NULL,
  `entity_id` bigint(20) NOT NULL DEFAULT '0',
  `entity_key` varchar(150) NOT NULL,
  `key_type` int(11) DEFAULT NULL,
  `boolean_val` tinyint(4) DEFAULT NULL,
  `string_val` varchar(200) DEFAULT NULL,
  `long_val` bigint(20) DEFAULT NULL,
  `date_val` datetime DEFAULT NULL,
  `data_val` blob,
  `double_val` double DEFAULT NULL,
  `int_val` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_name`,`entity_id`,`entity_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_PROPERTYENTRY`
--

LOCK TABLES `OS_PROPERTYENTRY` WRITE;
/*!40000 ALTER TABLE `OS_PROPERTYENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_PROPERTYENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_STEPIDS`
--

DROP TABLE IF EXISTS `OS_STEPIDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_STEPIDS` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_STEPIDS`
--

LOCK TABLES `OS_STEPIDS` WRITE;
/*!40000 ALTER TABLE `OS_STEPIDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_STEPIDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OS_WFENTRY`
--

DROP TABLE IF EXISTS `OS_WFENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OS_WFENTRY` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(60) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OS_WFENTRY`
--

LOCK TABLES `OS_WFENTRY` WRITE;
/*!40000 ALTER TABLE `OS_WFENTRY` DISABLE KEYS */;
/*!40000 ALTER TABLE `OS_WFENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAccessRight`
--

DROP TABLE IF EXISTS `cmAccessRight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAccessRight` (
  `accessRightId` int(11) NOT NULL AUTO_INCREMENT,
  `parameters` text,
  `interceptionPointId` int(11) NOT NULL,
  PRIMARY KEY (`accessRightId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAccessRight`
--

LOCK TABLES `cmAccessRight` WRITE;
/*!40000 ALTER TABLE `cmAccessRight` DISABLE KEYS */;
INSERT INTO `cmAccessRight` VALUES (1,'1',1),(2,'2',1),(3,'3',1),(4,'4',1),(5,NULL,3),(6,NULL,2),(7,NULL,4),(8,NULL,5),(9,NULL,26),(10,NULL,32);
/*!40000 ALTER TABLE `cmAccessRight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAccessRightGroup`
--

DROP TABLE IF EXISTS `cmAccessRightGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAccessRightGroup` (
  `accessRightGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `accessRightId` int(11) NOT NULL DEFAULT '0',
  `groupName` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`accessRightGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAccessRightGroup`
--

LOCK TABLES `cmAccessRightGroup` WRITE;
/*!40000 ALTER TABLE `cmAccessRightGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmAccessRightGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAccessRightRole`
--

DROP TABLE IF EXISTS `cmAccessRightRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAccessRightRole` (
  `accessRightRoleId` int(11) NOT NULL AUTO_INCREMENT,
  `accessRightId` int(11) NOT NULL DEFAULT '0',
  `roleName` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`accessRightRoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAccessRightRole`
--

LOCK TABLES `cmAccessRightRole` WRITE;
/*!40000 ALTER TABLE `cmAccessRightRole` DISABLE KEYS */;
INSERT INTO `cmAccessRightRole` VALUES (1,1,'administrators'),(2,1,'cmsUser'),(3,2,'administrators'),(4,2,'cmsUser'),(5,3,'administrators'),(6,3,'cmsUser'),(7,4,'administrators'),(8,4,'cmsUser'),(9,5,'administrators'),(10,5,'cmsUser'),(11,6,'administrators'),(12,6,'cmsUser'),(13,7,'administrators'),(14,7,'cmsUser'),(15,8,'administrators'),(16,8,'cmsUser'),(17,9,'administrators'),(18,9,'cmsUser'),(19,10,'administrators'),(20,10,'cmsUser');
/*!40000 ALTER TABLE `cmAccessRightRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAccessRightUser`
--

DROP TABLE IF EXISTS `cmAccessRightUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAccessRightUser` (
  `accessRightUserId` int(11) NOT NULL AUTO_INCREMENT,
  `accessRightId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`accessRightUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAccessRightUser`
--

LOCK TABLES `cmAccessRightUser` WRITE;
/*!40000 ALTER TABLE `cmAccessRightUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmAccessRightUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAvailableServiceBinding`
--

DROP TABLE IF EXISTS `cmAvailableServiceBinding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAvailableServiceBinding` (
  `availableServiceBindingId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `visualizationAction` text NOT NULL,
  `isMandatory` tinyint(4) NOT NULL DEFAULT '0',
  `isUserEditable` tinyint(4) NOT NULL DEFAULT '0',
  `isInheritable` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`availableServiceBindingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAvailableServiceBinding`
--

LOCK TABLES `cmAvailableServiceBinding` WRITE;
/*!40000 ALTER TABLE `cmAvailableServiceBinding` DISABLE KEYS */;
INSERT INTO `cmAvailableServiceBinding` VALUES (1,'Template','The page template-file','ViewListTemplate.action',1,1,1),(2,'Meta information','The keywords and other metainfo for this page','ViewContentTreeForServiceBinding.action',1,1,1);
/*!40000 ALTER TABLE `cmAvailableServiceBinding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmAvailableServiceBindingSiteNodeTypeDefinition`
--

DROP TABLE IF EXISTS `cmAvailableServiceBindingSiteNodeTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmAvailableServiceBindingSiteNodeTypeDefinition` (
  `availableServiceBindingSiteNodeTypeDefinitionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `availableServiceBindingId` int(11) NOT NULL DEFAULT '0',
  `siteNodeTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`availableServiceBindingSiteNodeTypeDefinitionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmAvailableServiceBindingSiteNodeTypeDefinition`
--

LOCK TABLES `cmAvailableServiceBindingSiteNodeTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmAvailableServiceBindingSiteNodeTypeDefinition` DISABLE KEYS */;
INSERT INTO `cmAvailableServiceBindingSiteNodeTypeDefinition` VALUES (1,1,2),(2,2,2),(3,2,1);
/*!40000 ALTER TABLE `cmAvailableServiceBindingSiteNodeTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmCategory`
--

DROP TABLE IF EXISTS `cmCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmCategory` (
  `categoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `displayName` varchar(4096) DEFAULT NULL,
  `description` text,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `categoryParentIdIndex` (`parentId`),
  KEY `categoryNameIndex` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmCategory`
--

LOCK TABLES `cmCategory` WRITE;
/*!40000 ALTER TABLE `cmCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContent`
--

DROP TABLE IF EXISTS `cmContent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContent` (
  `contentId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `publishDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `expireDateTime` datetime NOT NULL DEFAULT '2070-01-01 12:00:00',
  `contentTypeDefinitionId` int(11) DEFAULT NULL,
  `parentContentId` int(11) DEFAULT NULL,
  `creator` text NOT NULL,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  `isBranch` tinyint(4) NOT NULL DEFAULT '0',
  `isProtected` tinyint(4) NOT NULL DEFAULT '2',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentId`),
  KEY `contentTypeDefinitionId` (`contentTypeDefinitionId`),
  KEY `parentContentId` (`parentContentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContent`
--

LOCK TABLES `cmContent` WRITE;
/*!40000 ALTER TABLE `cmContent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmContent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContentCategory`
--

DROP TABLE IF EXISTS `cmContentCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContentCategory` (
  `contentCategoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attributeName` varchar(100) NOT NULL,
  `contentVersionId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`contentCategoryId`),
  KEY `attributeName_categoryId` (`attributeName`,`categoryId`),
  KEY `contentVersionId` (`contentVersionId`),
  KEY `categoryContVersionId` (`contentVersionId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContentCategory`
--

LOCK TABLES `cmContentCategory` WRITE;
/*!40000 ALTER TABLE `cmContentCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmContentCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContentRelation`
--

DROP TABLE IF EXISTS `cmContentRelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContentRelation` (
  `contentRelationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `relationInternalName` text NOT NULL,
  `relationTypeId` int(11) NOT NULL DEFAULT '0',
  `sourceContentId` int(11) NOT NULL DEFAULT '0',
  `destinationContentId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentRelationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContentRelation`
--

LOCK TABLES `cmContentRelation` WRITE;
/*!40000 ALTER TABLE `cmContentRelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmContentRelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContentTypeDefinition`
--

DROP TABLE IF EXISTS `cmContentTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContentTypeDefinition` (
  `contentTypeDefinitionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `schemaValue` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentContentTypeDefinitionId` int(11) DEFAULT '-1',
  `detailPageResolverClass` varchar(255) DEFAULT '',
  `detailPageResolverData` varchar(1024) DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentTypeDefinitionId`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContentTypeDefinition`
--

LOCK TABLES `cmContentTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmContentTypeDefinition` DISABLE KEYS */;
INSERT INTO `cmContentTypeDefinition` VALUES (1,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:complexType name=\"Image\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"Title\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined11\" label=\"Title - required\"/></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined87\" label=\"This is the image title\"/></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined80\" label=\"longtextfield\"/></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"NavigationTitle\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined27\" label=\"Navigation title - required\"/></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined73\" label=\"This is the label shown on links to this image\"/></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined28\" label=\"longtextfield\"/></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"Alt\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined75\" label=\"Alt text\"/></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined20\" label=\"This is the tooltip text for an image\"/></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined86\" label=\"longtextfield\"/></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"FullText\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined93\" label=\"Full text\"/></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined77\" label=\"Here you can put in a image description\"/></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined52\" label=\"normaltextarea\"/></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"/></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"/></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"/></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"/></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','Image',-1,'','',0),(2,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:complexType name=\"Meta info\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"Title\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined75\" label=\"Title - required\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined52\" label=\"Used in the page title\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined94\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"NavigationTitle\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined35\" label=\"Navigation title (required)\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined0\" label=\"Used in navigation elements pointing to the page\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined20\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"Description\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined31\" label=\"Description\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined86\" label=\"A short description of the page\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined15\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MetaInfo\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined85\" label=\"Meta Information\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined67\" label=\"Keywords made for search engines etc.\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined70\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"NiceURIName\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined5\" label=\"NiceURIName\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined8\" label=\"\"></value></values></param><param id=\"initialData\" inputTypeId=\"0\"><values><value id=\"undefined62\" label=\"\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined24\" label=\"longtextfield\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Default\"></value></values></param><param id=\"WYSIWYGExtraConfig\" inputTypeId=\"0\"><values><value id=\"WYSIWYGExtraConfig\" label=\"\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"OpenInNewWindow\" type=\"checkbox\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined57\" label=\"OpenInNewWindow\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined61\" label=\"Should we open the page in a new window\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined74\" label=\"normaltextarea\"></value></values></param><param id=\"values\" inputTypeId=\"1\"><values><value id=\"true\" label=\"Yes\"></value></values></param><param id=\"initialData\" inputTypeId=\"0\"><values><value id=\"initialData\" label=\"\"></value></values></param><param id=\"enableComponentPropertiesEditor\" inputTypeId=\"0\"><values><value id=\"enableComponentPropertiesEditor\" label=\"false\"></value></values></param><param id=\"widget\" inputTypeId=\"0\"><values><value id=\"widget\" label=\"default\"></value></values></param><param id=\"dataProviderClass\" inputTypeId=\"\"><values><value id=\"dataProviderClass\" label=\"\"></value></values></param><param id=\"dataProviderParameters\" inputTypeId=\"\"><values><value id=\"dataProviderParameters\" label=\"\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Default\"></value></values></param><param id=\"WYSIWYGExtraConfig\" inputTypeId=\"0\"><values><value id=\"WYSIWYGExtraConfig\" label=\"\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MetaInfo\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined83\" label=\"undefined11\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined84\" label=\"undefined68\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined35\" label=\"undefined1\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"true\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableContentRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableContentRelationEditor\" label=\"false\"></value></values></param><param id=\"enableStructureRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableStructureRelationEditor\" label=\"false\"></value></values></param><param id=\"activateExtendedEditorOnLoad\" inputTypeId=\"0\"><values><value id=\"activateExtendedEditorOnLoad\" label=\"false\"></value></values></param><param id=\"initialData\" inputTypeId=\"0\"><values><value id=\"initialData\" label=\"\"></value></values></param><param id=\"enableComponentPropertiesEditor\" inputTypeId=\"0\"><values><value id=\"enableComponentPropertiesEditor\" label=\"false\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Default\"></value></values></param><param id=\"WYSIWYGExtraConfig\" inputTypeId=\"0\"><values><value id=\"WYSIWYGExtraConfig\" label=\"\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"ComponentStructure\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined67\" label=\"ComponentStructure\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined38\" label=\"ComponentStructure\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined73\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','Meta info',-1,'','',0),(3,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:complexType name=\"Article\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"Title\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined34\" label=\"Title\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined53\" label=\"This represents the article title\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined94\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"NavigationTitle\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined58\" label=\"Navigation title\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined37\" label=\"This represents the article linktitle\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined95\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"Leadin\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined28\" label=\"Lead in text\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined79\" label=\"This is an introduction to the full text\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined70\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"true\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Basic\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"FullText\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined45\" label=\"Full text\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined8\" label=\"This is the article fulltext\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined54\" label=\"hugetextfield\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"500\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"true\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Default\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"RelatedArticles\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined75\" label=\"Related Articles\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined5\" label=\"Here you can add related articles\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined57\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"true\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"RelatedAreas\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined93\" label=\"Related areas\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined30\" label=\"Points out related areas on the site\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined83\" label=\"normaltextfield\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableContentRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableContentRelationEditor\" label=\"false\"></value></values></param><param id=\"enableStructureRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableStructureRelationEditor\" label=\"true\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','Article',-1,'','',0),(4,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:complexType name=\"HTMLTemplate\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"Name\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined7\" label=\"Name\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined82\" label=\"This is the name of the template\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined61\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"Template\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined16\" label=\"Template HTML\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined90\" label=\"This is the html for the template \"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined12\" label=\"hugetextfield\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"500\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"ComponentProperties\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined89\" label=\"ComponentProperties\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined40\" label=\"ComponentProperties\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined93\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"false\"></value></values></param><param id=\"enableComponentPropertiesEditor\" inputTypeId=\"0\"><values><value id=\"enableComponentPropertiesEditor\" label=\"true\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"GroupName\" type=\"select\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined89\" label=\"Group Name\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined94\" label=\"The name of the group the component should be in\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined63\" label=\"normaltextfield\"></value></values></param><param id=\"values\" inputTypeId=\"1\"><values><value id=\"Basic Pages\" label=\"Basic Pages\"></value><value id=\"Single Content\" label=\"Single Content\"></value><value id=\"Content Iterators\" label=\"Content Iterators\"></value><value id=\"Navigation\" label=\"Navigation\"></value><value id=\"Layout\" label=\"Layout\"></value><value id=\"Templates\" label=\"Templates\"></value><value id=\"Other\" label=\"Other\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"PreTemplate\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined23\" label=\"Pre processing template\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined67\" label=\"This template gets invoked before the render phase\"></value></values></param><param id=\"initialData\" inputTypeId=\"0\"><values><value id=\"undefined67\" label=\"undefined83\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined97\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"WYSIWYGToolbar\" inputTypeId=\"0\"><values><value id=\"WYSIWYGToolbar\" label=\"Default\"></value></values></param><param id=\"WYSIWYGExtraConfig\" inputTypeId=\"0\"><values><value id=\"WYSIWYGExtraConfig\" label=\"\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableContentRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableContentRelationEditor\" label=\"false\"></value></values></param><param id=\"enableStructureRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableStructureRelationEditor\" label=\"false\"></value></values></param><param id=\"enableComponentPropertiesEditor\" inputTypeId=\"0\"><values><value id=\"enableComponentPropertiesEditor\" label=\"false\"></value></values></param><param id=\"activateExtendedEditorOnLoad\" inputTypeId=\"0\"><values><value id=\"activateExtendedEditorOnLoad\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','HTMLTemplate',-1,'','',0),(5,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:complexType name=\"Article\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"HTMLFormular\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined29\" label=\"HTMLFormular\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined28\" label=\"This area contains the formular\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined15\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"true\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"FormName\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined25\" label=\"FormName\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined62\" label=\"This name is used to reach a form by name in Javascript for example\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined77\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"FormMethod\" type=\"select\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined27\" label=\"Method\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined54\" label=\"This is the method used for sending data\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined24\" label=\"longtextfield\"></value></values></param><param id=\"values\" inputTypeId=\"1\"><values><value id=\"post\" label=\"POST\"></value><value id=\"get\" label=\"GET\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"FormAction\" type=\"select\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined44\" label=\"Action\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined29\" label=\"This is the action we send the form values to\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined36\" label=\"longtextfield\"></value></values></param><param id=\"values\" inputTypeId=\"1\"><values><value id=\"InfoGlueDefaultInputHandler.action\" label=\"Default Handler\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"InputHandlerClassName\" type=\"select\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined70\" label=\"Input handler\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined68\" label=\"This decides what procedure to invoke with the data\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined77\" label=\"longtextfield\"></value></values></param><param id=\"values\" inputTypeId=\"1\"><values><value id=\"org.infoglue.deliver.applications.inputhandlers.MailSender\" label=\"Simple Mail Handler\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MailSender_fromAddress\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined63\" label=\"MailSender_fromAddress\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined18\" label=\"The address to give as sender in case it is sent by mail \"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined71\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MailSender_toAddress\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined58\" label=\"MailSender_toAddress\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined33\" label=\"The address to send the form data to\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined10\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MailSender_subject\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined26\" label=\"MailSender_subject\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined85\" label=\"The subject to give if the data is sent as mail\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined42\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"MailSender_template\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined68\" label=\"MailSender_template\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined50\" label=\"This is the template that formats the mail\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined55\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"true\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all>\r\n	    </xs:complexType>\r\n	  </xs:element>\r\n	  </xs:all>\r\n	</xs:complexType>\r\n<xs:simpleType name=\"assetKeys\"><xs:restriction base=\"xs:string\"></xs:restriction></xs:simpleType></xs:schema>','HTMLFormular',-1,'','',0),(6,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"></xs:maxLength></xs:restriction></xs:simpleType><xs:complexType name=\"Content\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"UserInputHTML\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined64\" label=\"UserInputHTML\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined98\" label=\"UserInputHTML\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined26\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"ScriptCode\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined22\" label=\"ScriptCode\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined90\" label=\"The code\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined99\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"600\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"UserOutputHTML\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined63\" label=\"UserOutputHTML\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined22\" label=\"UserOutputHTML\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined28\" label=\"normaltextarea\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"150\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param><param id=\"enableFormEditor\" inputTypeId=\"0\"><values><value id=\"enableFormEditor\" label=\"false\"></value></values></param><param id=\"enableRelationEditor\" inputTypeId=\"0\"><values><value id=\"enableRelationEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','TaskDefinition',-1,'','',0),(7,'<?xml version=\"1.0\" encoding=\"utf-8\"?><xs:schema attributeFormDefault=\"unqualified\" elementFormDefault=\"qualified\" version=\"2.0\" xmlns:xi=\"http://www.w3.org/2001/XInclude\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"><xs:simpleType name=\"textarea\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"radiobutton\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"checkbox\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"select\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:simpleType name=\"textfield\"><xs:restriction base=\"xs:string\"><xs:maxLength value=\"100\"/></xs:restriction></xs:simpleType><xs:complexType name=\"PageTemplate\"><xs:all><xs:element name=\"Attributes\"><xs:complexType><xs:all><xs:element name=\"Name\" type=\"textfield\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined7\" label=\"Name\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined82\" label=\"This is the name of the page template\"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined61\" label=\"longtextfield\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element><xs:element name=\"ComponentStructure\" type=\"textarea\"><xs:annotation><xs:appinfo><params><param id=\"title\" inputTypeId=\"0\"><values><value id=\"undefined16\" label=\"ComponentStructure\"></value></values></param><param id=\"description\" inputTypeId=\"0\"><values><value id=\"undefined90\" label=\"This is the page template structure \"></value></values></param><param id=\"class\" inputTypeId=\"0\"><values><value id=\"undefined12\" label=\"hugetextfield\"></value></values></param><param id=\"width\" inputTypeId=\"0\"><values><value id=\"width\" label=\"700\"></value></values></param><param id=\"height\" inputTypeId=\"0\"><values><value id=\"height\" label=\"500\"></value></values></param><param id=\"enableWYSIWYG\" inputTypeId=\"0\"><values><value id=\"enableWYSIWYG\" label=\"false\"></value></values></param><param id=\"enableTemplateEditor\" inputTypeId=\"0\"><values><value id=\"enableTemplateEditor\" label=\"false\"></value></values></param></params></xs:appinfo></xs:annotation></xs:element></xs:all></xs:complexType></xs:element></xs:all></xs:complexType></xs:schema>','PageTemplate',-1,'','',0);
/*!40000 ALTER TABLE `cmContentTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContentVersion`
--

DROP TABLE IF EXISTS `cmContentVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContentVersion` (
  `contentVersionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stateId` tinyint(4) NOT NULL DEFAULT '0',
  `versionValue` longtext NOT NULL,
  `modifiedDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `versionComment` text NOT NULL,
  `isCheckedOut` tinyint(4) NOT NULL DEFAULT '0',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `contentId` int(11) NOT NULL DEFAULT '0',
  `languageId` int(11) NOT NULL DEFAULT '0',
  `versionModifier` text NOT NULL,
  PRIMARY KEY (`contentVersionId`),
  KEY `contentId` (`contentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContentVersion`
--

LOCK TABLES `cmContentVersion` WRITE;
/*!40000 ALTER TABLE `cmContentVersion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmContentVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmContentVersionDigitalAsset`
--

DROP TABLE IF EXISTS `cmContentVersionDigitalAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmContentVersionDigitalAsset` (
  `contentVersionDigitalAssetId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contentVersionId` int(11) unsigned NOT NULL DEFAULT '0',
  `digitalAssetId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentVersionDigitalAssetId`),
  KEY `contVerDigAssetDigAssId` (`digitalAssetId`),
  KEY `contVerDigAssetContVerId` (`contentVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmContentVersionDigitalAsset`
--

LOCK TABLES `cmContentVersionDigitalAsset` WRITE;
/*!40000 ALTER TABLE `cmContentVersionDigitalAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmContentVersionDigitalAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmDigitalAsset`
--

DROP TABLE IF EXISTS `cmDigitalAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmDigitalAsset` (
  `digitalAssetId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `assetKey` text NOT NULL,
  `assetFileName` text NOT NULL,
  `assetFilePath` text NOT NULL,
  `assetFileSize` int(11) NOT NULL DEFAULT '0',
  `assetContentType` varchar(255) DEFAULT NULL,
  `assetBlob` longblob,
  PRIMARY KEY (`digitalAssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmDigitalAsset`
--

LOCK TABLES `cmDigitalAsset` WRITE;
/*!40000 ALTER TABLE `cmDigitalAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmDigitalAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmEvent`
--

DROP TABLE IF EXISTS `cmEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmEvent` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `entityClass` text NOT NULL,
  `entityId` int(11) NOT NULL DEFAULT '0',
  `creationDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `typeId` int(11) NOT NULL DEFAULT '0',
  `creator` text NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmEvent`
--

LOCK TABLES `cmEvent` WRITE;
/*!40000 ALTER TABLE `cmEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmFormEntry`
--

DROP TABLE IF EXISTS `cmFormEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmFormEntry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `originAddress` varchar(1024) NOT NULL,
  `formName` varchar(255) NOT NULL,
  `formContentId` int(10) unsigned NOT NULL,
  `userIP` varchar(20) NOT NULL,
  `userAgent` varchar(255) NOT NULL,
  `registrationDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmFormEntry`
--

LOCK TABLES `cmFormEntry` WRITE;
/*!40000 ALTER TABLE `cmFormEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmFormEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmFormEntryAsset`
--

DROP TABLE IF EXISTS `cmFormEntryAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmFormEntryAsset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `formEntryId` int(10) unsigned NOT NULL,
  `fileName` varchar(255) NOT NULL,
  `fileSize` int(10) unsigned NOT NULL,
  `assetKey` varchar(255) NOT NULL,
  `contentType` varchar(50) NOT NULL,
  `assetBlob` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmFormEntryAsset`
--

LOCK TABLES `cmFormEntryAsset` WRITE;
/*!40000 ALTER TABLE `cmFormEntryAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmFormEntryAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmFormEntryValue`
--

DROP TABLE IF EXISTS `cmFormEntryValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmFormEntryValue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` varchar(4096) DEFAULT NULL,
  `formEntryId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmFormEntryValue`
--

LOCK TABLES `cmFormEntryValue` WRITE;
/*!40000 ALTER TABLE `cmFormEntryValue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmFormEntryValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmGroup`
--

DROP TABLE IF EXISTS `cmGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmGroup` (
  `groupName` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `source` varchar(45) NOT NULL DEFAULT 'infoglue',
  `groupType` varchar(45) NOT NULL DEFAULT '',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `modifiedDateTime` timestamp NOT NULL DEFAULT '2010-01-01 12:00:00',
  PRIMARY KEY (`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmGroup`
--

LOCK TABLES `cmGroup` WRITE;
/*!40000 ALTER TABLE `cmGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmGroupContentTypeDefinition`
--

DROP TABLE IF EXISTS `cmGroupContentTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmGroupContentTypeDefinition` (
  `groupContentTypeDefinitionId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupContentTypeDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmGroupContentTypeDefinition`
--

LOCK TABLES `cmGroupContentTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmGroupContentTypeDefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmGroupContentTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmGroupProperties`
--

DROP TABLE IF EXISTS `cmGroupProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmGroupProperties` (
  `groupPropertiesId` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `languageId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupPropertiesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmGroupProperties`
--

LOCK TABLES `cmGroupProperties` WRITE;
/*!40000 ALTER TABLE `cmGroupProperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmGroupProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmGroupPropertiesDigitalAsset`
--

DROP TABLE IF EXISTS `cmGroupPropertiesDigitalAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmGroupPropertiesDigitalAsset` (
  `groupPropertiesDigitalAssetId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupPropertiesId` int(11) unsigned NOT NULL DEFAULT '0',
  `digitalAssetId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupPropertiesDigitalAssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmGroupPropertiesDigitalAsset`
--

LOCK TABLES `cmGroupPropertiesDigitalAsset` WRITE;
/*!40000 ALTER TABLE `cmGroupPropertiesDigitalAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmGroupPropertiesDigitalAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmInfoGlueProperties`
--

DROP TABLE IF EXISTS `cmInfoGlueProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmInfoGlueProperties` (
  `propertyId` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`propertyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmInfoGlueProperties`
--

LOCK TABLES `cmInfoGlueProperties` WRITE;
/*!40000 ALTER TABLE `cmInfoGlueProperties` DISABLE KEYS */;
INSERT INTO `cmInfoGlueProperties` VALUES (1,'version','3.1.1.0');
/*!40000 ALTER TABLE `cmInfoGlueProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmInterceptionPoint`
--

DROP TABLE IF EXISTS `cmInterceptionPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmInterceptionPoint` (
  `interceptionPointId` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `usesExtraDataForAccessControl` int(11) DEFAULT '0',
  PRIMARY KEY (`interceptionPointId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmInterceptionPoint`
--

LOCK TABLES `cmInterceptionPoint` WRITE;
/*!40000 ALTER TABLE `cmInterceptionPoint` DISABLE KEYS */;
INSERT INTO `cmInterceptionPoint` VALUES (1,'Repository','Repository.Read','Gives a user access to look at a repository',1),(2,'ManagementTool','ManagementTool.Read','Gives a user access to the management tool',0),(3,'ContentTool','ContentTool.Read','Gives a user access to the content tool',0),(4,'StructureTool','StructureTool.Read','Gives a user access to the structure tool',0),(5,'PublishingTool','PublishingTool.Read','Gives a user access to the publishing tool',0),(6,'Content','Content.Read','Intercepts the read of a content',1),(7,'Content','Content.Write','Intercepts the write of a content',1),(8,'SiteNodeVersion','SiteNodeVersion.Read','Intercepts the read of a SiteNodeVersion',1),(9,'SiteNodeVersion','SiteNodeVersion.Write','Intercepts the write of a SiteNodeVersion',1),(10,'Content','Content.Create','Intercepts the creation of a new content or folder',1),(11,'Content','Content.Delete','Intercepts the deletion of a content',1),(12,'Content','Content.Move','Intercepts the movement of a content',1),(13,'Content','Content.SubmitToPublish','Intercepts the submittance to publish of all content versions',1),(14,'Content','Content.ChangeAccessRights','Intercepts the attempt to change access rights',1),(15,'Content','Content.CreateVersion','Intercepts the creation of a new contentversion',1),(16,'ContentVersion','ContentVersion.Delete','Intercepts the deletion of a contentversion',1),(17,'ContentVersion','ContentVersion.Write','Intercepts the editing of a contentversion',1),(18,'ContentVersion','ContentVersion.Read','Intercepts the read of a contentversion',1),(19,'SiteNodeVersion','SiteNodeVersion.CreateSiteNode','Intercepts the creation of a new sitenode',1),(20,'SiteNodeVersion','SiteNodeVersion.DeleteSiteNode','Intercepts the deletion of a sitenode',1),(21,'SiteNodeVersion','SiteNodeVersion.MoveSiteNode','Intercepts the movement of a sitenode',1),(22,'SiteNodeVersion','SiteNodeVersion.SubmitToPublish','Intercepts the submittance to publish of all content versions',1),(23,'SiteNodeVersion','SiteNodeVersion.ChangeAccessRights','Intercepts the attempt to change access rights',1),(24,'ContentVersion','ContentVersion.Publish','Intercepts the direct publishing of a content version',1),(25,'SiteNodeVersion','SiteNodeVersion.Publish','Intercepts the direct publishing of a siteNode version',1),(26,'MyDesktopTool','MyDesktopTool.Read','Gives a user access to the MyDesktop tool',0),(27,'ContentTypeDefinition','ContentTypeDefinition.Read','This point checks access to read/use a content type definition',1),(28,'Category','Category.Read','This point checks access to read/use a category',1),(29,'Publication','Publication.Write','This point intercepts a new publication',1),(30,'Repository','Repository.ReadForBinding','This point intercepts when a user tries to read the repository in a binding dialog',1),(31,'Workflow','Workflow.Create','This point checks access to creating a new workflow',1),(32,'StructureTool','StructureTool.SaveTemplate','This interception point limits who get the save-button in the toolbar',0);
/*!40000 ALTER TABLE `cmInterceptionPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmInterceptionPointInterceptor`
--

DROP TABLE IF EXISTS `cmInterceptionPointInterceptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmInterceptionPointInterceptor` (
  `interceptionPointId` int(11) NOT NULL,
  `interceptorId` int(11) NOT NULL,
  PRIMARY KEY (`interceptionPointId`,`interceptorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmInterceptionPointInterceptor`
--

LOCK TABLES `cmInterceptionPointInterceptor` WRITE;
/*!40000 ALTER TABLE `cmInterceptionPointInterceptor` DISABLE KEYS */;
INSERT INTO `cmInterceptionPointInterceptor` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1);
/*!40000 ALTER TABLE `cmInterceptionPointInterceptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmInterceptor`
--

DROP TABLE IF EXISTS `cmInterceptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmInterceptor` (
  `interceptorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `className` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`interceptorId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmInterceptor`
--

LOCK TABLES `cmInterceptor` WRITE;
/*!40000 ALTER TABLE `cmInterceptor` DISABLE KEYS */;
INSERT INTO `cmInterceptor` VALUES (1,'InfoGlue Common Access Rights Interceptor','org.infoglue.cms.security.interceptors.InfoGlueCommonAccessRightsInterceptor','Takes care of bla');
/*!40000 ALTER TABLE `cmInterceptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmLanguage`
--

DROP TABLE IF EXISTS `cmLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmLanguage` (
  `languageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `languageCode` text NOT NULL,
  `charset` text NOT NULL,
  PRIMARY KEY (`languageId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmLanguage`
--

LOCK TABLES `cmLanguage` WRITE;
/*!40000 ALTER TABLE `cmLanguage` DISABLE KEYS */;
INSERT INTO `cmLanguage` VALUES (1,'English','en','utf-8'),(2,'German','de','utf-8'),(3,'Swedish','sv','utf-8');
/*!40000 ALTER TABLE `cmLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmPageDeliveryMetaData`
--

DROP TABLE IF EXISTS `cmPageDeliveryMetaData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmPageDeliveryMetaData` (
  `pageDeliveryMetaDataId` int(11) NOT NULL AUTO_INCREMENT,
  `siteNodeId` int(11) NOT NULL,
  `languageId` int(11) NOT NULL,
  `contentId` int(11) NOT NULL,
  `lastModifiedDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `selectiveCacheUpdateNotApplicable` tinyint(4) NOT NULL DEFAULT '0',
  `lastModifiedTimeout` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`pageDeliveryMetaDataId`),
  KEY `pageDeliveryMetaDataIDX` (`siteNodeId`,`languageId`,`contentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmPageDeliveryMetaData`
--

LOCK TABLES `cmPageDeliveryMetaData` WRITE;
/*!40000 ALTER TABLE `cmPageDeliveryMetaData` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmPageDeliveryMetaData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmPageDeliveryMetaDataEntity`
--

DROP TABLE IF EXISTS `cmPageDeliveryMetaDataEntity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmPageDeliveryMetaDataEntity` (
  `pageDeliveryMetaDataEntityId` int(11) NOT NULL AUTO_INCREMENT,
  `pageDeliveryMetaDataId` int(11) NOT NULL,
  `siteNodeId` int(11) DEFAULT NULL,
  `contentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pageDeliveryMetaDataEntityId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmPageDeliveryMetaDataEntity`
--

LOCK TABLES `cmPageDeliveryMetaDataEntity` WRITE;
/*!40000 ALTER TABLE `cmPageDeliveryMetaDataEntity` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmPageDeliveryMetaDataEntity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmPropertiesCategory`
--

DROP TABLE IF EXISTS `cmPropertiesCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmPropertiesCategory` (
  `propertiesCategoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attributeName` varchar(100) NOT NULL,
  `entityName` varchar(100) NOT NULL,
  `entityId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  PRIMARY KEY (`propertiesCategoryId`),
  KEY `propCategoryAttrNameIndex` (`attributeName`),
  KEY `propCategoryEntityNameIndex` (`entityName`),
  KEY `propCategoryEntityIdIndex` (`entityId`),
  KEY `propCategoryCategoryIdIndex` (`categoryId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmPropertiesCategory`
--

LOCK TABLES `cmPropertiesCategory` WRITE;
/*!40000 ALTER TABLE `cmPropertiesCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmPropertiesCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmPublication`
--

DROP TABLE IF EXISTS `cmPublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmPublication` (
  `publicationId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `publicationDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `publisher` text NOT NULL,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmPublication`
--

LOCK TABLES `cmPublication` WRITE;
/*!40000 ALTER TABLE `cmPublication` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmPublication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmPublicationDetail`
--

DROP TABLE IF EXISTS `cmPublicationDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmPublicationDetail` (
  `publicationDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `publicationId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `entityClass` text NOT NULL,
  `entityId` int(11) NOT NULL DEFAULT '0',
  `creationDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `typeId` int(11) NOT NULL DEFAULT '0',
  `publisher` text NOT NULL,
  PRIMARY KEY (`publicationDetailId`),
  KEY `publicationId` (`publicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmPublicationDetail`
--

LOCK TABLES `cmPublicationDetail` WRITE;
/*!40000 ALTER TABLE `cmPublicationDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmPublicationDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmQualifyer`
--

DROP TABLE IF EXISTS `cmQualifyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmQualifyer` (
  `qualifyerId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '0',
  `serviceBindingId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qualifyerId`),
  KEY `serviceBindingId` (`serviceBindingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmQualifyer`
--

LOCK TABLES `cmQualifyer` WRITE;
/*!40000 ALTER TABLE `cmQualifyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmQualifyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRedirect`
--

DROP TABLE IF EXISTS `cmRedirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRedirect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `redirectUrl` text NOT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `publishDateTime` datetime DEFAULT NULL,
  `expireDateTime` datetime DEFAULT NULL,
  `modifier` text,
  `isUserManaged` tinyint(4) NOT NULL DEFAULT '1',
  `siteNodeId` int(11) DEFAULT NULL,
  `languageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `redirectUrl` (`redirectUrl`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRedirect`
--

LOCK TABLES `cmRedirect` WRITE;
/*!40000 ALTER TABLE `cmRedirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRedirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRegistry`
--

DROP TABLE IF EXISTS `cmRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRegistry` (
  `registryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entityName` varchar(100) NOT NULL,
  `entityId` varchar(200) NOT NULL,
  `referenceType` tinyint(4) NOT NULL,
  `referencingEntityName` varchar(100) NOT NULL,
  `referencingEntityId` varchar(200) NOT NULL,
  `referencingEntityComplName` varchar(100) NOT NULL,
  `referencingEntityComplId` varchar(200) NOT NULL,
  PRIMARY KEY (`registryId`),
  KEY `referencingEntityName` (`referencingEntityName`),
  KEY `referencingEntityId` (`referencingEntityId`),
  KEY `entityName` (`entityName`),
  KEY `entityId` (`entityId`),
  KEY `referencingEntityComplName` (`referencingEntityComplName`),
  KEY `referencingEntityComplId` (`referencingEntityComplId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRegistry`
--

LOCK TABLES `cmRegistry` WRITE;
/*!40000 ALTER TABLE `cmRegistry` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRegistry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRepository`
--

DROP TABLE IF EXISTS `cmRepository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRepository` (
  `repositoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `dnsName` text NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`repositoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRepository`
--

LOCK TABLES `cmRepository` WRITE;
/*!40000 ALTER TABLE `cmRepository` DISABLE KEYS */;
INSERT INTO `cmRepository` VALUES (1,'testsite.org','Sample repository','',0);
/*!40000 ALTER TABLE `cmRepository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRepositoryContentTypeDefinition`
--

DROP TABLE IF EXISTS `cmRepositoryContentTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRepositoryContentTypeDefinition` (
  `repositoryContentTypeDefinitionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`repositoryContentTypeDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRepositoryContentTypeDefinition`
--

LOCK TABLES `cmRepositoryContentTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmRepositoryContentTypeDefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRepositoryContentTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRepositoryLanguage`
--

DROP TABLE IF EXISTS `cmRepositoryLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRepositoryLanguage` (
  `repositoryLanguageId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  `languageId` int(11) NOT NULL DEFAULT '0',
  `isPublished` tinyint(4) NOT NULL DEFAULT '0',
  `sortOrder` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`repositoryLanguageId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRepositoryLanguage`
--

LOCK TABLES `cmRepositoryLanguage` WRITE;
/*!40000 ALTER TABLE `cmRepositoryLanguage` DISABLE KEYS */;
INSERT INTO `cmRepositoryLanguage` VALUES (1,1,1,0,0),(2,1,2,0,0),(3,1,3,0,0);
/*!40000 ALTER TABLE `cmRepositoryLanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRole`
--

DROP TABLE IF EXISTS `cmRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRole` (
  `roleName` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `source` varchar(45) NOT NULL DEFAULT 'infoglue',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `modifiedDateTime` timestamp NOT NULL DEFAULT '2010-01-01 12:00:00',
  PRIMARY KEY (`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRole`
--

LOCK TABLES `cmRole` WRITE;
/*!40000 ALTER TABLE `cmRole` DISABLE KEYS */;
INSERT INTO `cmRole` VALUES ('administrators','This is the most priviliged group','infoglue',1,'2010-01-01 12:00:00'),('anonymous','Must be present to model the default anonymous extranet role.','infoglue',1,'2010-01-01 12:00:00'),('cmsUser','Must be present to allow any ordinary user to get access.','infoglue',1,'2010-01-01 12:00:00');
/*!40000 ALTER TABLE `cmRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRoleContentTypeDefinition`
--

DROP TABLE IF EXISTS `cmRoleContentTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRoleContentTypeDefinition` (
  `roleContentTypeDefinitionId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleContentTypeDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRoleContentTypeDefinition`
--

LOCK TABLES `cmRoleContentTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmRoleContentTypeDefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRoleContentTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRoleProperties`
--

DROP TABLE IF EXISTS `cmRoleProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRoleProperties` (
  `rolePropertiesId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `languageId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rolePropertiesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRoleProperties`
--

LOCK TABLES `cmRoleProperties` WRITE;
/*!40000 ALTER TABLE `cmRoleProperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRoleProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmRolePropertiesDigitalAsset`
--

DROP TABLE IF EXISTS `cmRolePropertiesDigitalAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmRolePropertiesDigitalAsset` (
  `rolePropertiesDigitalAssetId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rolePropertiesId` int(11) unsigned NOT NULL DEFAULT '0',
  `digitalAssetId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rolePropertiesDigitalAssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmRolePropertiesDigitalAsset`
--

LOCK TABLES `cmRolePropertiesDigitalAsset` WRITE;
/*!40000 ALTER TABLE `cmRolePropertiesDigitalAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmRolePropertiesDigitalAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmServerNode`
--

DROP TABLE IF EXISTS `cmServerNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmServerNode` (
  `serverNodeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `dnsName` text NOT NULL,
  PRIMARY KEY (`serverNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmServerNode`
--

LOCK TABLES `cmServerNode` WRITE;
/*!40000 ALTER TABLE `cmServerNode` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmServerNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmServiceBinding`
--

DROP TABLE IF EXISTS `cmServiceBinding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmServiceBinding` (
  `serviceBindingId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `bindingTypeId` int(11) NOT NULL DEFAULT '0',
  `serviceDefinitionId` int(11) NOT NULL DEFAULT '0',
  `availableServiceBindingId` int(11) NOT NULL DEFAULT '0',
  `siteNodeVersionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceBindingId`),
  KEY `serviceDefinitionId` (`serviceDefinitionId`),
  KEY `availableServiceBindingId` (`availableServiceBindingId`),
  KEY `siteNodeVersionId` (`siteNodeVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmServiceBinding`
--

LOCK TABLES `cmServiceBinding` WRITE;
/*!40000 ALTER TABLE `cmServiceBinding` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmServiceBinding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmServiceDefinition`
--

DROP TABLE IF EXISTS `cmServiceDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmServiceDefinition` (
  `serviceDefinitionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `className` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`serviceDefinitionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmServiceDefinition`
--

LOCK TABLES `cmServiceDefinition` WRITE;
/*!40000 ALTER TABLE `cmServiceDefinition` DISABLE KEYS */;
INSERT INTO `cmServiceDefinition` VALUES (1,'org.infoglue.cms.services.CoreContentService','Core content service','Core content service'),(2,'org.infoglue.cms.services.CoreStructureService','Core structure service','The local structure-service');
/*!40000 ALTER TABLE `cmServiceDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmServiceDefinitionAvailableServiceBinding`
--

DROP TABLE IF EXISTS `cmServiceDefinitionAvailableServiceBinding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmServiceDefinitionAvailableServiceBinding` (
  `serviceDefinitionAvailableServiceBindingId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `serviceDefinitionId` int(11) NOT NULL DEFAULT '0',
  `availableServiceBindingId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceDefinitionAvailableServiceBindingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmServiceDefinitionAvailableServiceBinding`
--

LOCK TABLES `cmServiceDefinitionAvailableServiceBinding` WRITE;
/*!40000 ALTER TABLE `cmServiceDefinitionAvailableServiceBinding` DISABLE KEYS */;
INSERT INTO `cmServiceDefinitionAvailableServiceBinding` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `cmServiceDefinitionAvailableServiceBinding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSiteNode`
--

DROP TABLE IF EXISTS `cmSiteNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSiteNode` (
  `siteNodeId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `publishDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `expireDateTime` datetime NOT NULL DEFAULT '2070-01-01 12:00:00',
  `parentSiteNodeId` int(11) DEFAULT NULL,
  `creator` text NOT NULL,
  `repositoryId` int(11) NOT NULL DEFAULT '0',
  `siteNodeTypeDefinitionId` int(11) DEFAULT '0',
  `isBranch` tinyint(4) NOT NULL DEFAULT '0',
  `metaInfoContentId` int(11) DEFAULT '-1',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`siteNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSiteNode`
--

LOCK TABLES `cmSiteNode` WRITE;
/*!40000 ALTER TABLE `cmSiteNode` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmSiteNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSiteNodeTypeDefinition`
--

DROP TABLE IF EXISTS `cmSiteNodeTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSiteNodeTypeDefinition` (
  `siteNodeTypeDefinitionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `invokerClassName` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`siteNodeTypeDefinitionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSiteNodeTypeDefinition`
--

LOCK TABLES `cmSiteNodeTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmSiteNodeTypeDefinition` DISABLE KEYS */;
INSERT INTO `cmSiteNodeTypeDefinition` VALUES (1,'org.infoglue.deliver.invokers.ComponentBasedHTMLPageInvoker','ComponentPage','A component based page type'),(2,'org.infoglue.deliver.invokers.HTMLPageInvoker','HTMLPage','Old template based page type');
/*!40000 ALTER TABLE `cmSiteNodeTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSiteNodeVersion`
--

DROP TABLE IF EXISTS `cmSiteNodeVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSiteNodeVersion` (
  `siteNodeVersionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stateId` tinyint(4) NOT NULL DEFAULT '0',
  `versionNumber` int(11) NOT NULL DEFAULT '0',
  `modifiedDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `versionComment` text NOT NULL,
  `isCheckedOut` tinyint(4) NOT NULL DEFAULT '0',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `siteNodeId` int(11) NOT NULL DEFAULT '0',
  `versionModifier` text NOT NULL,
  `isProtected` tinyint(4) NOT NULL DEFAULT '2',
  `disablePageCache` tinyint(4) NOT NULL DEFAULT '2',
  `disableEditOnSight` tinyint(4) NOT NULL DEFAULT '2',
  `disableLanguages` tinyint(4) NOT NULL DEFAULT '2',
  `disableForceIDCheck` tinyint(4) NOT NULL DEFAULT '2',
  `forceProtocolChange` tinyint(4) NOT NULL DEFAULT '0',
  `contentType` varchar(255) DEFAULT NULL,
  `pageCacheKey` varchar(255) NOT NULL DEFAULT 'default',
  `pageCacheTimeout` varchar(20) DEFAULT NULL,
  `sortOrder` int(11) NOT NULL DEFAULT '-1',
  `isHidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`siteNodeVersionId`),
  KEY `siteNodeId` (`siteNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSiteNodeVersion`
--

LOCK TABLES `cmSiteNodeVersion` WRITE;
/*!40000 ALTER TABLE `cmSiteNodeVersion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmSiteNodeVersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSubscription`
--

DROP TABLE IF EXISTS `cmSubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSubscription` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `interceptionPointId` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `isGlobal` tinyint(4) NOT NULL DEFAULT '0',
  `entityName` varchar(100) DEFAULT NULL,
  `entityId` varchar(200) DEFAULT NULL,
  `userName` varchar(150) NOT NULL,
  `userEmail` varchar(150) DEFAULT NULL,
  `lastNotifiedDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSubscription`
--

LOCK TABLES `cmSubscription` WRITE;
/*!40000 ALTER TABLE `cmSubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmSubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSubscriptionFilter`
--

DROP TABLE IF EXISTS `cmSubscriptionFilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSubscriptionFilter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscriptionId` int(10) unsigned NOT NULL,
  `filterType` varchar(50) NOT NULL,
  `filterCondition` varchar(255) NOT NULL,
  `isAndCondition` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSubscriptionFilter`
--

LOCK TABLES `cmSubscriptionFilter` WRITE;
/*!40000 ALTER TABLE `cmSubscriptionFilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmSubscriptionFilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSystemUser`
--

DROP TABLE IF EXISTS `cmSystemUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSystemUser` (
  `userName` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` text NOT NULL,
  `lastName` text NOT NULL,
  `email` text NOT NULL,
  `source` varchar(45) NOT NULL DEFAULT 'infoglue',
  `isActive` tinyint(4) NOT NULL DEFAULT '1',
  `modifiedDateTime` timestamp NOT NULL DEFAULT '2010-01-01 12:00:00',
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSystemUser`
--

LOCK TABLES `cmSystemUser` WRITE;
/*!40000 ALTER TABLE `cmSystemUser` DISABLE KEYS */;
INSERT INTO `cmSystemUser` VALUES ('administrator','changeit','System','Administrator','administrator@your.domain','infoglue',1,'2010-01-01 12:00:00'),('anonymous','anonymous','Anonymous','User','anonymous@infoglue.org','infoglue',1,'2010-01-01 12:00:00');
/*!40000 ALTER TABLE `cmSystemUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSystemUserGroup`
--

DROP TABLE IF EXISTS `cmSystemUserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSystemUserGroup` (
  `userName` varchar(150) NOT NULL DEFAULT '',
  `groupName` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`userName`,`groupName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSystemUserGroup`
--

LOCK TABLES `cmSystemUserGroup` WRITE;
/*!40000 ALTER TABLE `cmSystemUserGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmSystemUserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmSystemUserRole`
--

DROP TABLE IF EXISTS `cmSystemUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmSystemUserRole` (
  `userName` varchar(100) NOT NULL,
  `roleName` varchar(200) NOT NULL,
  PRIMARY KEY (`userName`,`roleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmSystemUserRole`
--

LOCK TABLES `cmSystemUserRole` WRITE;
/*!40000 ALTER TABLE `cmSystemUserRole` DISABLE KEYS */;
INSERT INTO `cmSystemUserRole` VALUES ('administrator','administrators'),('administrator','cmsUser'),('anonymous','anonymous');
/*!40000 ALTER TABLE `cmSystemUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmTransactionHistory`
--

DROP TABLE IF EXISTS `cmTransactionHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmTransactionHistory` (
  `transactionHistoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transactionDateTime` datetime NOT NULL DEFAULT '1970-01-01 12:00:00',
  `transactionTypeId` int(11) NOT NULL DEFAULT '0',
  `transactionObjectId` text NOT NULL,
  `transactionObjectName` text NOT NULL,
  `systemUserName` text NOT NULL,
  PRIMARY KEY (`transactionHistoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmTransactionHistory`
--

LOCK TABLES `cmTransactionHistory` WRITE;
/*!40000 ALTER TABLE `cmTransactionHistory` DISABLE KEYS */;
INSERT INTO `cmTransactionHistory` VALUES (1,'Server down!: Got wrong answer','2016-03-05 13:28:09',304,'n/a','http://127.0.0.1:8080/infoglueDeliverWorking','SYSTEM'),(2,'Server down!: Got wrong answer','2016-03-05 13:28:09',304,'n/a','http://127.0.0.1:8080/infoglueDeliverLive','SYSTEM'),(3,'Login success:','2016-03-05 13:28:24',200,'root','name','root'),(4,'Server down!: Got wrong answer','2016-03-05 13:28:39',304,'n/a','http://127.0.0.1:8080/infoglueDeliverWorking','SYSTEM'),(5,'Server down!: Got wrong answer','2016-03-05 13:28:39',304,'n/a','http://127.0.0.1:8080/infoglueDeliverLive','SYSTEM'),(6,'Server down!: Got wrong answer','2016-03-05 13:29:09',304,'n/a','http://127.0.0.1:8080/infoglueDeliverWorking','SYSTEM'),(7,'Server down!: Got wrong answer','2016-03-05 13:29:09',304,'n/a','http://127.0.0.1:8080/infoglueDeliverLive','SYSTEM');
/*!40000 ALTER TABLE `cmTransactionHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmUserContentTypeDefinition`
--

DROP TABLE IF EXISTS `cmUserContentTypeDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmUserContentTypeDefinition` (
  `userContentTypeDefinitionId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userContentTypeDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmUserContentTypeDefinition`
--

LOCK TABLES `cmUserContentTypeDefinition` WRITE;
/*!40000 ALTER TABLE `cmUserContentTypeDefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmUserContentTypeDefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmUserProperties`
--

DROP TABLE IF EXISTS `cmUserProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmUserProperties` (
  `userPropertiesId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` text NOT NULL,
  `contentTypeDefinitionId` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `languageId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userPropertiesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmUserProperties`
--

LOCK TABLES `cmUserProperties` WRITE;
/*!40000 ALTER TABLE `cmUserProperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmUserProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmUserPropertiesDigitalAsset`
--

DROP TABLE IF EXISTS `cmUserPropertiesDigitalAsset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmUserPropertiesDigitalAsset` (
  `userPropertiesDigitalAssetId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userPropertiesId` int(11) unsigned NOT NULL DEFAULT '0',
  `digitalAssetId` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userPropertiesDigitalAssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmUserPropertiesDigitalAsset`
--

LOCK TABLES `cmUserPropertiesDigitalAsset` WRITE;
/*!40000 ALTER TABLE `cmUserPropertiesDigitalAsset` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmUserPropertiesDigitalAsset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmWorkflowDefinition`
--

DROP TABLE IF EXISTS `cmWorkflowDefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmWorkflowDefinition` (
  `workflowDefinitionId` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`workflowDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmWorkflowDefinition`
--

LOCK TABLES `cmWorkflowDefinition` WRITE;
/*!40000 ALTER TABLE `cmWorkflowDefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmWorkflowDefinition` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-05 13:29:23
