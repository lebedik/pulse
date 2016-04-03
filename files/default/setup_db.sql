DROP TABLE IF EXISTS `AbstractAttribute`;
CREATE TABLE `AbstractAttribute` (
  `required` bit(1) NOT NULL,
  `systemAttribute` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK69A3207AA6741773` (`id`),
  CONSTRAINT `FK69A3207AA6741773` FOREIGN KEY (`id`) REFERENCES `Node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractAttribute` WRITE;
INSERT INTO `AbstractAttribute` VALUES ('\0','',20),('\0','',21),('\0','',22),('\0','',23),('\0','',24),('\0','',25);
UNLOCK TABLES;
DROP TABLE IF EXISTS `AbstractQuestion`;
CREATE TABLE `AbstractQuestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isAllowBlank` bit(1) NOT NULL,
  `questionText` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractQuestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `AbstractRegistryNode`;
CREATE TABLE `AbstractRegistryNode` (
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `id` bigint(20) NOT NULL,
  `bundle_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB9E41411AF247EF` (`bundle_id`),
  KEY `FKB9E4141A6741773` (`id`),
  CONSTRAINT `FKB9E41411AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`),
  CONSTRAINT `FKB9E4141A6741773` FOREIGN KEY (`id`) REFERENCES `Node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractRegistryNode` WRITE;
INSERT INTO `AbstractRegistryNode` VALUES ('CMS',4,2),('en_US',5,2),('fr_FR',6,2),('de_DE',7,2),('Store',8,1),('en_US',9,1),('fr_FR',10,1),('de_DE',11,1),('Core',12,3),('en_US',13,3),('fr_FR',14,3),('de_DE',15,3),('Shop',16,6),('en_US',17,6),('fr_FR',18,6),('de_DE',19,6),('Pictures',26,2),('pics',28,2),('Coffee',37,2),('Have a good day',38,2),('Nature',39,2),('Ocean',40,2);
UNLOCK TABLES;
DROP TABLE IF EXISTS `AbstractTypedAnswer`;
CREATE TABLE `AbstractTypedAnswer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isValid` bit(1) NOT NULL,
  `questionId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractTypedAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `AbstractTypedCheck`;
CREATE TABLE `AbstractTypedCheck` (
  `DTYPE` varchar(31) COLLATE utf8_bin NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `regex` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractTypedCheck` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `AbstractValue`;
CREATE TABLE `AbstractValue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKB7F9A64F96E83A86` (`user_id`),
  CONSTRAINT `FKB7F9A64F96E83A86` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AbstractValue` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Attachment`;
CREATE TABLE `Attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin,
  `file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1C93543713BFC43` (`file_id`),
  CONSTRAINT `FK1C93543713BFC43` FOREIGN KEY (`file_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Attachment` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `AttributeRegistry`;
CREATE TABLE `AttributeRegistry` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AttributeRegistry` WRITE;
INSERT INTO `AttributeRegistry` VALUES (1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `AttributeRegistry_BundleAttribute`;
CREATE TABLE `AttributeRegistry_BundleAttribute` (
  `AttributeRegistry_id` bigint(20) NOT NULL,
  `rootNodes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`AttributeRegistry_id`,`rootNodes_id`),
  UNIQUE KEY `rootNodes_id` (`rootNodes_id`),
  KEY `FK33956AB4CB048D5A` (`rootNodes_id`),
  KEY `FK33956AB4AEA846CF` (`AttributeRegistry_id`),
  CONSTRAINT `FK33956AB4AEA846CF` FOREIGN KEY (`AttributeRegistry_id`) REFERENCES `AttributeRegistry` (`id`),
  CONSTRAINT `FK33956AB4CB048D5A` FOREIGN KEY (`rootNodes_id`) REFERENCES `BundleAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AttributeRegistry_BundleAttribute` WRITE;
INSERT INTO `AttributeRegistry_BundleAttribute` VALUES (1,20),(1,21),(1,22),(1,23),(1,24),(1,25);
UNLOCK TABLES;
DROP TABLE IF EXISTS `AverageTimePerVisitAggregation`;
CREATE TABLE `AverageTimePerVisitAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `time` double NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK109C450A8E487982` (`statisticsServer_id`),
  CONSTRAINT `FK109C450A8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `AverageTimePerVisitAggregation` WRITE;
INSERT INTO `AverageTimePerVisitAggregation` VALUES (1,1459382399999,1459296000000,2,268550.5,1),(2,1459468799999,1459382400000,2,40108,1),(3,1459555199999,1459468800000,3,86791,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `BooleanAttribute`;
CREATE TABLE `BooleanAttribute` (
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8FB5CF7465F7CF3D` (`check_id`),
  KEY `FK8FB5CF748721794A` (`id`),
  CONSTRAINT `FK8FB5CF7465F7CF3D` FOREIGN KEY (`check_id`) REFERENCES `AbstractTypedCheck` (`id`),
  CONSTRAINT `FK8FB5CF748721794A` FOREIGN KEY (`id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `BooleanAttribute` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `BooleanValue`;
CREATE TABLE `BooleanValue` (
  `value` bit(1) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB5EE2491174219F` (`id`),
  KEY `FKCB5EE24917D2ABD` (`attribute_id`),
  CONSTRAINT `FKCB5EE2491174219F` FOREIGN KEY (`id`) REFERENCES `AbstractValue` (`id`),
  CONSTRAINT `FKCB5EE24917D2ABD` FOREIGN KEY (`attribute_id`) REFERENCES `BooleanAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `BooleanValue` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Bundle`;
CREATE TABLE `Bundle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Bundle` WRITE;
INSERT INTO `Bundle` VALUES (2,'CMS'),(3,'Core'),(6,'Shop'),(4,'Statistics'),(1,'Store'),(5,'Survey');
UNLOCK TABLES;
DROP TABLE IF EXISTS `BundleAttribute`;
CREATE TABLE `BundleAttribute` (
  `id` bigint(20) NOT NULL,
  `bundle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8C4EC41A1AF247EF` (`bundle_id`),
  KEY `FK8C4EC41A8721794A` (`id`),
  CONSTRAINT `FK8C4EC41A1AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`),
  CONSTRAINT `FK8C4EC41A8721794A` FOREIGN KEY (`id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `BundleAttribute` WRITE;
INSERT INTO `BundleAttribute` VALUES (21,1),(20,2),(24,3),(22,4),(23,5),(25,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CMSContent`;
CREATE TABLE `CMSContent` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD1BF5710B3E279CF` (`id`),
  CONSTRAINT `FKD1BF5710B3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CMSContent` WRITE;
INSERT INTO `CMSContent` VALUES ('',NULL,NULL,'pics','<body><p> q</p></body>\r\n',NULL,2),('',NULL,NULL,'pictures','<body><p>Have a good day!</p><p><img src=\"http://www.coffeearea.org/wp-content/uploads/2014/04/how-to-store-coffee-beans.jpg\" alt=\"\" /></p><p> </p></body>\r\n',NULL,5),('',NULL,NULL,'ocean','<body><p> Nature</p><p><img src=\"https://pixabay.com/static/uploads/photo/2016/02/05/22/00/melbourne-1182174_960_720.jpg\" alt=\"\" /></p></body>\r\n',NULL,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ChangeEmailRequest`;
CREATE TABLE `ChangeEmailRequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creationTime` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK9558534396E83A86` (`user_id`),
  CONSTRAINT `FK9558534396E83A86` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ChangeEmailRequest` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ChangePasswordRequest`;
CREATE TABLE `ChangePasswordRequest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creationTime` datetime NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FKE14BD98496E83A86` (`user_id`),
  CONSTRAINT `FKE14BD98496E83A86` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ChangePasswordRequest` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CommandBuilder`;
CREATE TABLE `CommandBuilder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sitemapNodeId` bigint(20) DEFAULT NULL,
  `bundle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7E0CB9F01AF247EF` (`bundle_id`),
  CONSTRAINT `FK7E0CB9F01AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CommandBuilder` WRITE;
INSERT INTO `CommandBuilder` VALUES (4,'displayCMS',NULL,NULL,2);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CommandBuilder_Parameter`;
CREATE TABLE `CommandBuilder_Parameter` (
  `CommandBuilder_id` bigint(20) NOT NULL,
  `parameters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CommandBuilder_id`,`parameters_id`),
  KEY `FKCDD2DBFA70B91909` (`CommandBuilder_id`),
  KEY `FKCDD2DBFA9D7246A` (`parameters_id`),
  CONSTRAINT `FKCDD2DBFA70B91909` FOREIGN KEY (`CommandBuilder_id`) REFERENCES `CommandBuilder` (`id`),
  CONSTRAINT `FKCDD2DBFA9D7246A` FOREIGN KEY (`parameters_id`) REFERENCES `Parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CommandBuilder_Parameter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CommandMatcher`;
CREATE TABLE `CommandMatcher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sitemapNodeId` bigint(20) DEFAULT NULL,
  `bundle_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA26753871AF247EF` (`bundle_id`),
  KEY `FKA26753871BAB9B06` (`permission_id`),
  CONSTRAINT `FKA26753871AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`),
  CONSTRAINT `FKA26753871BAB9B06` FOREIGN KEY (`permission_id`) REFERENCES `Permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=632 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CommandMatcher` WRITE;
INSERT INTO `CommandMatcher` VALUES (1,'displayStore',NULL,NULL,1,1),(2,'removeReferenceDuration',NULL,NULL,1,2),(3,'initSummaryEditor',NULL,NULL,1,3),(4,'saveSummary',NULL,NULL,1,2),(5,'loadSummary',NULL,NULL,1,3),(6,'initContentLocalizationMap',NULL,NULL,1,4),(7,'contentLocalizationMapAdd',NULL,NULL,1,5),(8,'contentLocalizationMapRemove',NULL,NULL,1,5),(9,'loadSitemapNodesForContent',NULL,NULL,1,3),(10,'loadAttachmentsForContent',NULL,NULL,1,3),(11,'addAttachmentToContent',NULL,NULL,1,2),(12,'editAttachmentOfContent',NULL,NULL,1,2),(13,'removeAttachmentFromContent',NULL,NULL,1,2),(14,'initAttachmentDescriptionEditor',NULL,NULL,1,2),(15,'loadAttachmentDescription',NULL,NULL,1,2),(16,'saveAttachmentDescriptionEditor',NULL,NULL,1,2),(17,'initFileBrowserForAttachmentsForContent',NULL,NULL,1,2),(18,'initReferenceDurationEditor',NULL,NULL,1,2),(19,'saveContentGroup',NULL,NULL,1,6),(20,'copyContentGroup',NULL,NULL,1,6),(21,'saveContentGroupDescription',NULL,NULL,1,6),(22,'loadContentGroupDescription',NULL,NULL,1,6),(23,'initContentGroupDescriptionEditor',NULL,NULL,1,6),(24,'initContentGroupEditor',NULL,NULL,1,6),(25,'removeReferenceDuration',NULL,NULL,1,7),(26,'initSummaryEditor',NULL,NULL,1,8),(27,'saveSummary',NULL,NULL,1,7),(28,'loadSummary',NULL,NULL,1,8),(29,'initContentLocalizationMap',NULL,NULL,1,9),(30,'contentLocalizationMapAdd',NULL,NULL,1,10),(31,'contentLocalizationMapRemove',NULL,NULL,1,10),(32,'loadSitemapNodesForContent',NULL,NULL,1,8),(33,'loadAttachmentsForContent',NULL,NULL,1,8),(34,'addAttachmentToContent',NULL,NULL,1,7),(35,'editAttachmentOfContent',NULL,NULL,1,7),(36,'removeAttachmentFromContent',NULL,NULL,1,7),(37,'initAttachmentDescriptionEditor',NULL,NULL,1,7),(38,'loadAttachmentDescription',NULL,NULL,1,7),(39,'saveAttachmentDescriptionEditor',NULL,NULL,1,7),(40,'initFileBrowserForAttachmentsForContent',NULL,NULL,1,7),(41,'initReferenceDurationEditor',NULL,NULL,1,7),(42,'saveStoreContent',NULL,NULL,1,11),(43,'initVariantEditor',NULL,NULL,1,11),(44,'createStoreVariant',NULL,NULL,1,11),(45,'createStoreSubVariant',NULL,NULL,1,11),(46,'saveDescription',NULL,NULL,1,11),(47,'loadDescription',NULL,NULL,1,11),(48,'copyStoreContent',NULL,NULL,1,11),(49,'removeAllVariants',NULL,NULL,1,11),(50,'removeVariant',NULL,NULL,1,11),(51,'removeSubVariant',NULL,NULL,1,11),(52,'loadVariantOrOrderCode',NULL,NULL,1,11),(53,'loadVariantOrOrderCodeSubVariant',NULL,NULL,1,11),(54,'initVariantDescriptionEditor',NULL,NULL,1,11),(55,'saveVariantDescription',NULL,NULL,1,11),(56,'loadVariantDescription',NULL,NULL,1,11),(57,'initVariantSummaryEditor',NULL,NULL,1,11),(58,'initDescriptionEditor',NULL,NULL,1,11),(59,'saveVariantSummary',NULL,NULL,1,11),(60,'loadVariantSummary',NULL,NULL,1,11),(61,'initEditor',NULL,NULL,1,11),(62,'removeReferenceDuration',NULL,NULL,1,12),(63,'initSummaryEditor',NULL,NULL,1,13),(64,'saveSummary',NULL,NULL,1,12),(65,'loadSummary',NULL,NULL,1,13),(66,'initContentLocalizationMap',NULL,NULL,1,14),(67,'contentLocalizationMapAdd',NULL,NULL,1,15),(68,'contentLocalizationMapRemove',NULL,NULL,1,15),(69,'loadSitemapNodesForContent',NULL,NULL,1,13),(70,'loadAttachmentsForContent',NULL,NULL,1,13),(71,'addAttachmentToContent',NULL,NULL,1,12),(72,'editAttachmentOfContent',NULL,NULL,1,12),(73,'removeAttachmentFromContent',NULL,NULL,1,12),(74,'initAttachmentDescriptionEditor',NULL,NULL,1,12),(75,'loadAttachmentDescription',NULL,NULL,1,12),(76,'saveAttachmentDescriptionEditor',NULL,NULL,1,12),(77,'initFileBrowserForAttachmentsForContent',NULL,NULL,1,12),(78,'initReferenceDurationEditor',NULL,NULL,1,12),(79,'removeImageGroup',NULL,NULL,1,16),(80,'removeImageGroupVariant',NULL,NULL,1,16),(81,'changeImageGroupImage',NULL,NULL,1,16),(82,'changeImageGroupImageVariant',NULL,NULL,1,16),(83,'renameImageGroup',NULL,NULL,1,16),(84,'saveNewImageGroup',NULL,NULL,1,16),(85,'createNewImageGroup',NULL,NULL,1,16),(86,'saveNewImageGroupVariant',NULL,NULL,1,16),(87,'setMainImageGroup',NULL,NULL,1,16),(88,'setMainImageGroupVariant',NULL,NULL,1,16),(89,'renameImageGroupVariant',NULL,NULL,1,16),(90,'loadImageGroup',NULL,NULL,1,16),(91,'loadImageGroupVariant',NULL,NULL,1,16),(92,'contentRegistryCreate',NULL,NULL,1,17),(93,'createStoreContent',NULL,NULL,1,17),(94,'moveRegistryLocaleNode',NULL,NULL,1,17),(95,'getContentRegistryIdPathContent',NULL,NULL,1,17),(96,'deleteAbstractContentNode',NULL,NULL,1,17),(97,'renameRegistryLocaleNode',NULL,NULL,1,17),(98,'deleteRegistryLocaleNode',NULL,NULL,1,17),(99,'createContentFolderNode',NULL,NULL,1,17),(100,'createContentGroup',NULL,NULL,1,17),(101,'contentRegistryTreeInit',NULL,NULL,1,17),(102,'browseContentRegistrySelect',NULL,NULL,1,17),(103,'browseContentRegistryEdit',NULL,NULL,1,17),(104,'displayCMS',NULL,NULL,2,18),(105,'sendMail',NULL,NULL,2,19),(106,'processForm',NULL,NULL,2,20),(107,'removeReferenceDuration',NULL,NULL,2,21),(108,'initSummaryEditor',NULL,NULL,2,22),(109,'saveSummary',NULL,NULL,2,21),(110,'loadSummary',NULL,NULL,2,22),(111,'initContentLocalizationMap',NULL,NULL,2,23),(112,'contentLocalizationMapAdd',NULL,NULL,2,24),(113,'contentLocalizationMapRemove',NULL,NULL,2,24),(114,'loadSitemapNodesForContent',NULL,NULL,2,22),(115,'loadAttachmentsForContent',NULL,NULL,2,22),(116,'addAttachmentToContent',NULL,NULL,2,21),(117,'editAttachmentOfContent',NULL,NULL,2,21),(118,'removeAttachmentFromContent',NULL,NULL,2,21),(119,'initAttachmentDescriptionEditor',NULL,NULL,2,21),(120,'loadAttachmentDescription',NULL,NULL,2,21),(121,'saveAttachmentDescriptionEditor',NULL,NULL,2,21),(122,'initFileBrowserForAttachmentsForContent',NULL,NULL,2,21),(123,'initReferenceDurationEditor',NULL,NULL,2,21),(124,'saveContentGroup',NULL,NULL,2,25),(125,'copyContentGroup',NULL,NULL,2,25),(126,'saveContentGroupDescription',NULL,NULL,2,25),(127,'loadContentGroupDescription',NULL,NULL,2,25),(128,'initContentGroupDescriptionEditor',NULL,NULL,2,25),(129,'initContentGroupEditor',NULL,NULL,2,25),(130,'removeReferenceDuration',NULL,NULL,2,26),(131,'initSummaryEditor',NULL,NULL,2,27),(132,'saveSummary',NULL,NULL,2,26),(133,'loadSummary',NULL,NULL,2,27),(134,'initContentLocalizationMap',NULL,NULL,2,28),(135,'contentLocalizationMapAdd',NULL,NULL,2,29),(136,'contentLocalizationMapRemove',NULL,NULL,2,29),(137,'loadSitemapNodesForContent',NULL,NULL,2,27),(138,'loadAttachmentsForContent',NULL,NULL,2,27),(139,'addAttachmentToContent',NULL,NULL,2,26),(140,'editAttachmentOfContent',NULL,NULL,2,26),(141,'removeAttachmentFromContent',NULL,NULL,2,26),(142,'initAttachmentDescriptionEditor',NULL,NULL,2,26),(143,'loadAttachmentDescription',NULL,NULL,2,26),(144,'saveAttachmentDescriptionEditor',NULL,NULL,2,26),(145,'initFileBrowserForAttachmentsForContent',NULL,NULL,2,26),(146,'initReferenceDurationEditor',NULL,NULL,2,26),(147,'copyContent',NULL,NULL,2,30),(148,'initEditor',NULL,NULL,2,31),(149,'saveContent',NULL,NULL,2,30),(150,'loadPages',NULL,NULL,2,31),(151,'pageToSummary',NULL,NULL,2,30),(152,'removeReferenceDuration',NULL,NULL,2,32),(153,'initSummaryEditor',NULL,NULL,2,33),(154,'saveSummary',NULL,NULL,2,32),(155,'loadSummary',NULL,NULL,2,33),(156,'initContentLocalizationMap',NULL,NULL,2,34),(157,'contentLocalizationMapAdd',NULL,NULL,2,35),(158,'contentLocalizationMapRemove',NULL,NULL,2,35),(159,'loadSitemapNodesForContent',NULL,NULL,2,33),(160,'loadAttachmentsForContent',NULL,NULL,2,33),(161,'addAttachmentToContent',NULL,NULL,2,32),(162,'editAttachmentOfContent',NULL,NULL,2,32),(163,'removeAttachmentFromContent',NULL,NULL,2,32),(164,'initAttachmentDescriptionEditor',NULL,NULL,2,32),(165,'loadAttachmentDescription',NULL,NULL,2,32),(166,'saveAttachmentDescriptionEditor',NULL,NULL,2,32),(167,'initFileBrowserForAttachmentsForContent',NULL,NULL,2,32),(168,'initReferenceDurationEditor',NULL,NULL,2,32),(169,'initPageEditor',NULL,NULL,2,36),(170,'savePage',NULL,NULL,2,37),(171,'deletePage',NULL,NULL,2,37),(172,'loadPage',NULL,NULL,2,36),(173,'contentRegistryCreate',NULL,NULL,2,38),(174,'createCMSContent',NULL,NULL,2,38),(175,'moveRegistryLocaleNode',NULL,NULL,2,38),(176,'getContentRegistryIdPathContent',NULL,NULL,2,38),(177,'deleteAbstractContentNode',NULL,NULL,2,38),(178,'renameRegistryLocaleNode',NULL,NULL,2,38),(179,'deleteRegistryLocaleNode',NULL,NULL,2,38),(180,'createContentFolderNode',NULL,NULL,2,38),(181,'createContentGroup',NULL,NULL,2,38),(182,'contentRegistryTreeInit',NULL,NULL,2,38),(183,'browseContentRegistrySelect',NULL,NULL,2,38),(184,'browseContentRegistryEdit',NULL,NULL,2,38),(185,'searchSuggestions',NULL,NULL,3,39),(186,'homepage',NULL,NULL,3,40),(187,'findLocalization',NULL,NULL,3,41),(188,'getUploadProgress',NULL,NULL,3,42),(189,'displayCore',NULL,NULL,3,43),(190,'displayURLContent',NULL,NULL,3,44),(191,'filterGetCalendarSheetAJAX',NULL,NULL,3,45),(192,'displayFilter',NULL,NULL,3,45),(193,'displayFilterAJAX',NULL,NULL,3,45),(194,'signUp',NULL,NULL,3,46),(195,'signUpActivate',NULL,NULL,3,46),(196,'signUpResetPassword',NULL,NULL,3,47),(197,'resetPassword',NULL,NULL,3,47),(198,'getFullSitemap',NULL,NULL,3,48),(199,'searchSite',NULL,NULL,3,49),(200,'initAdvancedSearch',NULL,NULL,3,50),(201,'saveUserSelfEdit',NULL,NULL,3,51),(202,'initUserSelfEdit',NULL,NULL,3,52),(203,'userChangePassword',NULL,NULL,3,53),(204,'userChangeEmail',NULL,NULL,3,54),(205,'saveEmailChange',NULL,NULL,3,55),(206,'browseFCKEditor',NULL,NULL,3,56),(207,'initWebsiteAdmin',NULL,NULL,3,57),(208,'status',NULL,NULL,3,58),(209,'accessControlInit',NULL,NULL,3,59),(210,'createUserEditor',NULL,NULL,3,60),(211,'initUserEditor',NULL,NULL,3,61),(212,'loadUserOverviewGrid',NULL,NULL,3,62),(213,'deleteUserEditor',NULL,NULL,3,63),(214,'userOverviewInit',NULL,NULL,3,64),(215,'saveUserEditor',NULL,NULL,3,65),(216,'toggleStateUserEditor',NULL,NULL,3,66),(217,'changePasswordUserEditor',NULL,NULL,3,67),(218,'loadRolesUserEditor',NULL,NULL,3,68),(219,'loadGroupsUserEditor',NULL,NULL,3,69),(220,'loadPermissionsUserEditor',NULL,NULL,3,70),(221,'loadAttributeUserEditor',NULL,NULL,3,71),(222,'createRoleEditor',NULL,NULL,3,72),(223,'initRoleEditor',NULL,NULL,3,73),(224,'loadRoleOverviewGrid',NULL,NULL,3,74),(225,'roleOverviewInit',NULL,NULL,3,75),(226,'deleteRoleEditor',NULL,NULL,3,76),(227,'loadGroupsRoleEditor',NULL,NULL,3,77),(228,'loadPermissionsRoleEditor',NULL,NULL,3,78),(229,'saveRoleEditor',NULL,NULL,3,79),(230,'loadUsersRoleEditor',NULL,NULL,3,80),(231,'createUsergroupEditor',NULL,NULL,3,81),(232,'initUsergroupEditor',NULL,NULL,3,82),(233,'loadUsergroupOverviewGrid',NULL,NULL,3,83),(234,'usergroupOverviewInit',NULL,NULL,3,84),(235,'loadRolesUsergroupEditor',NULL,NULL,3,85),(236,'loadPermissionsUsergroupEditor',NULL,NULL,3,86),(237,'deleteUsergroupEditor',NULL,NULL,3,87),(238,'saveUsergroupEditor',NULL,NULL,3,88),(239,'loadUsersUsergroupEditor',NULL,NULL,3,89),(240,'initPermissionEditor',NULL,NULL,3,90),(241,'loadPermissionOverviewGrid',NULL,NULL,3,91),(242,'permissionOverviewInit',NULL,NULL,3,92),(243,'loadRolesPermissionEditor',NULL,NULL,3,93),(244,'loadGroupsPermissionEditor',NULL,NULL,3,94),(245,'createPermissionEditor',NULL,NULL,3,95),(246,'deletePermissionEditor',NULL,NULL,3,96),(247,'savePermissionEditor',NULL,NULL,3,97),(248,'loadUsersPermissionEditor',NULL,NULL,3,98),(249,'initCommandMatcherEditor',NULL,NULL,3,99),(250,'loadCommandMatchersOverviewGrid',NULL,NULL,3,100),(251,'loadParametersCommandMatcherEditor',NULL,NULL,3,101),(252,'createCommandMatcherEditor',NULL,NULL,3,102),(253,'deleteCommandMatcherEditor',NULL,NULL,3,103),(254,'saveCommandMatcherEditor',NULL,NULL,3,104),(255,'createAttributeRegistryEdit',NULL,NULL,3,105),(256,'saveAttributeRegistryEditor',NULL,NULL,3,105),(257,'deleteAttributeRegistryEdit',NULL,NULL,3,105),(258,'createAttributeAttributeRegistryEdit',NULL,NULL,3,105),(259,'moveAttributeRegistryEdit',NULL,NULL,3,105),(260,'editAttributeRegistryEdit',NULL,NULL,3,105),(261,'attributeRegistryTreeInit',NULL,NULL,3,106),(262,'loadAdminEditRolesAttributeRegistryEditor',NULL,NULL,3,105),(263,'loadSelfEditRolesAttributeRegistryEditor',NULL,NULL,3,105),(264,'loadSelfViewRolesAttributeRegistryEditor',NULL,NULL,3,105),(265,'loadTriggeredRolesAttributeRegistryEditor',NULL,NULL,3,105),(266,'setCheckAttributeRegistryEditor',NULL,NULL,3,105),(267,'loadAdminViewRolesAttributeRegistryEditor',NULL,NULL,3,105),(268,'loadChecksAttributeRegistryEditor',NULL,NULL,3,105),(269,'browseAttributeRegistryEdit',NULL,NULL,3,107),(270,'browseAttributeRegistrySelect',NULL,NULL,3,108),(271,'initSubEditorSelectionAttribute',NULL,NULL,3,109),(272,'vfsPermissionOverviewInit',NULL,NULL,3,110),(273,'previewVirtualFileSystemVFSPermissionEditor',NULL,NULL,3,111),(274,'initPermissionsPanelVFSPermissionEditor',NULL,NULL,3,112),(275,'loadReadPermissionsVFSPermissionEditor',NULL,NULL,3,113),(276,'loadWritePermissionsVFSPermissionEditor',NULL,NULL,3,114),(277,'savePermissionsPanelVFSPermissionEditor',NULL,NULL,3,115),(278,'previewVirtualFileSystem',NULL,NULL,3,116),(279,'browseVirtualFileSystem',NULL,NULL,3,116),(280,'uploadToVirtualFileSystem',NULL,NULL,3,116),(281,'initThemesEditor',NULL,NULL,3,117),(282,'removeTheme',NULL,NULL,3,117),(283,'applyTheme',NULL,NULL,3,117),(284,'loadTheme',NULL,NULL,3,117),(285,'sitemapNodeRemoveView',NULL,NULL,3,118),(286,'initViewEditor',NULL,NULL,3,118),(287,'initSitemapSectionTagEditor',NULL,NULL,3,119),(288,'saveViewEditor',NULL,NULL,3,120),(289,'viewEditorCreateNewView',NULL,NULL,3,118),(290,'loadRolesViewEditor',NULL,NULL,3,121),(291,'createSitemapSectionTag',NULL,NULL,3,122),(292,'deleteSitemapSectionTag',NULL,NULL,3,123),(293,'editSitemapSectionTag',NULL,NULL,3,124),(294,'initSitemapDurationEditor',NULL,NULL,3,125),(295,'removeSitemapDuration',NULL,NULL,3,126),(296,'applyStyle',NULL,NULL,3,127),(297,'contentRegistryCreate',NULL,NULL,3,128),(298,'createURLContent',NULL,NULL,3,128),(299,'createFileContent',NULL,NULL,3,128),(300,'createFilterContent',NULL,NULL,3,128),(301,'moveRegistryLocaleNode',NULL,NULL,3,128),(302,'getContentRegistryIdPathContent',NULL,NULL,3,128),(303,'deleteAbstractContentNode',NULL,NULL,3,128),(304,'renameRegistryLocaleNode',NULL,NULL,3,128),(305,'deleteRegistryLocaleNode',NULL,NULL,3,128),(306,'createContentFolderNode',NULL,NULL,3,128),(307,'createContentGroup',NULL,NULL,3,128),(308,'contentRegistryTreeInit',NULL,NULL,3,128),(309,'browseContentRegistrySelect',NULL,NULL,3,128),(310,'browseContentRegistryEdit',NULL,NULL,3,128),(311,'sitemapTreeGetChildren',NULL,NULL,3,129),(312,'sitemapTreeRenameNode',NULL,NULL,3,130),(313,'sitemapTreeCreateNode',NULL,NULL,3,130),(314,'sitemapTreeMoveNode',NULL,NULL,3,130),(315,'sitemapTreeDeleteNode',NULL,NULL,3,130),(316,'sitemapTreeLoadNode',NULL,NULL,3,129),(317,'sitemapTreeInit',NULL,NULL,3,129),(318,'sitemapTreeToggleNode',NULL,NULL,3,130),(319,'removeReferenceDuration',NULL,NULL,3,131),(320,'initSummaryEditor',NULL,NULL,3,132),(321,'saveSummary',NULL,NULL,3,131),(322,'loadSummary',NULL,NULL,3,132),(323,'initContentLocalizationMap',NULL,NULL,3,133),(324,'contentLocalizationMapAdd',NULL,NULL,3,134),(325,'contentLocalizationMapRemove',NULL,NULL,3,134),(326,'loadSitemapNodesForContent',NULL,NULL,3,132),(327,'loadAttachmentsForContent',NULL,NULL,3,132),(328,'addAttachmentToContent',NULL,NULL,3,131),(329,'editAttachmentOfContent',NULL,NULL,3,131),(330,'removeAttachmentFromContent',NULL,NULL,3,131),(331,'initAttachmentDescriptionEditor',NULL,NULL,3,131),(332,'loadAttachmentDescription',NULL,NULL,3,131),(333,'saveAttachmentDescriptionEditor',NULL,NULL,3,131),(334,'initFileBrowserForAttachmentsForContent',NULL,NULL,3,131),(335,'initReferenceDurationEditor',NULL,NULL,3,131),(336,'saveContentGroup',NULL,NULL,3,135),(337,'copyContentGroup',NULL,NULL,3,135),(338,'saveContentGroupDescription',NULL,NULL,3,135),(339,'loadContentGroupDescription',NULL,NULL,3,135),(340,'initContentGroupDescriptionEditor',NULL,NULL,3,135),(341,'initContentGroupEditor',NULL,NULL,3,135),(342,'removeReferenceDuration',NULL,NULL,3,136),(343,'initSummaryEditor',NULL,NULL,3,137),(344,'saveSummary',NULL,NULL,3,136),(345,'loadSummary',NULL,NULL,3,137),(346,'initContentLocalizationMap',NULL,NULL,3,138),(347,'contentLocalizationMapAdd',NULL,NULL,3,139),(348,'contentLocalizationMapRemove',NULL,NULL,3,139),(349,'loadSitemapNodesForContent',NULL,NULL,3,137),(350,'loadAttachmentsForContent',NULL,NULL,3,137),(351,'addAttachmentToContent',NULL,NULL,3,136),(352,'editAttachmentOfContent',NULL,NULL,3,136),(353,'removeAttachmentFromContent',NULL,NULL,3,136),(354,'initAttachmentDescriptionEditor',NULL,NULL,3,136),(355,'loadAttachmentDescription',NULL,NULL,3,136),(356,'saveAttachmentDescriptionEditor',NULL,NULL,3,136),(357,'initFileBrowserForAttachmentsForContent',NULL,NULL,3,136),(358,'initReferenceDurationEditor',NULL,NULL,3,136),(359,'saveFileContent',NULL,NULL,3,140),(360,'initFileContentEditor',NULL,NULL,3,140),(361,'initFileEditor',NULL,NULL,3,140),(362,'copyFileContent',NULL,NULL,3,140),(363,'removeReferenceDuration',NULL,NULL,3,141),(364,'initSummaryEditor',NULL,NULL,3,142),(365,'saveSummary',NULL,NULL,3,141),(366,'loadSummary',NULL,NULL,3,142),(367,'initContentLocalizationMap',NULL,NULL,3,143),(368,'contentLocalizationMapAdd',NULL,NULL,3,144),(369,'contentLocalizationMapRemove',NULL,NULL,3,144),(370,'loadSitemapNodesForContent',NULL,NULL,3,142),(371,'loadAttachmentsForContent',NULL,NULL,3,142),(372,'addAttachmentToContent',NULL,NULL,3,141),(373,'editAttachmentOfContent',NULL,NULL,3,141),(374,'removeAttachmentFromContent',NULL,NULL,3,141),(375,'initAttachmentDescriptionEditor',NULL,NULL,3,141),(376,'loadAttachmentDescription',NULL,NULL,3,141),(377,'saveAttachmentDescriptionEditor',NULL,NULL,3,141),(378,'initFileBrowserForAttachmentsForContent',NULL,NULL,3,141),(379,'initReferenceDurationEditor',NULL,NULL,3,141),(380,'saveURLContent',NULL,NULL,3,145),(381,'initURLContentEditor',NULL,NULL,3,145),(382,'copyURLContent',NULL,NULL,3,145),(383,'removeReferenceDuration',NULL,NULL,3,146),(384,'initSummaryEditor',NULL,NULL,3,147),(385,'saveSummary',NULL,NULL,3,146),(386,'loadSummary',NULL,NULL,3,147),(387,'initContentLocalizationMap',NULL,NULL,3,148),(388,'contentLocalizationMapAdd',NULL,NULL,3,149),(389,'contentLocalizationMapRemove',NULL,NULL,3,149),(390,'loadSitemapNodesForContent',NULL,NULL,3,147),(391,'loadAttachmentsForContent',NULL,NULL,3,147),(392,'addAttachmentToContent',NULL,NULL,3,146),(393,'editAttachmentOfContent',NULL,NULL,3,146),(394,'removeAttachmentFromContent',NULL,NULL,3,146),(395,'initAttachmentDescriptionEditor',NULL,NULL,3,146),(396,'loadAttachmentDescription',NULL,NULL,3,146),(397,'saveAttachmentDescriptionEditor',NULL,NULL,3,146),(398,'initFileBrowserForAttachmentsForContent',NULL,NULL,3,146),(399,'initReferenceDurationEditor',NULL,NULL,3,146),(400,'filterContentAddFilter',NULL,NULL,3,150),(401,'copyContent',NULL,NULL,3,150),(402,'initEditor',NULL,NULL,3,151),(403,'filterContentRemoveFilter',NULL,NULL,3,150),(404,'saveContent',NULL,NULL,3,150),(405,'filterContentLoadFilter',NULL,NULL,3,151),(406,'createFilter',NULL,NULL,3,152),(407,'filterAdminInit',NULL,NULL,3,152),(408,'filterOverviewInit',NULL,NULL,3,153),(409,'removeFilter',NULL,NULL,3,152),(410,'editFilter',NULL,NULL,3,153),(411,'loadFilters',NULL,NULL,3,153),(412,'saveFilter',NULL,NULL,3,152),(413,'createFilterCopy',NULL,NULL,3,153),(414,'initFilterRuleEditor',NULL,NULL,3,154),(415,'createFilterRuleProperty',NULL,NULL,3,155),(416,'removeFilterRuleProperty',NULL,NULL,3,155),(417,'saveFilterRule',NULL,NULL,3,156),(418,'moveFilterRuleProperty',NULL,NULL,3,155),(419,'createFilterRule',NULL,NULL,3,156),(420,'moveFilterRule',NULL,NULL,3,156),(421,'removeFilterRule',NULL,NULL,3,156),(422,'loadFilterRuleLocalizations',NULL,NULL,3,157),(423,'loadFilterRules',NULL,NULL,3,154),(424,'loadFilterRuleProperties',NULL,NULL,3,158),(425,'initFilterMatchEditor',NULL,NULL,3,159),(426,'createFilterMatch',NULL,NULL,3,160),(427,'removeFilterMatch',NULL,NULL,3,160),(428,'moveFilterMatch',NULL,NULL,3,160),(429,'loadFilterMatchesRules',NULL,NULL,3,159),(430,'loadPropertiesForRule',NULL,NULL,3,159),(431,'saveRulePropertiesForMatch',NULL,NULL,3,160),(432,'loadFilterMatches',NULL,NULL,3,159),(433,'initUtilWestPanel',NULL,NULL,3,161),(434,'initRepresentativesEditor',NULL,NULL,3,162),(435,'loadRepresentatives',NULL,NULL,3,163),(436,'loadRepresentative',NULL,NULL,3,164),(437,'deleteRepresentative',NULL,NULL,3,165),(438,'saveRepresentative',NULL,NULL,3,166),(439,'initRepresentativeEditor',NULL,NULL,3,167),(440,'initRetailersEditor',NULL,NULL,3,168),(441,'loadRetailers',NULL,NULL,3,169),(442,'loadRetailer',NULL,NULL,3,170),(443,'deleteRetailer',NULL,NULL,3,171),(444,'saveRetailer',NULL,NULL,3,172),(445,'exportRetailersCSV',NULL,NULL,3,173),(446,'exportRetailersXLSX',NULL,NULL,3,174),(447,'initRetailerEditor',NULL,NULL,3,175),(448,'hibernateStatisticsStatus',NULL,NULL,3,176),(449,'hibernateStatisticsEntities',NULL,NULL,3,177),(450,'hibernateStatisticsCache',NULL,NULL,3,178),(451,'hibernateStatisticsCollections',NULL,NULL,3,179),(452,'hibernateStatisticsToggle',NULL,NULL,3,180),(453,'hibernateStatisticsSummary',NULL,NULL,3,181),(454,'copyLocale',NULL,NULL,3,182),(455,'copySitemap',NULL,NULL,3,183),(456,'manipulateRolesOfSitemapNodes',NULL,NULL,3,184),(457,'changeVisiblityOfSitemapNodes',NULL,NULL,3,185),(458,'siteSearchRebuild',NULL,NULL,3,186),(459,'getThemeXML',NULL,NULL,3,187),(460,'record',NULL,NULL,4,188),(461,'createUserStatisticsPDF',NULL,NULL,4,189),(462,'loadYearChart',NULL,NULL,4,190),(463,'loadMonthChart',NULL,NULL,4,191),(464,'initUserStatistics',NULL,NULL,4,192),(465,'generatePDFReportGroupAnalysisView',NULL,NULL,4,193),(466,'initStatisticsGroupAnalysisView',NULL,NULL,4,194),(467,'loadTreeStatisticsGroupAnalysisView',NULL,NULL,4,195),(468,'removeNodeGroupAnalysisView',NULL,NULL,4,196),(469,'degunkChildLeafNodesGroupAnalysisView',NULL,NULL,4,197),(470,'generatePDFReportRefererAnalysisView',NULL,NULL,4,198),(471,'initStatisticsRefererAnalysisView',NULL,NULL,4,199),(472,'loadTreeStatisticsRefererAnalysisView',NULL,NULL,4,200),(473,'generatePDFReportOverView',NULL,NULL,4,201),(474,'loadOverViewCountryChart',NULL,NULL,4,202),(475,'loadOverViewDataChart',NULL,NULL,4,203),(476,'initStatisticsOverView',NULL,NULL,4,204),(477,'clearSessionDataOverView',NULL,NULL,4,205),(478,'generatePDFReportTechnicalInformationView',NULL,NULL,4,206),(479,'initStatisticsTechnicalInformationView',NULL,NULL,4,207),(480,'generatePDFReportTimeAnalysisView',NULL,NULL,4,208),(481,'loadTimeAnalysisChart',NULL,NULL,4,209),(482,'initStatisticsTimeAnalysisView',NULL,NULL,4,210),(483,'clearSessionDataTimeAnalysis',NULL,NULL,4,211),(484,'initStatisticsWestPanel',NULL,NULL,4,212),(485,'executeSurveyController',NULL,NULL,5,213),(486,'updateSurvey',NULL,NULL,5,214),(487,'createSurvey',NULL,NULL,5,215),(488,'removeSurvey',NULL,NULL,5,216),(489,'removeQuestionnaire',NULL,NULL,5,217),(490,'displayShop',NULL,NULL,6,218),(491,'updateCart',NULL,NULL,6,219),(492,'displayCart',NULL,NULL,6,219),(493,'removeCartPosition',NULL,NULL,6,219),(494,'addCartPosition',NULL,NULL,6,219),(495,'modifyCartPosition',NULL,NULL,6,219),(496,'getPrice',NULL,NULL,6,219),(497,'startCheckout',NULL,NULL,6,220),(498,'finishCheckout',NULL,NULL,6,221),(499,'cancelCheckout',NULL,NULL,6,222),(500,'getOrder',NULL,NULL,6,223),(501,'editDeliveryAddress',NULL,NULL,6,224),(502,'editBillingAddress',NULL,NULL,6,225),(503,'editDispatchData',NULL,NULL,6,226),(504,'editCustomer',NULL,NULL,6,227),(505,'capturePayment',NULL,NULL,6,228),(506,'editPaymentData',NULL,NULL,6,229),(507,'editOrderDetails',NULL,NULL,6,230),(508,'editOrder',NULL,NULL,6,231),(509,'authorizePayment',NULL,NULL,6,232),(510,'captureInvoicePayment',NULL,NULL,6,233),(511,'authorizeInvoicePayment',NULL,NULL,6,234),(512,'startPayPalPaymentCapture',NULL,NULL,6,235),(513,'cancelPayPalPayment',NULL,NULL,6,236),(514,'finishPayPalPaymentAuthorization',NULL,NULL,6,237),(515,'finishPayPalPaymentCaptureWithGiropay',NULL,NULL,6,238),(516,'startPayPalPaymentAuthorization',NULL,NULL,6,239),(517,'captureWirecardCCPayment',NULL,NULL,6,240),(518,'finishWirecardCCPaymentAuthorization',NULL,NULL,6,241),(519,'startWirecardCCPaymentAuthorization',NULL,NULL,6,242),(520,'captureWirecardEFTPayment',NULL,NULL,6,243),(521,'authorizeWirecardEFTPayment',NULL,NULL,6,244),(522,'removeReferenceDuration',NULL,NULL,6,245),(523,'initSummaryEditor',NULL,NULL,6,246),(524,'saveSummary',NULL,NULL,6,245),(525,'loadSummary',NULL,NULL,6,246),(526,'initContentLocalizationMap',NULL,NULL,6,247),(527,'contentLocalizationMapAdd',NULL,NULL,6,248),(528,'contentLocalizationMapRemove',NULL,NULL,6,248),(529,'loadSitemapNodesForContent',NULL,NULL,6,246),(530,'loadAttachmentsForContent',NULL,NULL,6,246),(531,'addAttachmentToContent',NULL,NULL,6,245),(532,'editAttachmentOfContent',NULL,NULL,6,245),(533,'removeAttachmentFromContent',NULL,NULL,6,245),(534,'initAttachmentDescriptionEditor',NULL,NULL,6,245),(535,'loadAttachmentDescription',NULL,NULL,6,245),(536,'saveAttachmentDescriptionEditor',NULL,NULL,6,245),(537,'initFileBrowserForAttachmentsForContent',NULL,NULL,6,245),(538,'initReferenceDurationEditor',NULL,NULL,6,245),(539,'saveContentGroup',NULL,NULL,6,249),(540,'copyContentGroup',NULL,NULL,6,249),(541,'saveContentGroupDescription',NULL,NULL,6,249),(542,'loadContentGroupDescription',NULL,NULL,6,249),(543,'initContentGroupDescriptionEditor',NULL,NULL,6,249),(544,'initContentGroupEditor',NULL,NULL,6,249),(545,'removeReferenceDuration',NULL,NULL,6,250),(546,'initSummaryEditor',NULL,NULL,6,251),(547,'saveSummary',NULL,NULL,6,250),(548,'loadSummary',NULL,NULL,6,251),(549,'initContentLocalizationMap',NULL,NULL,6,252),(550,'contentLocalizationMapAdd',NULL,NULL,6,253),(551,'contentLocalizationMapRemove',NULL,NULL,6,253),(552,'loadSitemapNodesForContent',NULL,NULL,6,251),(553,'loadAttachmentsForContent',NULL,NULL,6,251),(554,'addAttachmentToContent',NULL,NULL,6,250),(555,'editAttachmentOfContent',NULL,NULL,6,250),(556,'removeAttachmentFromContent',NULL,NULL,6,250),(557,'initAttachmentDescriptionEditor',NULL,NULL,6,250),(558,'loadAttachmentDescription',NULL,NULL,6,250),(559,'saveAttachmentDescriptionEditor',NULL,NULL,6,250),(560,'initFileBrowserForAttachmentsForContent',NULL,NULL,6,250),(561,'initReferenceDurationEditor',NULL,NULL,6,250),(562,'saveShopContent',NULL,NULL,6,254),(563,'copyShopContent',NULL,NULL,6,254),(564,'initVariantEditor',NULL,NULL,6,254),(565,'createShopVariant',NULL,NULL,6,254),(566,'createShopSubVariant',NULL,NULL,6,254),(567,'initPricesEditor',NULL,NULL,6,254),(568,'initPricesEditorVariant',NULL,NULL,6,254),(569,'loadPricesEditorGrid',NULL,NULL,6,254),(570,'loadPricesEditorGridVariant',NULL,NULL,6,254),(571,'loadPriceRoleEditor',NULL,NULL,6,254),(572,'loadPriceRoleEditorVariant',NULL,NULL,6,254),(573,'loadPriceRoles',NULL,NULL,6,254),(574,'savePriceRoles',NULL,NULL,6,254),(575,'savePriceRolesVariant',NULL,NULL,6,254),(576,'getPriceJSON',NULL,NULL,6,254),(577,'initEditor',NULL,NULL,6,254),(578,'saveDescription',NULL,NULL,6,255),(579,'loadDescription',NULL,NULL,6,255),(580,'copyStoreContent',NULL,NULL,6,255),(581,'removeAllVariants',NULL,NULL,6,255),(582,'removeVariant',NULL,NULL,6,255),(583,'removeSubVariant',NULL,NULL,6,255),(584,'loadVariantOrOrderCode',NULL,NULL,6,255),(585,'loadVariantOrOrderCodeSubVariant',NULL,NULL,6,255),(586,'initVariantDescriptionEditor',NULL,NULL,6,255),(587,'saveVariantDescription',NULL,NULL,6,255),(588,'loadVariantDescription',NULL,NULL,6,255),(589,'initVariantSummaryEditor',NULL,NULL,6,255),(590,'initDescriptionEditor',NULL,NULL,6,255),(591,'saveVariantSummary',NULL,NULL,6,255),(592,'loadVariantSummary',NULL,NULL,6,255),(593,'removeReferenceDuration',NULL,NULL,6,256),(594,'initSummaryEditor',NULL,NULL,6,257),(595,'saveSummary',NULL,NULL,6,256),(596,'loadSummary',NULL,NULL,6,257),(597,'initContentLocalizationMap',NULL,NULL,6,258),(598,'contentLocalizationMapAdd',NULL,NULL,6,259),(599,'contentLocalizationMapRemove',NULL,NULL,6,259),(600,'loadSitemapNodesForContent',NULL,NULL,6,257),(601,'loadAttachmentsForContent',NULL,NULL,6,257),(602,'addAttachmentToContent',NULL,NULL,6,256),(603,'editAttachmentOfContent',NULL,NULL,6,256),(604,'removeAttachmentFromContent',NULL,NULL,6,256),(605,'initAttachmentDescriptionEditor',NULL,NULL,6,256),(606,'loadAttachmentDescription',NULL,NULL,6,256),(607,'saveAttachmentDescriptionEditor',NULL,NULL,6,256),(608,'initFileBrowserForAttachmentsForContent',NULL,NULL,6,256),(609,'initReferenceDurationEditor',NULL,NULL,6,256),(610,'contentRegistryCreate',NULL,NULL,6,260),(611,'createShopContent',NULL,NULL,6,260),(612,'moveRegistryLocaleNode',NULL,NULL,6,260),(613,'getContentRegistryIdPathContent',NULL,NULL,6,260),(614,'deleteAbstractContentNode',NULL,NULL,6,260),(615,'renameRegistryLocaleNode',NULL,NULL,6,260),(616,'deleteRegistryLocaleNode',NULL,NULL,6,260),(617,'createContentFolderNode',NULL,NULL,6,260),(618,'createContentGroup',NULL,NULL,6,260),(619,'contentRegistryTreeInit',NULL,NULL,6,260),(620,'browseContentRegistrySelect',NULL,NULL,6,260),(621,'browseContentRegistryEdit',NULL,NULL,6,260),(622,'initTaxgroupsEditor',NULL,NULL,6,261),(623,'loadTaxgroupsEditor',NULL,NULL,6,261),(624,'deleteTaxgroupsEditor',NULL,NULL,6,261),(625,'saveShopSettings',NULL,NULL,6,261),(626,'initShopSettingsWestPanel',NULL,NULL,6,261),(627,'editShopSettings',NULL,NULL,6,261),(628,'initShopSettingsWestTree',NULL,NULL,6,261),(629,'createShopSettings',NULL,NULL,6,261),(630,'updateFromPriceList',NULL,NULL,6,262),(631,'getPriceList',NULL,NULL,6,263);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CommandMatcher_Parameter`;
CREATE TABLE `CommandMatcher_Parameter` (
  `CommandMatcher_id` bigint(20) NOT NULL,
  `parameters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CommandMatcher_id`,`parameters_id`),
  KEY `FK4B67A4D1A36381E6` (`CommandMatcher_id`),
  KEY `FK4B67A4D19D7246A` (`parameters_id`),
  CONSTRAINT `FK4B67A4D19D7246A` FOREIGN KEY (`parameters_id`) REFERENCES `Parameter` (`id`),
  CONSTRAINT `FK4B67A4D1A36381E6` FOREIGN KEY (`CommandMatcher_id`) REFERENCES `CommandMatcher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CommandMatcher_Parameter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Content`;
CREATE TABLE `Content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `lastModified` datetime NOT NULL,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `referenceDurationEnd` bigint(20) DEFAULT NULL,
  `referenceDurationStart` bigint(20) DEFAULT NULL,
  `bundle_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) NOT NULL,
  `lastModifier_id` bigint(20) NOT NULL,
  `localizationMap_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9BEFCC591AF247EF` (`bundle_id`),
  KEY `FK9BEFCC59D47C2F66` (`localizationMap_id`),
  KEY `FK9BEFCC59F1E43E85` (`creator_id`),
  KEY `FK9BEFCC59C607F384` (`lastModifier_id`),
  CONSTRAINT `FK9BEFCC591AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`),
  CONSTRAINT `FK9BEFCC59C607F384` FOREIGN KEY (`lastModifier_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FK9BEFCC59D47C2F66` FOREIGN KEY (`localizationMap_id`) REFERENCES `ContentLocalizationMap` (`id`),
  CONSTRAINT `FK9BEFCC59F1E43E85` FOREIGN KEY (`creator_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Content` WRITE;
INSERT INTO `Content` VALUES (2,'pics','2016-03-29 11:28:37','2016-03-30 16:08:32','en_US',NULL,NULL,2,1,1,2),(5,'Have a good day','2016-03-30 16:04:29','2016-03-30 16:08:48','en_US',NULL,NULL,2,1,1,5),(6,'Ocean','2016-03-31 09:18:26','2016-03-31 09:18:26','en_US',NULL,NULL,2,1,1,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentFolderNode`;
CREATE TABLE `ContentFolderNode` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49724C922BC0999` (`id`),
  CONSTRAINT `FK49724C922BC0999` FOREIGN KEY (`id`) REFERENCES `RegistryLocaleNode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentFolderNode` WRITE;
INSERT INTO `ContentFolderNode` VALUES (26),(37),(39);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentGroup`;
CREATE TABLE `ContentGroup` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3A0D09A6B3E279CF` (`id`),
  CONSTRAINT `FK3A0D09A6B3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentLocalizationMap`;
CREATE TABLE `ContentLocalizationMap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentLocalizationMap` WRITE;
INSERT INTO `ContentLocalizationMap` VALUES (2),(5),(6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentLocalizationMap_Content`;
CREATE TABLE `ContentLocalizationMap_Content` (
  `ContentLocalizationMap_id` bigint(20) NOT NULL,
  `map_id` bigint(20) NOT NULL,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ContentLocalizationMap_id`,`locale`),
  UNIQUE KEY `map_id` (`map_id`),
  KEY `FK4A2B84736DEB92` (`map_id`),
  KEY `FK4A2B84BED6979F` (`ContentLocalizationMap_id`),
  CONSTRAINT `FK4A2B84736DEB92` FOREIGN KEY (`map_id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK4A2B84BED6979F` FOREIGN KEY (`ContentLocalizationMap_id`) REFERENCES `ContentLocalizationMap` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentLocalizationMap_Content` WRITE;
INSERT INTO `ContentLocalizationMap_Content` VALUES (2,2,'en_US'),(5,5,'en_US'),(6,6,'en_US');
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentNode`;
CREATE TABLE `ContentNode` (
  `id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_id` (`content_id`),
  KEY `FK4C3519FB22BC0999` (`id`),
  KEY `FK4C3519FBC3A72B55` (`content_id`),
  CONSTRAINT `FK4C3519FB22BC0999` FOREIGN KEY (`id`) REFERENCES `RegistryLocaleNode` (`id`),
  CONSTRAINT `FK4C3519FBC3A72B55` FOREIGN KEY (`content_id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentNode` WRITE;
INSERT INTO `ContentNode` VALUES (28,2),(38,5),(40,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentRegistry`;
CREATE TABLE `ContentRegistry` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentRegistry` WRITE;
INSERT INTO `ContentRegistry` VALUES (1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ContentRegistry_RegistryBundleNode`;
CREATE TABLE `ContentRegistry_RegistryBundleNode` (
  `ContentRegistry_id` bigint(20) NOT NULL,
  `rootNodes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ContentRegistry_id`,`rootNodes_id`),
  UNIQUE KEY `rootNodes_id` (`rootNodes_id`),
  KEY `FK8D42F90AE4957F55` (`ContentRegistry_id`),
  KEY `FK8D42F90A80F5DEF1` (`rootNodes_id`),
  CONSTRAINT `FK8D42F90A80F5DEF1` FOREIGN KEY (`rootNodes_id`) REFERENCES `RegistryBundleNode` (`id`),
  CONSTRAINT `FK8D42F90AE4957F55` FOREIGN KEY (`ContentRegistry_id`) REFERENCES `ContentRegistry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ContentRegistry_RegistryBundleNode` WRITE;
INSERT INTO `ContentRegistry_RegistryBundleNode` VALUES (1,4),(1,8),(1,12),(1,16);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Content_Attachment`;
CREATE TABLE `Content_Attachment` (
  `Content_id` bigint(20) NOT NULL,
  `attachments_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Content_id`,`attachments_id`),
  UNIQUE KEY `attachments_id` (`attachments_id`),
  KEY `FK67E2BCE9C3A72B55` (`Content_id`),
  KEY `FK67E2BCE9F541BB12` (`attachments_id`),
  CONSTRAINT `FK67E2BCE9C3A72B55` FOREIGN KEY (`Content_id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK67E2BCE9F541BB12` FOREIGN KEY (`attachments_id`) REFERENCES `Attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Content_Attachment` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Content_VirtualFile`;
CREATE TABLE `Content_VirtualFile` (
  `content_id` bigint(20) NOT NULL,
  `virtualfile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`content_id`,`virtualfile_id`),
  KEY `FK855F2021C3A72B55` (`content_id`),
  KEY `FK855F2021EC6EEAD8` (`virtualfile_id`),
  CONSTRAINT `FK855F2021C3A72B55` FOREIGN KEY (`content_id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK855F2021EC6EEAD8` FOREIGN KEY (`virtualfile_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Content_VirtualFile` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `CountryHitCounter`;
CREATE TABLE `CountryHitCounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CountryHitCounter` WRITE;
INSERT INTO `CountryHitCounter` VALUES (1,5,'??'),(2,2,'??'),(3,8,'??'),(4,2,'??'),(5,3,'??'),(6,6,'??');
UNLOCK TABLES;
DROP TABLE IF EXISTS `CountryPerPIRecordAggregation`;
CREATE TABLE `CountryPerPIRecordAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3455F3B18E487982` (`statisticsServer_id`),
  CONSTRAINT `FK3455F3B18E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CountryPerPIRecordAggregation` WRITE;
INSERT INTO `CountryPerPIRecordAggregation` VALUES (1,1459382399999,1459296000000,1),(2,1459468799999,1459382400000,1),(3,1459555199999,1459468800000,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CountryPerPIRecordAggregation_CountryHitCounter`;
CREATE TABLE `CountryPerPIRecordAggregation_CountryHitCounter` (
  `CountryPerPIRecordAggregation_id` bigint(20) NOT NULL,
  `counters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CountryPerPIRecordAggregation_id`,`counters_id`),
  UNIQUE KEY `counters_id` (`counters_id`),
  KEY `FKA5BCE1F178A0770E` (`counters_id`),
  KEY `FKA5BCE1F1781C1D86` (`CountryPerPIRecordAggregation_id`),
  CONSTRAINT `FKA5BCE1F1781C1D86` FOREIGN KEY (`CountryPerPIRecordAggregation_id`) REFERENCES `CountryPerPIRecordAggregation` (`id`),
  CONSTRAINT `FKA5BCE1F178A0770E` FOREIGN KEY (`counters_id`) REFERENCES `CountryHitCounter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CountryPerPIRecordAggregation_CountryHitCounter` WRITE;
INSERT INTO `CountryPerPIRecordAggregation_CountryHitCounter` VALUES (1,1),(2,3),(3,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CountryPerVisitAggregation`;
CREATE TABLE `CountryPerVisitAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA3EDB87E8E487982` (`statisticsServer_id`),
  CONSTRAINT `FKA3EDB87E8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CountryPerVisitAggregation` WRITE;
INSERT INTO `CountryPerVisitAggregation` VALUES (1,1459382399999,1459296000000,1),(2,1459468799999,1459382400000,1),(3,1459555199999,1459468800000,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `CountryPerVisitAggregation_CountryHitCounter`;
CREATE TABLE `CountryPerVisitAggregation_CountryHitCounter` (
  `CountryPerVisitAggregation_id` bigint(20) NOT NULL,
  `counters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`CountryPerVisitAggregation_id`,`counters_id`),
  UNIQUE KEY `counters_id` (`counters_id`),
  KEY `FK21DBED7E78A0770E` (`counters_id`),
  KEY `FK21DBED7E357152CE` (`CountryPerVisitAggregation_id`),
  CONSTRAINT `FK21DBED7E357152CE` FOREIGN KEY (`CountryPerVisitAggregation_id`) REFERENCES `CountryPerVisitAggregation` (`id`),
  CONSTRAINT `FK21DBED7E78A0770E` FOREIGN KEY (`counters_id`) REFERENCES `CountryHitCounter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `CountryPerVisitAggregation_CountryHitCounter` WRITE;
INSERT INTO `CountryPerVisitAggregation_CountryHitCounter` VALUES (1,2),(2,4),(3,5);
UNLOCK TABLES;
DROP TABLE IF EXISTS `DeadProperty`;
CREATE TABLE `DeadProperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `namespaceURI` longtext COLLATE utf8_bin NOT NULL,
  `propName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `propertyXML` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `DeadProperty` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FileContent`;
CREATE TABLE `FileContent` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `indexFile` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD4D9B3D713BFC43` (`file_id`),
  KEY `FKD4D9B3DB3E279CF` (`id`),
  CONSTRAINT `FKD4D9B3D713BFC43` FOREIGN KEY (`file_id`) REFERENCES `VirtualFile` (`id`),
  CONSTRAINT `FKD4D9B3DB3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FileContent` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Filter`;
CREATE TABLE `Filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `referenceDurationFilter` bit(1) NOT NULL,
  `requireSitemapNode` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Filter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FilterContent`;
CREATE TABLE `FilterContent` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `filter_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3EA8D9C1B3E279CF` (`id`),
  KEY `FK3EA8D9C1CAAF3E2B` (`filter_id`),
  CONSTRAINT `FK3EA8D9C1B3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK3EA8D9C1CAAF3E2B` FOREIGN KEY (`filter_id`) REFERENCES `Filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FilterContent` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FilterMatches`;
CREATE TABLE `FilterMatches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentMap_id` bigint(20) NOT NULL,
  `filter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `filter_id` (`filter_id`,`contentMap_id`),
  KEY `FK38102E7B8487B546` (`contentMap_id`),
  KEY `FK38102E7BCAAF3E2B` (`filter_id`),
  CONSTRAINT `FK38102E7B8487B546` FOREIGN KEY (`contentMap_id`) REFERENCES `ContentLocalizationMap` (`id`),
  CONSTRAINT `FK38102E7BCAAF3E2B` FOREIGN KEY (`filter_id`) REFERENCES `Filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FilterMatches` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FilterMatches_FilterRuleProperty`;
CREATE TABLE `FilterMatches_FilterRuleProperty` (
  `FilterMatches_id` bigint(20) NOT NULL,
  `properties_id` bigint(20) NOT NULL,
  PRIMARY KEY (`FilterMatches_id`,`properties_id`),
  KEY `FKC2E0DCED403E3A21` (`properties_id`),
  KEY `FKC2E0DCED97B21B29` (`FilterMatches_id`),
  CONSTRAINT `FKC2E0DCED403E3A21` FOREIGN KEY (`properties_id`) REFERENCES `FilterRuleProperty` (`id`),
  CONSTRAINT `FKC2E0DCED97B21B29` FOREIGN KEY (`FilterMatches_id`) REFERENCES `FilterMatches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FilterMatches_FilterRuleProperty` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FilterRule`;
CREATE TABLE `FilterRule` (
  `id` bigint(20) NOT NULL,
  `filter_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A3F36B41571E611` (`id`),
  KEY `FK1A3F36B4CAAF3E2B` (`filter_id`),
  CONSTRAINT `FK1A3F36B41571E611` FOREIGN KEY (`id`) REFERENCES `Localized` (`id`),
  CONSTRAINT `FK1A3F36B4CAAF3E2B` FOREIGN KEY (`filter_id`) REFERENCES `Filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FilterRule` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FilterRuleProperty`;
CREATE TABLE `FilterRuleProperty` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE36F84A91571E611` (`id`),
  CONSTRAINT `FKE36F84A91571E611` FOREIGN KEY (`id`) REFERENCES `Localized` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `FilterRuleProperty` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Group` WRITE;
INSERT INTO `Group` VALUES (1,'~Store:ContentAdministrator',''),(2,'~Store:CoreAdministrator',''),(3,'~Store:StoreAdministrator',''),(4,'~Store:Admin-UI',''),(5,'~CMS:ContentAdministrator',''),(6,'~CMS:CoreAdministrator',''),(7,'~CMS:CMSAdministrator',''),(8,'~CMS:Admin-UI',''),(9,'~Core:Admin-UI',''),(10,'~Core:AccessControl:Administrator',''),(11,'~Core:AccessControl:UserEditor',''),(12,'~Core:AccessControl:RoleEditor',''),(13,'~Core:AccessControl:GroupEditor',''),(14,'~Core:AccessControl:PermissionEditor',''),(15,'~Core:AccessControl:CommandMatcherEditor',''),(16,'~Core:AttributeRegistryAdministrator',''),(17,'~Core:VFSPermissionAdministrator',''),(18,'~Core:Styling',''),(19,'~Core:ViewEditor',''),(20,'~Core:CoreAdministrator',''),(21,'~Core:SitemapEditor',''),(22,'~Core:SitemapViewer',''),(23,'~Core:ContentAdministrator',''),(24,'~Core:FilterContentEditor',''),(25,'~Core:FilterEditor',''),(26,'~Core:FilterMatchesEditor',''),(27,'~Core:FilterRuleEditor',''),(28,'~Core:FilterPropertyEditor',''),(29,'~Core:RepresentativeAdministrator',''),(30,'~Core:RetailerAdministrator',''),(31,'~Core:hibernateStatisicsUser',''),(32,'~Core:hibernateStatisicsManager',''),(33,'~Core:hibernateStatisticsUser',''),(34,'~Core:User',''),(35,'~Statistics:Admin.Report.User.Statistics',''),(36,'~Statistics:Admin.User.Statistics',''),(37,'~Statistics:Admin.Report.Site.Statistics',''),(38,'~Statistics:Admin.Site.Statistics',''),(39,'~Statistics:Admin.Site.Statistics.GroupAnalysisViewDegunk',''),(40,'~Shop:checkout',''),(41,'~Shop:ContentAdministrator',''),(42,'~Shop:CoreAdministrator',''),(43,'~Shop:ShopAdministrator',''),(44,'~Shop:StoreAdministrator',''),(45,'~Shop:Admin-UI','');
UNLOCK TABLES;
DROP TABLE IF EXISTS `Group_Permission`;
CREATE TABLE `Group_Permission` (
  `Group_id` bigint(20) NOT NULL,
  `permissions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Group_id`,`permissions_id`),
  KEY `FK7AC48FCF1B59F431` (`permissions_id`),
  KEY `FK7AC48FCF773F864E` (`Group_id`),
  CONSTRAINT `FK7AC48FCF1B59F431` FOREIGN KEY (`permissions_id`) REFERENCES `Permission` (`id`),
  CONSTRAINT `FK7AC48FCF773F864E` FOREIGN KEY (`Group_id`) REFERENCES `Group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Group_Permission` WRITE;
INSERT INTO `Group_Permission` VALUES (1,2),(1,3),(1,4),(1,5),(2,6),(1,7),(1,8),(1,9),(1,10),(3,11),(1,12),(1,13),(1,14),(1,15),(3,16),(2,17),(3,17),(4,17),(5,21),(5,22),(5,23),(5,24),(6,25),(5,26),(5,27),(5,28),(5,29),(7,30),(7,31),(5,32),(5,33),(5,34),(5,35),(7,36),(7,37),(6,38),(7,38),(8,38),(9,56),(9,57),(10,59),(10,60),(11,60),(10,61),(11,61),(10,62),(11,62),(10,63),(11,63),(10,64),(11,64),(10,65),(11,65),(10,66),(11,66),(10,67),(11,67),(10,68),(11,68),(10,69),(11,69),(10,70),(11,70),(10,71),(11,71),(10,72),(12,72),(10,73),(12,73),(10,74),(12,74),(10,75),(12,75),(10,76),(12,76),(10,77),(12,77),(10,78),(12,78),(10,79),(12,79),(10,80),(12,80),(10,81),(13,81),(10,82),(13,82),(10,83),(13,83),(10,84),(13,84),(10,85),(13,85),(10,86),(13,86),(10,87),(13,87),(10,88),(13,88),(10,89),(13,89),(10,90),(14,90),(10,91),(14,91),(10,92),(14,92),(10,93),(14,93),(10,94),(14,94),(10,95),(14,95),(10,96),(14,96),(10,97),(14,97),(10,98),(14,98),(10,99),(15,99),(10,100),(15,100),(10,101),(15,101),(10,102),(15,102),(10,103),(15,103),(10,104),(15,104),(16,105),(16,106),(16,107),(16,108),(16,109),(17,110),(17,111),(17,112),(17,113),(17,114),(17,115),(9,116),(18,117),(19,118),(19,119),(19,120),(19,121),(19,122),(19,123),(19,124),(19,125),(19,126),(18,127),(9,128),(20,128),(21,129),(22,129),(21,130),(23,131),(23,132),(23,133),(23,134),(20,135),(23,136),(23,137),(23,138),(23,139),(20,140),(23,141),(23,142),(23,143),(23,144),(20,145),(23,146),(23,147),(23,148),(23,149),(24,150),(24,151),(25,152),(26,152),(27,152),(28,152),(25,153),(26,153),(27,153),(28,153),(25,154),(27,154),(28,154),(25,155),(27,155),(28,155),(25,156),(27,156),(25,157),(27,157),(28,157),(25,158),(27,158),(28,158),(25,159),(26,159),(25,160),(26,160),(29,162),(29,163),(29,164),(29,165),(29,166),(29,167),(30,168),(30,169),(30,170),(30,171),(30,172),(30,173),(30,174),(30,175),(31,176),(32,177),(33,177),(32,178),(33,178),(32,179),(33,179),(32,180),(32,181),(33,181),(20,182),(20,183),(20,184),(20,185),(34,187),(35,189),(36,190),(36,191),(36,192),(37,193),(38,194),(38,195),(39,196),(39,197),(37,198),(38,199),(38,200),(37,201),(38,202),(38,203),(38,204),(38,205),(37,206),(38,207),(37,208),(38,209),(38,210),(38,211),(38,212),(40,220),(40,221),(40,222),(40,223),(40,224),(40,225),(40,226),(40,227),(40,228),(40,229),(40,230),(40,231),(40,232),(40,233),(40,234),(40,235),(40,236),(40,237),(40,238),(40,239),(40,240),(40,241),(40,242),(40,243),(40,244),(41,245),(41,246),(41,247),(41,248),(42,249),(41,250),(41,251),(41,252),(41,253),(43,254),(44,255),(41,256),(41,257),(41,258),(41,259),(42,260),(43,260),(45,260),(43,261),(43,262),(43,263);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Localized`;
CREATE TABLE `Localized` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Localized` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Localized_localizations`;
CREATE TABLE `Localized_localizations` (
  `Localized_id` bigint(20) NOT NULL,
  `localizations` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `localizations_KEY` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`Localized_id`,`localizations_KEY`),
  KEY `FKE0084716E53C9155` (`Localized_id`),
  CONSTRAINT `FKE0084716E53C9155` FOREIGN KEY (`Localized_id`) REFERENCES `Localized` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Localized_localizations` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Node`;
CREATE TABLE `Node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hasChildren` bit(1) NOT NULL,
  `position` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK25222221DABB28` (`parent_id`),
  CONSTRAINT `FK25222221DABB28` FOREIGN KEY (`parent_id`) REFERENCES `Node` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Node` WRITE;
INSERT INTO `Node` VALUES (1,'\0',0,NULL),(2,'\0',0,NULL),(3,'\0',0,NULL),(4,'',0,NULL),(5,'',0,4),(6,'\0',1,4),(7,'\0',2,4),(8,'',0,NULL),(9,'\0',0,8),(10,'\0',1,8),(11,'\0',2,8),(12,'',0,NULL),(13,'\0',0,12),(14,'\0',1,12),(15,'\0',2,12),(16,'',0,NULL),(17,'\0',0,16),(18,'\0',1,16),(19,'\0',2,16),(20,'\0',0,NULL),(21,'\0',0,NULL),(22,'\0',0,NULL),(23,'\0',0,NULL),(24,'\0',0,NULL),(25,'\0',0,NULL),(26,'',0,5),(28,'\0',0,26),(32,'',0,NULL),(33,'\0',0,32),(34,'',0,NULL),(35,'\0',0,34),(37,'',1,26),(38,'\0',0,37),(39,'',1,5),(40,'\0',0,39),(43,'',1,34),(44,'',0,43),(45,'\0',0,44);
UNLOCK TABLES;
DROP TABLE IF EXISTS `OpenQuestion`;
CREATE TABLE `OpenQuestion` (
  `regexpression` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK589E30702E512894` (`id`),
  CONSTRAINT `FK589E30702E512894` FOREIGN KEY (`id`) REFERENCES `AbstractQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OpenQuestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `OpenQuestionAnswer`;
CREATE TABLE `OpenQuestionAnswer` (
  `value` longtext COLLATE utf8_bin,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAF23484E9E50AD70` (`id`),
  CONSTRAINT `FKAF23484E9E50AD70` FOREIGN KEY (`id`) REFERENCES `AbstractTypedAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OpenQuestionAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `OperatingSystem`;
CREATE TABLE `OperatingSystem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_bin NOT NULL,
  `regex` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `regex` (`regex`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OperatingSystem` WRITE;
INSERT INTO `OperatingSystem` VALUES (1,'unknown','unknown',''),(2,'Mac OS','Apple','.*Mac.*'),(3,'Win other','Microsoft','.*Win.*');
UNLOCK TABLES;
DROP TABLE IF EXISTS `OperatingSystemPerVisitAggregation`;
CREATE TABLE `OperatingSystemPerVisitAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  `counted_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAAECA3048E487982` (`statisticsServer_id`),
  KEY `FKAAECA304B4184974` (`counted_id`),
  CONSTRAINT `FKAAECA3048E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`),
  CONSTRAINT `FKAAECA304B4184974` FOREIGN KEY (`counted_id`) REFERENCES `OperatingSystem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OperatingSystemPerVisitAggregation` WRITE;
INSERT INTO `OperatingSystemPerVisitAggregation` VALUES (1,1459382399999,1459296000000,2,1,3),(2,1459468799999,1459382400000,2,1,3),(3,1459555199999,1459468800000,3,1,3);
UNLOCK TABLES;
DROP TABLE IF EXISTS `OperatingSystemPerVisitAggregation_OperatingSystemVersionCounter`;
CREATE TABLE `OperatingSystemPerVisitAggregation_OperatingSystemVersionCounter` (
  `OperatingSystemPerVisitAggregation_id` bigint(20) NOT NULL,
  `counters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`OperatingSystemPerVisitAggregation_id`,`counters_id`),
  UNIQUE KEY `counters_id` (`counters_id`),
  KEY `FK1FBEF0D9E5ABE2E3` (`counters_id`),
  KEY `FK1FBEF0D990BFB4EE` (`OperatingSystemPerVisitAggregation_id`),
  CONSTRAINT `FK1FBEF0D990BFB4EE` FOREIGN KEY (`OperatingSystemPerVisitAggregation_id`) REFERENCES `OperatingSystemPerVisitAggregation` (`id`),
  CONSTRAINT `FK1FBEF0D9E5ABE2E3` FOREIGN KEY (`counters_id`) REFERENCES `OperatingSystemVersionCounter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OperatingSystemPerVisitAggregation_OperatingSystemVersionCounter` WRITE;
INSERT INTO `OperatingSystemPerVisitAggregation_OperatingSystemVersionCounter` VALUES (1,1),(3,2);
UNLOCK TABLES;
DROP TABLE IF EXISTS `OperatingSystemVersionCounter`;
CREATE TABLE `OperatingSystemVersionCounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `abstractAggregation_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8E9ABCD4108C45DB` (`version_id`),
  KEY `FK8E9ABCD4B737AD12` (`abstractAggregation_id`),
  CONSTRAINT `FK8E9ABCD4108C45DB` FOREIGN KEY (`version_id`) REFERENCES `RegexVersion` (`id`),
  CONSTRAINT `FK8E9ABCD4B737AD12` FOREIGN KEY (`abstractAggregation_id`) REFERENCES `OperatingSystemPerVisitAggregation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OperatingSystemVersionCounter` WRITE;
INSERT INTO `OperatingSystemVersionCounter` VALUES (1,1,1,10),(2,2,3,10);
UNLOCK TABLES;
DROP TABLE IF EXISTS `OperatingSystem_RegexVersion`;
CREATE TABLE `OperatingSystem_RegexVersion` (
  `OperatingSystem_id` bigint(20) NOT NULL,
  `versions_id` bigint(20) NOT NULL,
  UNIQUE KEY `versions_id` (`versions_id`),
  KEY `FK329A1BE0D0B5BD72` (`OperatingSystem_id`),
  KEY `FK329A1BE061A3E938` (`versions_id`),
  CONSTRAINT `FK329A1BE061A3E938` FOREIGN KEY (`versions_id`) REFERENCES `RegexVersion` (`id`),
  CONSTRAINT `FK329A1BE0D0B5BD72` FOREIGN KEY (`OperatingSystem_id`) REFERENCES `OperatingSystem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OperatingSystem_RegexVersion` WRITE;
INSERT INTO `OperatingSystem_RegexVersion` VALUES (3,10),(3,11);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Option`;
CREATE TABLE `Option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` varchar(255) COLLATE utf8_bin NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8D2F74951411AF19` (`attribute_id`),
  KEY `FK8D2F74954A89DDCD` (`attribute_id`),
  CONSTRAINT `FK8D2F74951411AF19` FOREIGN KEY (`attribute_id`) REFERENCES `SelectionAttribute` (`id`),
  CONSTRAINT `FK8D2F74954A89DDCD` FOREIGN KEY (`attribute_id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Option` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `OrderMetaData_successfulFinishingTasks`;
CREATE TABLE `OrderMetaData_successfulFinishingTasks` (
  `OrderMetaData_id` bigint(20) NOT NULL,
  `successfulFinishingTasks` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK7412ECFBA893C602` (`OrderMetaData_id`),
  CONSTRAINT `FK7412ECFBA893C602` FOREIGN KEY (`OrderMetaData_id`) REFERENCES `checkout_OrderMetaData` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `OrderMetaData_successfulFinishingTasks` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `PIRecord`;
CREATE TABLE `PIRecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ipHash` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin NOT NULL,
  `processed` bigint(20) NOT NULL,
  `proxyRequest` bit(1) NOT NULL,
  `recorded` bigint(20) NOT NULL,
  `recurring` bit(1) NOT NULL,
  `referer` longtext COLLATE utf8_bin,
  `sessionId` varchar(255) COLLATE utf8_bin NOT NULL,
  `userAgentString` longtext COLLATE utf8_bin,
  `vpXRes` int(11) DEFAULT NULL,
  `vpYRes` int(11) DEFAULT NULL,
  `xRes` int(11) DEFAULT NULL,
  `yRes` int(11) DEFAULT NULL,
  `server_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1DB043AA73E39345` (`server_id`),
  CONSTRAINT `FK1DB043AA73E39345` FOREIGN KEY (`server_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PIRecord` WRITE;
INSERT INTO `PIRecord` VALUES (6,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406064112,'','','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(7,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406071150,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(8,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406076451,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures?page=1','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(9,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406089422,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures?page=0','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(10,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406094310,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures?page=1','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(11,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406112346,'','','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(12,'??','-1CKAzrvOl0nXTFK6U13D1r5cdOWypXbXMOriznFNwpKzAHYliOCNz4VfpnqaXcxIfMXAadFoPaLBUt31QCT8jD','/en_US/Autogenerated Node',1459407000012,'\0',1459406124328,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures?page=0','ADF02D8C7DA307C6E23A509883C43BEF','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1600,900,1),(13,'??','-leC8UFEmzda2hhHfN5p7tFNhC3yBsYe7ZQdXNuk5almASdqRPXgQVdzAyNe7kNiucsNYK0SL7xcCs0nbrSz2jy','/en_US/Autogenerated Node',1459441200019,'\0',1459440440747,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures','A8DEAC7B40AD403C6C801BCF56F32B2E','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36',NULL,NULL,1600,900,1),(14,'??','-leC8UFEmzda2hhHfN5p7tFNhC3yBsYe7ZQdXNuk5almASdqRPXgQVdzAyNe7kNiucsNYK0SL7xcCs0nbrSz2jy','/en_US/Autogenerated Node',1459494300016,'\0',1459493209944,'','','A9015EFAB7FE8DE8BD6090676D1940F4','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36',NULL,NULL,1680,1050,1),(15,'??','-leC8UFEmzda2hhHfN5p7tFNhC3yBsYe7ZQdXNuk5almASdqRPXgQVdzAyNe7kNiucsNYK0SL7xcCs0nbrSz2jy','/en_US/Autogenerated Node',1459494300016,'\0',1459493213952,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures','A9015EFAB7FE8DE8BD6090676D1940F4','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36',NULL,NULL,1680,1050,1),(16,'??','-leC8UFEmzda2hhHfN5p7tFNhC3yBsYe7ZQdXNuk5almASdqRPXgQVdzAyNe7kNiucsNYK0SL7xcCs0nbrSz2jy','/en_US/Autogenerated Node',1459494300016,'\0',1459493423081,'','','A9015EFAB7FE8DE8BD6090676D1940F4','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36',NULL,NULL,1680,1050,1),(17,'??','-leC8UFEmzda2hhHfN5p7tFNhC3yBsYe7ZQdXNuk5almASdqRPXgQVdzAyNe7kNiucsNYK0SL7xcCs0nbrSz2jy','/en_US/Autogenerated Node',1459494300016,'\0',1459493440317,'','','A9015EFAB7FE8DE8BD6090676D1940F4','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36',NULL,NULL,1680,1050,1),(18,'??','DrDWkBBDPZ93OpyjMrTzaIilxQFVmlgdjYLuYe9GroQSVE0sB5UVFKMYrHkuCI7etlL7U5a49YYq0tLIuNYic2','/en_US/Autogenerated Node',1459494300016,'\0',1459493579330,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures','A76C1590EE82D5FF663347505D416177','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1920,1080,1),(19,'??','DrDWkBBDPZ93OpyjMrTzaIilxQFVmlgdjYLuYe9GroQSVE0sB5UVFKMYrHkuCI7etlL7U5a49YYq0tLIuNYic2','/en_US/Autogenerated Node',1459500300011,'\0',1459499673226,'','http://ecsc00104473.epam.com:8080/pulse/Pulsar/en_US.CMS.displayCMS.3./pictures','397BBA86B24A752BC0A70767749EAF84','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36',NULL,NULL,1920,1080,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `PIRecordCountAggregation`;
CREATE TABLE `PIRecordCountAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8BA3021D8E487982` (`statisticsServer_id`),
  CONSTRAINT `FK8BA3021D8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PIRecordCountAggregation` WRITE;
INSERT INTO `PIRecordCountAggregation` VALUES (1,1459382399999,1459296000000,5,1),(2,1459468799999,1459382400000,8,1),(3,1459555199999,1459468800000,6,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `PIRecordCountAggregationHitCounter`;
CREATE TABLE `PIRecordCountAggregationHitCounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `endTime` bigint(20) NOT NULL,
  `hour` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `startTime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PIRecordCountAggregationHitCounter` WRITE;
INSERT INTO `PIRecordCountAggregationHitCounter` VALUES (1,2,1459324799999,'SEVEN',1459321200000),(2,3,1459346399999,'THIRTEEN',1459342800000),(3,7,1459407599999,'SIX',1459404000000),(4,1,1459443599999,'SIXTEEN',1459440000000),(5,5,1459493999999,'SIX',1459490400000),(6,1,1459501199999,'EIGHT',1459497600000);
UNLOCK TABLES;
DROP TABLE IF EXISTS `PIRecordCountAggregation_PIRecordCountAggregationHitCounter`;
CREATE TABLE `PIRecordCountAggregation_PIRecordCountAggregationHitCounter` (
  `PIRecordCountAggregation_id` bigint(20) NOT NULL,
  `counters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`PIRecordCountAggregation_id`,`counters_id`),
  UNIQUE KEY `counters_id` (`counters_id`),
  KEY `FKC3C8A648F507431D` (`counters_id`),
  KEY `FKC3C8A648A6DB978E` (`PIRecordCountAggregation_id`),
  CONSTRAINT `FKC3C8A648A6DB978E` FOREIGN KEY (`PIRecordCountAggregation_id`) REFERENCES `PIRecordCountAggregation` (`id`),
  CONSTRAINT `FKC3C8A648F507431D` FOREIGN KEY (`counters_id`) REFERENCES `PIRecordCountAggregationHitCounter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PIRecordCountAggregation_PIRecordCountAggregationHitCounter` WRITE;
INSERT INTO `PIRecordCountAggregation_PIRecordCountAggregationHitCounter` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Page`;
CREATE TABLE `Page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contentString` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Page` WRITE;
INSERT INTO `Page` VALUES (1,'<body><p><img src=\"http://www.wallpapereast.com/static/images/909f6f83b88148324e6b4c174eeaeb15_large_NBnVln2.jpeg\" alt=\"\" /></p><p>A hackathon (also known as a hack day, hackfest or codefest) is an event in which computer programmers and others involved in software development and hardware development, including graphic designers, interface designers and project managers, collaborate intensively on software projects.[1] Occasionally, there is a hardware component as well. Hackathons typically last between a day and a week. Some hackathons are intended simply for educational or social purposes, although in many cases the goal is to create usable software.A hackathon (also known as a hack day, hackfest or codefest) is an event in which computer programmers and others involved in software development and hardware development, including graphic designers, interface designers and project managers, collaborate intensively on software projects.[1] Occasionally, there is a hardware component as well. Hackathons typically last between a day and a week. Some hackathons are intended simply for educational or social purposes, although in many cases the goal is to create usable software.A hackathon (also known as a hack day, hackfest or codefest) is an event in which computer programmers and others involved in software development and hardware development, including graphic designers, interface designers and project managers, collaborate intensively on software projects.[1] Occasionally, there is a hardware component as well. Hackathons typically last between a day and a week. Some hackathons are intended simply for educational or social purposes, although in many cases the goal is to create usable software.A hackathon (also known as a hack day, hackfest or codefest) is an event in which computer programmers and others involved in software development and hardware development, including graphic designers, interface designers and project managers, collaborate intensively on software projects.[1] Occasionally, there is a hardware component as well. Hackathons typically last between a day and a week. Some hackathons are intended simply for educational or social purposes, although in many cases the goal is to create usable software.</p></body>\r\n'),(5,'<body><p><img src=\"http://www.coffeearea.org/wp-content/uploads/2014/04/how-to-store-coffee-beans.jpg\" alt=\"\" /></p><p> </p></body>\r\n'),(6,'<body><p> Nature</p><p><img src=\"https://pixabay.com/static/uploads/photo/2016/02/05/22/00/melbourne-1182174_960_720.jpg\" alt=\"\" /></p></body>\r\n'),(7,'<body><p><img src=\"https://pixabay.com/static/uploads/photo/2016/02/05/22/00/melbourne-1182174_960_720.jpg\" alt=\"\" /></p><p> </p></body>\r\n');
UNLOCK TABLES;
DROP TABLE IF EXISTS `Parameter`;
CREATE TABLE `Parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Parameter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Parameter_values`;
CREATE TABLE `Parameter_values` (
  `Parameter_id` bigint(20) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK65E26A98C4D5664B` (`Parameter_id`),
  CONSTRAINT `FK65E26A98C4D5664B` FOREIGN KEY (`Parameter_id`) REFERENCES `Parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Parameter_values` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `PathTreeAggregation`;
CREATE TABLE `PathTreeAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `hits` int(11) NOT NULL,
  `bounces` int(11) NOT NULL,
  `childBounces` int(11) NOT NULL,
  `childHits` int(11) NOT NULL,
  `entries` int(11) NOT NULL,
  `leaves` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  `path_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKB9DCB95F8E487982` (`statisticsServer_id`),
  KEY `FKB9DCB95F7D7CEA1A` (`path_id`),
  CONSTRAINT `FKB9DCB95F7D7CEA1A` FOREIGN KEY (`path_id`) REFERENCES `PathTreeElement` (`id`),
  CONSTRAINT `FKB9DCB95F8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PathTreeAggregation` WRITE;
INSERT INTO `PathTreeAggregation` VALUES (1,1459382399999,1459296000000,0,0,0,5,0,0,1,32),(2,1459382399999,1459296000000,5,0,0,0,2,2,1,33),(3,1459468799999,1459382400000,0,0,1,8,0,0,1,32),(4,1459468799999,1459382400000,8,1,0,0,2,2,1,33),(5,1459555199999,1459468800000,0,0,2,6,0,0,1,32),(6,1459555199999,1459468800000,6,2,0,0,3,3,1,33);
UNLOCK TABLES;
DROP TABLE IF EXISTS `PathTreeElement`;
CREATE TABLE `PathTreeElement` (
  `pathString` varchar(255) COLLATE utf8_bin NOT NULL,
  `rootNode` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `server_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFBD5F7F9A6741773` (`id`),
  KEY `FKFBD5F7F973E39345` (`server_id`),
  CONSTRAINT `FKFBD5F7F973E39345` FOREIGN KEY (`server_id`) REFERENCES `StatisticsServer` (`id`),
  CONSTRAINT `FKFBD5F7F9A6741773` FOREIGN KEY (`id`) REFERENCES `Node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PathTreeElement` WRITE;
INSERT INTO `PathTreeElement` VALUES ('','',32,1),('/en_US/Autogenerated Node','\0',33,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Permission` WRITE;
INSERT INTO `Permission` VALUES (1,'~Store:StoreContentDisplayer:displayStore','auto-generated permission'),(2,'~Store:AbstractBasicContentEditor:editAbstractBasicContent','auto-generated permission'),(3,'~Store:AbstractBasicContentEditor:viewAbstractBasicContent','auto-generated permission'),(4,'~Store:AbstractBasicContentEditor:viewLocalizationMaps','auto-generated permission'),(5,'~Store:AbstractBasicContentEditor:editLocalizationMaps','auto-generated permission'),(6,'~Store:ContentGroupEditor:editContentGroup','auto-generated permission'),(7,'~Store:ContentGroupEditor:editAbstractBasicContent','auto-generated permission'),(8,'~Store:ContentGroupEditor:viewAbstractBasicContent','auto-generated permission'),(9,'~Store:ContentGroupEditor:viewLocalizationMaps','auto-generated permission'),(10,'~Store:ContentGroupEditor:editLocalizationMaps','auto-generated permission'),(11,'~Store:StoreContentEditor:editStoreContent','auto-generated permission'),(12,'~Store:StoreContentEditor:editAbstractBasicContent','auto-generated permission'),(13,'~Store:StoreContentEditor:viewAbstractBasicContent','auto-generated permission'),(14,'~Store:StoreContentEditor:viewLocalizationMaps','auto-generated permission'),(15,'~Store:StoreContentEditor:editLocalizationMaps','auto-generated permission'),(16,'~Store:StoreContentImageGroupEditor:editStoreContentImageGroup','auto-generated permission'),(17,'~Store:StoreContentRegistryEditor:useContentRegistry','auto-generated permission'),(18,'~CMS:CMSContentDisplayer:displayCMS','auto-generated permission'),(19,'~CMS:CMSFormMailer:sendMail','auto-generated permission'),(20,'~CMS:CMSFormProcessor:processForm','auto-generated permission'),(21,'~CMS:AbstractBasicContentEditor:editAbstractBasicContent','auto-generated permission'),(22,'~CMS:AbstractBasicContentEditor:viewAbstractBasicContent','auto-generated permission'),(23,'~CMS:AbstractBasicContentEditor:viewLocalizationMaps','auto-generated permission'),(24,'~CMS:AbstractBasicContentEditor:editLocalizationMaps','auto-generated permission'),(25,'~CMS:ContentGroupEditor:editContentGroup','auto-generated permission'),(26,'~CMS:ContentGroupEditor:editAbstractBasicContent','auto-generated permission'),(27,'~CMS:ContentGroupEditor:viewAbstractBasicContent','auto-generated permission'),(28,'~CMS:ContentGroupEditor:viewLocalizationMaps','auto-generated permission'),(29,'~CMS:ContentGroupEditor:editLocalizationMaps','auto-generated permission'),(30,'~CMS:CMSContentEditor:editCMSContent','auto-generated permission'),(31,'~CMS:CMSContentEditor:viewCMSContent','auto-generated permission'),(32,'~CMS:CMSContentEditor:editAbstractBasicContent','auto-generated permission'),(33,'~CMS:CMSContentEditor:viewAbstractBasicContent','auto-generated permission'),(34,'~CMS:CMSContentEditor:viewLocalizationMaps','auto-generated permission'),(35,'~CMS:CMSContentEditor:editLocalizationMaps','auto-generated permission'),(36,'~CMS:CMSPageEditor:viewPages','auto-generated permission'),(37,'~CMS:CMSPageEditor:editPages','auto-generated permission'),(38,'~CMS:CMSContentRegistryEditor:useContentRegistry','auto-generated permission'),(39,'~Core:SearchSiteSuggestions:searchSuggestions','auto-generated permission'),(40,'~Core:HomepageRedirector:user','auto-generated permission'),(41,'~Core:LocalizationLocator:findLocalization','auto-generated permission'),(42,'~Core:UploadProgressCheck:uploadProgress','auto-generated permission'),(43,'~Core:CoreContentDisplayer:displayCore','auto-generated permission'),(44,'~Core:URLContentDisplayer:displayURLContent','auto-generated permission'),(45,'~Core:FilterContentDisplayer:displayFilterContent','auto-generated permission'),(46,'~Core:SignUpController:signUp','auto-generated permission'),(47,'~Core:SignUpController:resetPassword','auto-generated permission'),(48,'~Core:GetFullSitemap:seeSitemap','auto-generated permission'),(49,'~Core:SearchSite:searchSite','auto-generated permission'),(50,'~Core:SearchSite:initAdvancedSearch','auto-generated permission'),(51,'~Core:UserSelfEditController:saveUserSelfEdit','auto-generated permission'),(52,'~Core:UserSelfEditController:initUserSelfEdit','auto-generated permission'),(53,'~Core:UserSelfEditController:userChangePassword','auto-generated permission'),(54,'~Core:UserSelfEditController:userChangeEmail','auto-generated permission'),(55,'~Core:UserSelfEditController:saveEmailChange','auto-generated permission'),(56,'~Core:FCKEditorBrowser:useFCKEditorBrowser','auto-generated permission'),(57,'~Core:InitWebsiteAdministration:useAdmin','auto-generated permission'),(58,'~Core:Status:statusControl','auto-generated permission'),(59,'~Core:AccessControlEditor:viewAccessControl','auto-generated permission'),(60,'~Core:UserEditor:createUserEditor','auto-generated permission'),(61,'~Core:UserEditor:initUserEditor','auto-generated permission'),(62,'~Core:UserEditor:loadUserOverviewGrid','auto-generated permission'),(63,'~Core:UserEditor:deleteUserEditor','auto-generated permission'),(64,'~Core:UserEditor:userOverviewInit','auto-generated permission'),(65,'~Core:UserEditor:saveUserEditor','auto-generated permission'),(66,'~Core:UserEditor:toggleStateUserEditor','auto-generated permission'),(67,'~Core:UserEditor:editUsers','auto-generated permission'),(68,'~Core:UserEditor:loadRolesUserEditor','auto-generated permission'),(69,'~Core:UserEditor:loadGroupsUserEditor','auto-generated permission'),(70,'~Core:UserEditor:loadPermissionsUserEditor','auto-generated permission'),(71,'~Core:UserEditor:loadAttributeUserEditor','auto-generated permission'),(72,'~Core:RoleEditor:createRoleEditor','auto-generated permission'),(73,'~Core:RoleEditor:initRoleEditor','auto-generated permission'),(74,'~Core:RoleEditor:loadRoleOverviewGrid','auto-generated permission'),(75,'~Core:RoleEditor:roleOverviewInit','auto-generated permission'),(76,'~Core:RoleEditor:deleteRoleEditor','auto-generated permission'),(77,'~Core:RoleEditor:loadGroupsRoleEditor','auto-generated permission'),(78,'~Core:RoleEditor:loadPermissionsRoleEditor','auto-generated permission'),(79,'~Core:RoleEditor:saveRoleEditor','auto-generated permission'),(80,'~Core:RoleEditor:loadUsersRoleEditor','auto-generated permission'),(81,'~Core:GroupEditor:createUsergroupEditor','auto-generated permission'),(82,'~Core:GroupEditor:initUsergroupEditor','auto-generated permission'),(83,'~Core:GroupEditor:loadUsergroupOverviewGrid','auto-generated permission'),(84,'~Core:GroupEditor:usergroupOverviewInit','auto-generated permission'),(85,'~Core:GroupEditor:loadRolesUsergroupEditor','auto-generated permission'),(86,'~Core:GroupEditor:loadPermissionsUsergroupEditor','auto-generated permission'),(87,'~Core:GroupEditor:deleteUsergroupEditor','auto-generated permission'),(88,'~Core:GroupEditor:saveUsergroupEditor','auto-generated permission'),(89,'~Core:GroupEditor:loadUsersUsergroupEditor','auto-generated permission'),(90,'~Core:PermissionEditor:initPermissionEditor','auto-generated permission'),(91,'~Core:PermissionEditor:loadPermissionOverviewGrid','auto-generated permission'),(92,'~Core:PermissionEditor:permissionOverviewInit','auto-generated permission'),(93,'~Core:PermissionEditor:loadRolesPermissionEditor','auto-generated permission'),(94,'~Core:PermissionEditor:loadGroupsPermissionEditor','auto-generated permission'),(95,'~Core:PermissionEditor:createPermissionEditor','auto-generated permission'),(96,'~Core:PermissionEditor:deletePermissionEditor','auto-generated permission'),(97,'~Core:PermissionEditor:savePermissionEditor','auto-generated permission'),(98,'~Core:PermissionEditor:loadUsersPermissionEditor','auto-generated permission'),(99,'~Core:CommandMatcherEditor:initCommandMatcherEditor','auto-generated permission'),(100,'~Core:CommandMatcherEditor:loadCommandMatchersOverviewGrid','auto-generated permission'),(101,'~Core:CommandMatcherEditor:loadParametersCommandMatcherEditor','auto-generated permission'),(102,'~Core:CommandMatcherEditor:createCommandMatcherEditor','auto-generated permission'),(103,'~Core:CommandMatcherEditor:deleteCommandMatcherEditor','auto-generated permission'),(104,'~Core:CommandMatcherEditor:saveCommandMatcherEditor','auto-generated permission'),(105,'~Core:AttributeRegistryEditor:editAttributeRegistry','auto-generated permission'),(106,'~Core:AttributeRegistryEditor:useAttributeRegistry','auto-generated permission'),(107,'~Core:AttributeRegistryEditor:browseAttributeRegistryEdit','auto-generated permission'),(108,'~Core:AttributeRegistryEditor:browseAttributeRegistrySelect','auto-generated permission'),(109,'~Core:SubEditorSelectionAttribute:useAttributeRegistry','auto-generated permission'),(110,'~Core:VFSPermissionEditor:vfsPermissionOverviewInit','auto-generated permission'),(111,'~Core:VFSPermissionEditor:previewVirtualFileSystemVFSPermissionEditor','auto-generated permission'),(112,'~Core:VFSPermissionEditor:initPermissionsPanelVFSPermissionEditor','auto-generated permission'),(113,'~Core:VFSPermissionEditor:loadReadPermissionsVFSPermissionEditor','auto-generated permission'),(114,'~Core:VFSPermissionEditor:loadWritePermissionsVFSPermissionEditor','auto-generated permission'),(115,'~Core:VFSPermissionEditor:savePermissionsPanelVFSPermissionEditor','auto-generated permission'),(116,'~Core:FileBrowser:useFileBrowser','auto-generated permission'),(117,'~Core:ThemesEditor:editThemes','auto-generated permission'),(118,'~Core:ViewEditor:editViews','auto-generated permission'),(119,'~Core:ViewEditor:initSitemapSectionTagEditor','auto-generated permission'),(120,'~Core:ViewEditor:saveViewEditor','auto-generated permission'),(121,'~Core:ViewEditor:loadRolesViewEditor','auto-generated permission'),(122,'~Core:ViewEditor:createSitemapSectionTag','auto-generated permission'),(123,'~Core:ViewEditor:deleteSitemapSectionTag','auto-generated permission'),(124,'~Core:ViewEditor:editSitemapSectionTag','auto-generated permission'),(125,'~Core:ViewEditor:initSitemapDurationEditor','auto-generated permission'),(126,'~Core:ViewEditor:removeSitemapDuration','auto-generated permission'),(127,'~Core:StyleEditor:editStyles','auto-generated permission'),(128,'~Core:CoreContentRegistryEditor:useContentRegistry','auto-generated permission'),(129,'~Core:SitemapEditor:browseSitemap','auto-generated permission'),(130,'~Core:SitemapEditor:editSitemap','auto-generated permission'),(131,'~Core:AbstractBasicContentEditor:editAbstractBasicContent','auto-generated permission'),(132,'~Core:AbstractBasicContentEditor:viewAbstractBasicContent','auto-generated permission'),(133,'~Core:AbstractBasicContentEditor:viewLocalizationMaps','auto-generated permission'),(134,'~Core:AbstractBasicContentEditor:editLocalizationMaps','auto-generated permission'),(135,'~Core:ContentGroupEditor:editContentGroup','auto-generated permission'),(136,'~Core:ContentGroupEditor:editAbstractBasicContent','auto-generated permission'),(137,'~Core:ContentGroupEditor:viewAbstractBasicContent','auto-generated permission'),(138,'~Core:ContentGroupEditor:viewLocalizationMaps','auto-generated permission'),(139,'~Core:ContentGroupEditor:editLocalizationMaps','auto-generated permission'),(140,'~Core:FileContentEditor:editFileContent','auto-generated permission'),(141,'~Core:FileContentEditor:editAbstractBasicContent','auto-generated permission'),(142,'~Core:FileContentEditor:viewAbstractBasicContent','auto-generated permission'),(143,'~Core:FileContentEditor:viewLocalizationMaps','auto-generated permission'),(144,'~Core:FileContentEditor:editLocalizationMaps','auto-generated permission'),(145,'~Core:URLContentEditor:editURLContent','auto-generated permission'),(146,'~Core:URLContentEditor:editAbstractBasicContent','auto-generated permission'),(147,'~Core:URLContentEditor:viewAbstractBasicContent','auto-generated permission'),(148,'~Core:URLContentEditor:viewLocalizationMaps','auto-generated permission'),(149,'~Core:URLContentEditor:editLocalizationMaps','auto-generated permission'),(150,'~Core:FilterContentEditor:editFilterContent','auto-generated permission'),(151,'~Core:FilterContentEditor:viewFilterContent','auto-generated permission'),(152,'~Core:FilterEditor:editFilter','auto-generated permission'),(153,'~Core:FilterEditor:viewFilter','auto-generated permission'),(154,'~Core:FilterRulesEditor:viewFilterRules','auto-generated permission'),(155,'~Core:FilterRulesEditor:editFilterRuleProperties','auto-generated permission'),(156,'~Core:FilterRulesEditor:editFilterRules','auto-generated permission'),(157,'~Core:FilterRulesEditor:viewFilterRuleLocalizations','auto-generated permission'),(158,'~Core:FilterRulesEditor:viewFilterRuleProperties','auto-generated permission'),(159,'~Core:FilterMatchesEditor:viewFilterMatches','auto-generated permission'),(160,'~Core:FilterMatchesEditor:editFilterMatches','auto-generated permission'),(161,'~Core:InitWestPanelController:initUtilWestPanel','auto-generated permission'),(162,'~Core:RepresentativeEditor:initRepresentativesEditor','auto-generated permission'),(163,'~Core:RepresentativeEditor:loadRepresentatives','auto-generated permission'),(164,'~Core:RepresentativeEditor:loadRepresentative','auto-generated permission'),(165,'~Core:RepresentativeEditor:deleteRepresentative','auto-generated permission'),(166,'~Core:RepresentativeEditor:saveRepresentative','auto-generated permission'),(167,'~Core:RepresentativeEditor:initRepresentativeEditor','auto-generated permission'),(168,'~Core:RetailerEditor:initRetailersEditor','auto-generated permission'),(169,'~Core:RetailerEditor:loadRetailers','auto-generated permission'),(170,'~Core:RetailerEditor:loadRetailer','auto-generated permission'),(171,'~Core:RetailerEditor:deleteRetailer','auto-generated permission'),(172,'~Core:RetailerEditor:saveRetailer','auto-generated permission'),(173,'~Core:RetailerEditor:exportRetailersCSV','auto-generated permission'),(174,'~Core:RetailerEditor:exportRetailersXLSX','auto-generated permission'),(175,'~Core:RetailerEditor:initRetailerEditor','auto-generated permission'),(176,'~Core:HibernateStatistics:hibernateStatisticsStatus','auto-generated permission'),(177,'~Core:HibernateStatistics:hibernateStatisticsEntities','auto-generated permission'),(178,'~Core:HibernateStatistics:hibernateStatisticsCache','auto-generated permission'),(179,'~Core:HibernateStatistics:hibernateStatisticsCollections','auto-generated permission'),(180,'~Core:HibernateStatistics:hibernateStatisticsToggle','auto-generated permission'),(181,'~Core:HibernateStatistics:hibernateStatisticsSummary','auto-generated permission'),(182,'~Core:LocaleCopy:copyLocale','auto-generated permission'),(183,'~Core:LocaleCopy:copySitemap','auto-generated permission'),(184,'~Core:SitemapManipulator:manipulateRolesOfSitemapNodes','auto-generated permission'),(185,'~Core:SitemapManipulator:changeVisiblityOfSitemapNodes','auto-generated permission'),(186,'~Core:SiteSearchRebuild:siteSearchRebuild','auto-generated permission'),(187,'~Core:ThemesController:user','auto-generated permission'),(188,'~Statistics:PageImpressionRecorder:useStatistics','auto-generated permission'),(189,'~Statistics:UserStatisticsPDFController:createUserStatisticsPDF','auto-generated permission'),(190,'~Statistics:UserStatisticsPDFController:loadYearChart','auto-generated permission'),(191,'~Statistics:UserStatisticsPDFController:loadMonthChart','auto-generated permission'),(192,'~Statistics:UserStatisticsPDFController:initUserStatistics','auto-generated permission'),(193,'~Statistics:GroupAnalysisViewReportController:generatePDFReportGroupAnalysisView','auto-generated permission'),(194,'~Statistics:GroupAnalysisViewReportController:initStatisticsGroupAnalysisView','auto-generated permission'),(195,'~Statistics:GroupAnalysisViewReportController:loadTreeStatisticsGroupAnalysisView','auto-generated permission'),(196,'~Statistics:GroupAnalysisViewDegunkController:removeNodeGroupAnalysisView','auto-generated permission'),(197,'~Statistics:GroupAnalysisViewDegunkController:degunkChildLeafNodesGroupAnalysisView','auto-generated permission'),(198,'~Statistics:RefererAnalysisViewReportController:generatePDFReportRefererAnalysisView','auto-generated permission'),(199,'~Statistics:RefererAnalysisViewReportController:initStatisticsRefererAnalysisView','auto-generated permission'),(200,'~Statistics:RefererAnalysisViewReportController:loadTreeStatisticsRefererAnalysisView','auto-generated permission'),(201,'~Statistics:OverViewReportController:generatePDFReportOverView','auto-generated permission'),(202,'~Statistics:OverViewReportController:loadOverViewCountryChart','auto-generated permission'),(203,'~Statistics:OverViewReportController:loadOverViewDataChart','auto-generated permission'),(204,'~Statistics:OverViewReportController:initStatisticsOverView','auto-generated permission'),(205,'~Statistics:OverViewReportController:clearSessionDataOverView','auto-generated permission'),(206,'~Statistics:TechnicalInformationViewReportController:generatePDFReportTechnicalInformationView','auto-generated permission'),(207,'~Statistics:TechnicalInformationViewReportController:initStatisticsTechnicalInformationView','auto-generated permission'),(208,'~Statistics:TimeAnalysisViewReportController:generatePDFReportTimeAnalysisView','auto-generated permission'),(209,'~Statistics:TimeAnalysisViewReportController:loadTimeAnalysisChart','auto-generated permission'),(210,'~Statistics:TimeAnalysisViewReportController:initStatisticsTimeAnalysisView','auto-generated permission'),(211,'~Statistics:TimeAnalysisViewReportController:clearSessionDataTimeAnalysis','auto-generated permission'),(212,'~Statistics:WestPanelController:initStatisticsWestPanel','auto-generated permission'),(213,'~Survey:SurveyController:executeSurveyController','auto-generated permission'),(214,'~Survey:SurveyCreatorController:updateSurvey','auto-generated permission'),(215,'~Survey:SurveyCreatorController:createSurvey','auto-generated permission'),(216,'~Survey:SurveyCreatorController:removeSurvey','auto-generated permission'),(217,'~Survey:SurveyCreatorController:removeQuestionnaire','auto-generated permission'),(218,'~Shop:ShopContentDisplayer:displayShop','auto-generated permission'),(219,'~Shop:ShoppingCartController:useShoppingCart','auto-generated permission'),(220,'~Shop:CheckoutController:startCheckout','auto-generated permission'),(221,'~Shop:CheckoutController:finishCheckout','auto-generated permission'),(222,'~Shop:CheckoutController:cancelCheckout','auto-generated permission'),(223,'~Shop:CheckoutController:getOrder','auto-generated permission'),(224,'~Shop:CheckoutController:editDeliveryAddress','auto-generated permission'),(225,'~Shop:CheckoutController:editBillingAddress','auto-generated permission'),(226,'~Shop:CheckoutController:editDispatchData','auto-generated permission'),(227,'~Shop:CheckoutController:editCustomer','auto-generated permission'),(228,'~Shop:CheckoutController:capturePayment','auto-generated permission'),(229,'~Shop:CheckoutController:editPaymentData','auto-generated permission'),(230,'~Shop:CheckoutController:editOrderDetails','auto-generated permission'),(231,'~Shop:CheckoutController:editOrder','auto-generated permission'),(232,'~Shop:CheckoutController:authorizePayment','auto-generated permission'),(233,'~Shop:InvoicePaymentController:captureInvoicePayment','auto-generated permission'),(234,'~Shop:InvoicePaymentController:authorizeInvoicePayment','auto-generated permission'),(235,'~Shop:PayPalPaymentController:startPayPalPaymentCapture','auto-generated permission'),(236,'~Shop:PayPalPaymentController:cancelPayPalPayment','auto-generated permission'),(237,'~Shop:PayPalPaymentController:finishPayPalPaymentAuthorization','auto-generated permission'),(238,'~Shop:PayPalPaymentController:finishPayPalPaymentCaptureWithGiropay','auto-generated permission'),(239,'~Shop:PayPalPaymentController:startPayPalPaymentAuthorization','auto-generated permission'),(240,'~Shop:WirecardCCPaymentController:captureWirecardCCPayment','auto-generated permission'),(241,'~Shop:WirecardCCPaymentController:finishWirecardCCPaymentAuthorization','auto-generated permission'),(242,'~Shop:WirecardCCPaymentController:startWirecardCCPaymentAuthorization','auto-generated permission'),(243,'~Shop:WirecardEFTPaymentController:captureWirecardEFTPayment','auto-generated permission'),(244,'~Shop:WirecardEFTPaymentController:authorizeWirecardEFTPayment','auto-generated permission'),(245,'~Shop:AbstractBasicContentEditor:editAbstractBasicContent','auto-generated permission'),(246,'~Shop:AbstractBasicContentEditor:viewAbstractBasicContent','auto-generated permission'),(247,'~Shop:AbstractBasicContentEditor:viewLocalizationMaps','auto-generated permission'),(248,'~Shop:AbstractBasicContentEditor:editLocalizationMaps','auto-generated permission'),(249,'~Shop:ContentGroupEditor:editContentGroup','auto-generated permission'),(250,'~Shop:ContentGroupEditor:editAbstractBasicContent','auto-generated permission'),(251,'~Shop:ContentGroupEditor:viewAbstractBasicContent','auto-generated permission'),(252,'~Shop:ContentGroupEditor:viewLocalizationMaps','auto-generated permission'),(253,'~Shop:ContentGroupEditor:editLocalizationMaps','auto-generated permission'),(254,'~Shop:ShopContentEditor:editShopContent','auto-generated permission'),(255,'~Shop:ShopContentEditor:editStoreContent','auto-generated permission'),(256,'~Shop:ShopContentEditor:editAbstractBasicContent','auto-generated permission'),(257,'~Shop:ShopContentEditor:viewAbstractBasicContent','auto-generated permission'),(258,'~Shop:ShopContentEditor:viewLocalizationMaps','auto-generated permission'),(259,'~Shop:ShopContentEditor:editLocalizationMaps','auto-generated permission'),(260,'~Shop:ShopContentRegistryEditor:useContentRegistry','auto-generated permission'),(261,'~Shop:ShopSettingsEditor:editShopSettings','auto-generated permission'),(262,'~Shop:PriceUpdateController:updateFromPriceList','auto-generated permission'),(263,'~Shop:PriceUpdateController:getPriceList','auto-generated permission');
UNLOCK TABLES;
DROP TABLE IF EXISTS `Permission_CommandMatcher`;
CREATE TABLE `Permission_CommandMatcher` (
  `Permission_id` bigint(20) NOT NULL,
  `commandMatchers_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Permission_id`,`commandMatchers_id`),
  UNIQUE KEY `commandMatchers_id` (`commandMatchers_id`),
  KEY `FK29B423D71BAB9B06` (`Permission_id`),
  KEY `FK29B423D7CDC38D81` (`commandMatchers_id`),
  CONSTRAINT `FK29B423D71BAB9B06` FOREIGN KEY (`Permission_id`) REFERENCES `Permission` (`id`),
  CONSTRAINT `FK29B423D7CDC38D81` FOREIGN KEY (`commandMatchers_id`) REFERENCES `CommandMatcher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Permission_CommandMatcher` WRITE;
INSERT INTO `Permission_CommandMatcher` VALUES (1,1),(2,2),(3,3),(2,4),(3,5),(4,6),(5,7),(5,8),(3,9),(3,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(6,19),(6,20),(6,21),(6,22),(6,23),(6,24),(7,25),(8,26),(7,27),(8,28),(9,29),(10,30),(10,31),(8,32),(8,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(11,42),(11,43),(11,44),(11,45),(11,46),(11,47),(11,48),(11,49),(11,50),(11,51),(11,52),(11,53),(11,54),(11,55),(11,56),(11,57),(11,58),(11,59),(11,60),(11,61),(12,62),(13,63),(12,64),(13,65),(14,66),(15,67),(15,68),(13,69),(13,70),(12,71),(12,72),(12,73),(12,74),(12,75),(12,76),(12,77),(12,78),(16,79),(16,80),(16,81),(16,82),(16,83),(16,84),(16,85),(16,86),(16,87),(16,88),(16,89),(16,90),(16,91),(17,92),(17,93),(17,94),(17,95),(17,96),(17,97),(17,98),(17,99),(17,100),(17,101),(17,102),(17,103),(18,104),(19,105),(20,106),(21,107),(22,108),(21,109),(22,110),(23,111),(24,112),(24,113),(22,114),(22,115),(21,116),(21,117),(21,118),(21,119),(21,120),(21,121),(21,122),(21,123),(25,124),(25,125),(25,126),(25,127),(25,128),(25,129),(26,130),(27,131),(26,132),(27,133),(28,134),(29,135),(29,136),(27,137),(27,138),(26,139),(26,140),(26,141),(26,142),(26,143),(26,144),(26,145),(26,146),(30,147),(31,148),(30,149),(31,150),(30,151),(32,152),(33,153),(32,154),(33,155),(34,156),(35,157),(35,158),(33,159),(33,160),(32,161),(32,162),(32,163),(32,164),(32,165),(32,166),(32,167),(32,168),(36,169),(37,170),(37,171),(36,172),(38,173),(38,174),(38,175),(38,176),(38,177),(38,178),(38,179),(38,180),(38,181),(38,182),(38,183),(38,184),(39,185),(40,186),(41,187),(42,188),(43,189),(44,190),(45,191),(45,192),(45,193),(46,194),(46,195),(47,196),(47,197),(48,198),(49,199),(50,200),(51,201),(52,202),(53,203),(54,204),(55,205),(56,206),(57,207),(58,208),(59,209),(60,210),(61,211),(62,212),(63,213),(64,214),(65,215),(66,216),(67,217),(68,218),(69,219),(70,220),(71,221),(72,222),(73,223),(74,224),(75,225),(76,226),(77,227),(78,228),(79,229),(80,230),(81,231),(82,232),(83,233),(84,234),(85,235),(86,236),(87,237),(88,238),(89,239),(90,240),(91,241),(92,242),(93,243),(94,244),(95,245),(96,246),(97,247),(98,248),(99,249),(100,250),(101,251),(102,252),(103,253),(104,254),(105,255),(105,256),(105,257),(105,258),(105,259),(105,260),(106,261),(105,262),(105,263),(105,264),(105,265),(105,266),(105,267),(105,268),(107,269),(108,270),(109,271),(110,272),(111,273),(112,274),(113,275),(114,276),(115,277),(116,278),(116,279),(116,280),(117,281),(117,282),(117,283),(117,284),(118,285),(118,286),(119,287),(120,288),(118,289),(121,290),(122,291),(123,292),(124,293),(125,294),(126,295),(127,296),(128,297),(128,298),(128,299),(128,300),(128,301),(128,302),(128,303),(128,304),(128,305),(128,306),(128,307),(128,308),(128,309),(128,310),(129,311),(130,312),(130,313),(130,314),(130,315),(129,316),(129,317),(130,318),(131,319),(132,320),(131,321),(132,322),(133,323),(134,324),(134,325),(132,326),(132,327),(131,328),(131,329),(131,330),(131,331),(131,332),(131,333),(131,334),(131,335),(135,336),(135,337),(135,338),(135,339),(135,340),(135,341),(136,342),(137,343),(136,344),(137,345),(138,346),(139,347),(139,348),(137,349),(137,350),(136,351),(136,352),(136,353),(136,354),(136,355),(136,356),(136,357),(136,358),(140,359),(140,360),(140,361),(140,362),(141,363),(142,364),(141,365),(142,366),(143,367),(144,368),(144,369),(142,370),(142,371),(141,372),(141,373),(141,374),(141,375),(141,376),(141,377),(141,378),(141,379),(145,380),(145,381),(145,382),(146,383),(147,384),(146,385),(147,386),(148,387),(149,388),(149,389),(147,390),(147,391),(146,392),(146,393),(146,394),(146,395),(146,396),(146,397),(146,398),(146,399),(150,400),(150,401),(151,402),(150,403),(150,404),(151,405),(152,406),(152,407),(153,408),(152,409),(153,410),(153,411),(152,412),(153,413),(154,414),(155,415),(155,416),(156,417),(155,418),(156,419),(156,420),(156,421),(157,422),(154,423),(158,424),(159,425),(160,426),(160,427),(160,428),(159,429),(159,430),(160,431),(159,432),(161,433),(162,434),(163,435),(164,436),(165,437),(166,438),(167,439),(168,440),(169,441),(170,442),(171,443),(172,444),(173,445),(174,446),(175,447),(176,448),(177,449),(178,450),(179,451),(180,452),(181,453),(182,454),(183,455),(184,456),(185,457),(186,458),(187,459),(188,460),(189,461),(190,462),(191,463),(192,464),(193,465),(194,466),(195,467),(196,468),(197,469),(198,470),(199,471),(200,472),(201,473),(202,474),(203,475),(204,476),(205,477),(206,478),(207,479),(208,480),(209,481),(210,482),(211,483),(212,484),(213,485),(214,486),(215,487),(216,488),(217,489),(218,490),(219,491),(219,492),(219,493),(219,494),(219,495),(219,496),(220,497),(221,498),(222,499),(223,500),(224,501),(225,502),(226,503),(227,504),(228,505),(229,506),(230,507),(231,508),(232,509),(233,510),(234,511),(235,512),(236,513),(237,514),(238,515),(239,516),(240,517),(241,518),(242,519),(243,520),(244,521),(245,522),(246,523),(245,524),(246,525),(247,526),(248,527),(248,528),(246,529),(246,530),(245,531),(245,532),(245,533),(245,534),(245,535),(245,536),(245,537),(245,538),(249,539),(249,540),(249,541),(249,542),(249,543),(249,544),(250,545),(251,546),(250,547),(251,548),(252,549),(253,550),(253,551),(251,552),(251,553),(250,554),(250,555),(250,556),(250,557),(250,558),(250,559),(250,560),(250,561),(254,562),(254,563),(254,564),(254,565),(254,566),(254,567),(254,568),(254,569),(254,570),(254,571),(254,572),(254,573),(254,574),(254,575),(254,576),(254,577),(255,578),(255,579),(255,580),(255,581),(255,582),(255,583),(255,584),(255,585),(255,586),(255,587),(255,588),(255,589),(255,590),(255,591),(255,592),(256,593),(257,594),(256,595),(257,596),(258,597),(259,598),(259,599),(257,600),(257,601),(256,602),(256,603),(256,604),(256,605),(256,606),(256,607),(256,608),(256,609),(260,610),(260,611),(260,612),(260,613),(260,614),(260,615),(260,616),(260,617),(260,618),(260,619),(260,620),(260,621),(261,622),(261,623),(261,624),(261,625),(261,626),(261,627),(261,628),(261,629),(262,630),(263,631);
UNLOCK TABLES;
DROP TABLE IF EXISTS `PreliminaryUser`;
CREATE TABLE `PreliminaryUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creationTime` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `signUpLocale` varchar(255) COLLATE utf8_bin NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `index_name` (`name`),
  KEY `index_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `PreliminaryUser` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Price`;
CREATE TABLE `Price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL,
  `maxOrderSize` int(11) DEFAULT NULL,
  `minOrderSize` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `taxGroup_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK49CC129817FA24F` (`taxGroup_id`),
  CONSTRAINT `FK49CC129817FA24F` FOREIGN KEY (`taxGroup_id`) REFERENCES `TaxGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Price` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Price_Role`;
CREATE TABLE `Price_Role` (
  `Price_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Price_id`,`roles_id`),
  KEY `FK1F8C3DEC2AA2805` (`Price_id`),
  KEY `FK1F8C3DEC8FD5EEFF` (`roles_id`),
  CONSTRAINT `FK1F8C3DEC2AA2805` FOREIGN KEY (`Price_id`) REFERENCES `Price` (`id`),
  CONSTRAINT `FK1F8C3DEC8FD5EEFF` FOREIGN KEY (`roles_id`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Price_Role` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `QuestionGroup`;
CREATE TABLE `QuestionGroup` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0E27A192E512894` (`id`),
  CONSTRAINT `FKF0E27A192E512894` FOREIGN KEY (`id`) REFERENCES `AbstractQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `QuestionGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `QuestionGroupAnswer`;
CREATE TABLE `QuestionGroupAnswer` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9749EF379E50AD70` (`id`),
  CONSTRAINT `FK9749EF379E50AD70` FOREIGN KEY (`id`) REFERENCES `AbstractTypedAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `QuestionGroupAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `QuestionGroupAnswer_AbstractTypedAnswer`;
CREATE TABLE `QuestionGroupAnswer_AbstractTypedAnswer` (
  `QuestionGroupAnswer_id` bigint(20) NOT NULL,
  `value_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`QuestionGroupAnswer_id`,`position`),
  UNIQUE KEY `value_id` (`value_id`),
  KEY `FK16FA3E1EE85C9769` (`QuestionGroupAnswer_id`),
  KEY `FK16FA3E1E4A433EFE` (`value_id`),
  CONSTRAINT `FK16FA3E1E4A433EFE` FOREIGN KEY (`value_id`) REFERENCES `AbstractTypedAnswer` (`id`),
  CONSTRAINT `FK16FA3E1EE85C9769` FOREIGN KEY (`QuestionGroupAnswer_id`) REFERENCES `QuestionGroupAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `QuestionGroupAnswer_AbstractTypedAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `QuestionGroup_AbstractQuestion`;
CREATE TABLE `QuestionGroup_AbstractQuestion` (
  `QuestionGroup_id` bigint(20) NOT NULL,
  `questions_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`QuestionGroup_id`,`position`),
  UNIQUE KEY `questions_id` (`questions_id`),
  KEY `FKC9FACFAE154F5349` (`QuestionGroup_id`),
  KEY `FKC9FACFAE241CACC6` (`questions_id`),
  CONSTRAINT `FKC9FACFAE154F5349` FOREIGN KEY (`QuestionGroup_id`) REFERENCES `QuestionGroup` (`id`),
  CONSTRAINT `FKC9FACFAE241CACC6` FOREIGN KEY (`questions_id`) REFERENCES `AbstractQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `QuestionGroup_AbstractQuestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Questionnaire`;
CREATE TABLE `Questionnaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storageDate` datetime DEFAULT NULL,
  `surveyId` bigint(20) NOT NULL,
  `surveyToken` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Questionnaire` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Questionnaire_AbstractTypedAnswer`;
CREATE TABLE `Questionnaire_AbstractTypedAnswer` (
  `Questionnaire_id` bigint(20) NOT NULL,
  `answers_id` bigint(20) NOT NULL,
  UNIQUE KEY `answers_id` (`answers_id`),
  KEY `FKD3E66E6AD78E897A` (`answers_id`),
  KEY `FKD3E66E6A60DF0729` (`Questionnaire_id`),
  CONSTRAINT `FKD3E66E6A60DF0729` FOREIGN KEY (`Questionnaire_id`) REFERENCES `Questionnaire` (`id`),
  CONSTRAINT `FKD3E66E6AD78E897A` FOREIGN KEY (`answers_id`) REFERENCES `AbstractTypedAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Questionnaire_AbstractTypedAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `RefererTreeAggregation`;
CREATE TABLE `RefererTreeAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `hits` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  `path_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK15EF77978E487982` (`statisticsServer_id`),
  KEY `FK15EF7797A57D4F7A` (`path_id`),
  CONSTRAINT `FK15EF77978E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`),
  CONSTRAINT `FK15EF7797A57D4F7A` FOREIGN KEY (`path_id`) REFERENCES `RefererTreeElement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `RefererTreeAggregation` WRITE;
INSERT INTO `RefererTreeAggregation` VALUES (1,1459382399999,1459296000000,2,1,35),(2,1459382399999,1459296000000,2,1,34),(3,1459468799999,1459382400000,1,1,35),(4,1459468799999,1459382400000,2,1,34),(5,1459468799999,1459382400000,1,1,43),(6,1459468799999,1459382400000,1,1,44),(7,1459468799999,1459382400000,1,1,45),(8,1459555199999,1459468800000,1,1,35),(9,1459555199999,1459468800000,3,1,34),(10,1459555199999,1459468800000,2,1,43),(11,1459555199999,1459468800000,2,1,44),(12,1459555199999,1459468800000,2,1,45);
UNLOCK TABLES;
DROP TABLE IF EXISTS `RefererTreeElement`;
CREATE TABLE `RefererTreeElement` (
  `pathString` varchar(255) COLLATE utf8_bin NOT NULL,
  `rootNode` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `server_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57B09231A6741773` (`id`),
  KEY `FK57B0923173E39345` (`server_id`),
  CONSTRAINT `FK57B0923173E39345` FOREIGN KEY (`server_id`) REFERENCES `StatisticsServer` (`id`),
  CONSTRAINT `FK57B09231A6741773` FOREIGN KEY (`id`) REFERENCES `Node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `RefererTreeElement` WRITE;
INSERT INTO `RefererTreeElement` VALUES ('','',34,1),('?','\0',35,1),('com','\0',43,1),('epam','\0',44,1),('ecsc00104473','\0',45,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `RegexVersion`;
CREATE TABLE `RegexVersion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `regex` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `regex` (`regex`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `RegexVersion` WRITE;
INSERT INTO `RegexVersion` VALUES (9,'FF 2.x','.*Firefox\\/2.*'),(8,'FF 3.0','.*Firefox\\/3\\.0.*'),(7,'FF 3.1','.*Firefox\\/3\\.1.*'),(6,'FF 3.5','.*Firefox\\/3\\.5.*'),(5,'FF 3.6','.*Firefox\\/3\\.6.*'),(4,'IE 5','.*MSIE 5.*'),(3,'IE 6','.*MSIE 6.*'),(2,'IE 7','.*MSIE 7.*'),(1,'IE 8','.*MSIE 8.*'),(11,'Win Vista','.*NT 6\\.0.*'),(10,'Win 7','.*NT 6\\.1.*');
UNLOCK TABLES;
DROP TABLE IF EXISTS `RegistryBundleNode`;
CREATE TABLE `RegistryBundleNode` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8688A1E1D4C659E1` (`id`),
  CONSTRAINT `FK8688A1E1D4C659E1` FOREIGN KEY (`id`) REFERENCES `AbstractRegistryNode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `RegistryBundleNode` WRITE;
INSERT INTO `RegistryBundleNode` VALUES (4),(8),(12),(16);
UNLOCK TABLES;
DROP TABLE IF EXISTS `RegistryLocaleNode`;
CREATE TABLE `RegistryLocaleNode` (
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK826CD3B9D4C659E1` (`id`),
  CONSTRAINT `FK826CD3B9D4C659E1` FOREIGN KEY (`id`) REFERENCES `AbstractRegistryNode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `RegistryLocaleNode` WRITE;
INSERT INTO `RegistryLocaleNode` VALUES ('en_US',5),('fr_FR',6),('de_DE',7),('en_US',9),('fr_FR',10),('de_DE',11),('en_US',13),('fr_FR',14),('de_DE',15),('en_US',17),('fr_FR',18),('de_DE',19),('en_US',26),('en_US',28),('en_US',37),('en_US',38),('en_US',39),('en_US',40);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Representative`;
CREATE TABLE `Representative` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contactPerson` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `faxNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobilePhoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `addressAffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nameAffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `representsCountry` varchar(255) COLLATE utf8_bin NOT NULL,
  `representsRegion` varchar(255) COLLATE utf8_bin NOT NULL,
  `representsState` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Representative` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Retailer`;
CREATE TABLE `Retailer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contactPerson` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `faxNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobilePhoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `customerNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `retailStoreFilter` tinyblob,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `webShopFilter` tinyblob,
  `logo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF0702D10B89C89B4` (`logo_id`),
  CONSTRAINT `FKF0702D10B89C89B4` FOREIGN KEY (`logo_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Retailer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `triggeredRoles_id` bigint(20) DEFAULT NULL,
  `selfViewRoles_id` bigint(20) DEFAULT NULL,
  `selfEditRoles_id` bigint(20) DEFAULT NULL,
  `adminViewRoles_id` bigint(20) DEFAULT NULL,
  `adminEditRoles_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `FK26F49671CCC480` (`adminViewRoles_id`),
  KEY `FK26F496CBCE0763` (`triggeredRoles_id`),
  KEY `FK26F4967BA17CFD` (`selfViewRoles_id`),
  KEY `FK26F4961AE1C2E5` (`adminEditRoles_id`),
  KEY `FK26F49624B67B62` (`selfEditRoles_id`),
  CONSTRAINT `FK26F4961AE1C2E5` FOREIGN KEY (`adminEditRoles_id`) REFERENCES `AbstractAttribute` (`id`),
  CONSTRAINT `FK26F49624B67B62` FOREIGN KEY (`selfEditRoles_id`) REFERENCES `AbstractAttribute` (`id`),
  CONSTRAINT `FK26F49671CCC480` FOREIGN KEY (`adminViewRoles_id`) REFERENCES `AbstractAttribute` (`id`),
  CONSTRAINT `FK26F4967BA17CFD` FOREIGN KEY (`selfViewRoles_id`) REFERENCES `AbstractAttribute` (`id`),
  CONSTRAINT `FK26F496CBCE0763` FOREIGN KEY (`triggeredRoles_id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Role` WRITE;
INSERT INTO `Role` VALUES (1,'~Everybody','',NULL,NULL,NULL,NULL,NULL),(2,'~StatisticsServer.???','',NULL,NULL,NULL,NULL,NULL),(3,'~StatisticsServer.192.168.1.3','',NULL,NULL,NULL,NULL,NULL),(4,'~StatisticsServer.localhost','',NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
DROP TABLE IF EXISTS `Role_Group`;
CREATE TABLE `Role_Group` (
  `Role_id` bigint(20) NOT NULL,
  `groups_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Role_id`,`groups_id`),
  KEY `FKE1411576FCE002B9` (`groups_id`),
  KEY `FKE1411576F1BD76A6` (`Role_id`),
  CONSTRAINT `FKE1411576F1BD76A6` FOREIGN KEY (`Role_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `FKE1411576FCE002B9` FOREIGN KEY (`groups_id`) REFERENCES `Group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Role_Group` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Role_Permission`;
CREATE TABLE `Role_Permission` (
  `Role_id` bigint(20) NOT NULL,
  `permissions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Role_id`,`permissions_id`),
  KEY `FKF8A56938F1BD76A6` (`Role_id`),
  KEY `FKF8A569381B59F431` (`permissions_id`),
  CONSTRAINT `FKF8A569381B59F431` FOREIGN KEY (`permissions_id`) REFERENCES `Permission` (`id`),
  CONSTRAINT `FKF8A56938F1BD76A6` FOREIGN KEY (`Role_id`) REFERENCES `Role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Role_Permission` WRITE;
INSERT INTO `Role_Permission` VALUES (1,18),(1,40);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ScreenResolution`;
CREATE TABLE `ScreenResolution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8_bin NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `x` (`x`,`y`,`format`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ScreenResolution` WRITE;
INSERT INTO `ScreenResolution` VALUES (2,'WIDE',1600,900),(3,'WIDE',1680,1050),(1,'WIDE',1920,1080);
UNLOCK TABLES;
DROP TABLE IF EXISTS `ScreenResolutionPerVisitAggregation`;
CREATE TABLE `ScreenResolutionPerVisitAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  `screenResolution_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8C8EE65C8E487982` (`statisticsServer_id`),
  KEY `FK8C8EE65C33B60C42` (`screenResolution_id`),
  CONSTRAINT `FK8C8EE65C33B60C42` FOREIGN KEY (`screenResolution_id`) REFERENCES `ScreenResolution` (`id`),
  CONSTRAINT `FK8C8EE65C8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ScreenResolutionPerVisitAggregation` WRITE;
INSERT INTO `ScreenResolutionPerVisitAggregation` VALUES (1,1459382399999,1459296000000,1,1,1),(2,1459382399999,1459296000000,1,1,2),(3,1459468799999,1459382400000,2,1,2),(4,1459555199999,1459468800000,1,1,3),(5,1459555199999,1459468800000,2,1,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `SearchFailure`;
CREATE TABLE `SearchFailure` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `lastRecurrence` bigint(20) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recurrences` bigint(20) DEFAULT NULL,
  `searchQuery` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SearchFailure` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SearchSuggestion`;
CREATE TABLE `SearchSuggestion` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `importance` double DEFAULT NULL,
  `lastRecurrence` bigint(20) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recurrences` bigint(20) DEFAULT NULL,
  `searchQuery` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `index_searchQuery` (`searchQuery`),
  KEY `index_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SearchSuggestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SectionAttribute`;
CREATE TABLE `SectionAttribute` (
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK28CE815765F7CF3D` (`check_id`),
  KEY `FK28CE81578721794A` (`id`),
  CONSTRAINT `FK28CE815765F7CF3D` FOREIGN KEY (`check_id`) REFERENCES `AbstractTypedCheck` (`id`),
  CONSTRAINT `FK28CE81578721794A` FOREIGN KEY (`id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SectionAttribute` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SectionValue`;
CREATE TABLE `SectionValue` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3009FDAC1174219F` (`id`),
  KEY `FK3009FDAC9A95DCA0` (`attribute_id`),
  CONSTRAINT `FK3009FDAC1174219F` FOREIGN KEY (`id`) REFERENCES `AbstractValue` (`id`),
  CONSTRAINT `FK3009FDAC9A95DCA0` FOREIGN KEY (`attribute_id`) REFERENCES `SectionAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SectionValue` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectQuestion`;
CREATE TABLE `SelectQuestion` (
  `customValue` bit(1) NOT NULL,
  `noOfSelects` int(11) NOT NULL,
  `selectExactNoOfSelects` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB78BE5222E512894` (`id`),
  CONSTRAINT `FKB78BE5222E512894` FOREIGN KEY (`id`) REFERENCES `AbstractQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectQuestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectQuestionAnswer`;
CREATE TABLE `SelectQuestionAnswer` (
  `customValue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK120F2F809E50AD70` (`id`),
  CONSTRAINT `FK120F2F809E50AD70` FOREIGN KEY (`id`) REFERENCES `AbstractTypedAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectQuestionAnswer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectQuestionAnswer_values`;
CREATE TABLE `SelectQuestionAnswer_values` (
  `SelectQuestionAnswer_id` bigint(20) NOT NULL,
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK739FAC15BBB92CB` (`SelectQuestionAnswer_id`),
  CONSTRAINT `FK739FAC15BBB92CB` FOREIGN KEY (`SelectQuestionAnswer_id`) REFERENCES `SelectQuestionAnswer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectQuestionAnswer_values` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectQuestion_selectValues`;
CREATE TABLE `SelectQuestion_selectValues` (
  `SelectQuestion_id` bigint(20) NOT NULL,
  `selectValue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  KEY `FK87797D3B4CDF002B` (`SelectQuestion_id`),
  CONSTRAINT `FK87797D3B4CDF002B` FOREIGN KEY (`SelectQuestion_id`) REFERENCES `SelectQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectQuestion_selectValues` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Selection`;
CREATE TABLE `Selection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Selection` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectionAttribute`;
CREATE TABLE `SelectionAttribute` (
  `multiselect` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBE5E129065F7CF3D` (`check_id`),
  KEY `FKBE5E12908721794A` (`id`),
  CONSTRAINT `FKBE5E129065F7CF3D` FOREIGN KEY (`check_id`) REFERENCES `AbstractTypedCheck` (`id`),
  CONSTRAINT `FKBE5E12908721794A` FOREIGN KEY (`id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectionAttribute` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SelectionValue`;
CREATE TABLE `SelectionValue` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) DEFAULT NULL,
  `value_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK44FD13651174219F` (`id`),
  KEY `FK44FD13651411AF19` (`attribute_id`),
  KEY `FK44FD1365454D0DD5` (`value_id`),
  CONSTRAINT `FK44FD13651174219F` FOREIGN KEY (`id`) REFERENCES `AbstractValue` (`id`),
  CONSTRAINT `FK44FD13651411AF19` FOREIGN KEY (`attribute_id`) REFERENCES `SelectionAttribute` (`id`),
  CONSTRAINT `FK44FD1365454D0DD5` FOREIGN KEY (`value_id`) REFERENCES `Selection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SelectionValue` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopContent`;
CREATE TABLE `ShopContent` (
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDC1B7883B6A49B6D` (`id`),
  CONSTRAINT `FKDC1B7883B6A49B6D` FOREIGN KEY (`id`) REFERENCES `StoreContent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopContent` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopContent_Price`;
CREATE TABLE `ShopContent_Price` (
  `ShopContent_id` bigint(20) NOT NULL,
  `prices_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ShopContent_id`,`prices_id`),
  UNIQUE KEY `prices_id` (`prices_id`),
  KEY `FKC02AEE6DCA2A7564` (`prices_id`),
  KEY `FKC02AEE6D43CB965` (`ShopContent_id`),
  CONSTRAINT `FKC02AEE6D43CB965` FOREIGN KEY (`ShopContent_id`) REFERENCES `ShopContent` (`id`),
  CONSTRAINT `FKC02AEE6DCA2A7564` FOREIGN KEY (`prices_id`) REFERENCES `Price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopContent_Price` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopContent_ShopVariant`;
CREATE TABLE `ShopContent_ShopVariant` (
  `ShopContent_id` bigint(20) NOT NULL,
  `shopVariants_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ShopContent_id`,`shopVariants_id`),
  UNIQUE KEY `shopVariants_id` (`shopVariants_id`),
  KEY `FK90217ED343CB965` (`ShopContent_id`),
  KEY `FK90217ED37CBC8510` (`shopVariants_id`),
  CONSTRAINT `FK90217ED343CB965` FOREIGN KEY (`ShopContent_id`) REFERENCES `ShopContent` (`id`),
  CONSTRAINT `FK90217ED37CBC8510` FOREIGN KEY (`shopVariants_id`) REFERENCES `ShopVariant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopContent_ShopVariant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopSettings`;
CREATE TABLE `ShopSettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_bin NOT NULL,
  `locale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `netBased` bit(1) NOT NULL,
  `bundle_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `bundle_id` (`bundle_id`,`locale`),
  KEY `FK1EA6F9591AF247EF` (`bundle_id`),
  CONSTRAINT `FK1EA6F9591AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopSettings` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopVariant`;
CREATE TABLE `ShopVariant` (
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB181548F8C0A7779` (`id`),
  CONSTRAINT `FKB181548F8C0A7779` FOREIGN KEY (`id`) REFERENCES `StoreVariant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopVariant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ShopVariant_Price`;
CREATE TABLE `ShopVariant_Price` (
  `ShopVariant_id` bigint(20) NOT NULL,
  `prices_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ShopVariant_id`,`prices_id`),
  UNIQUE KEY `prices_id` (`prices_id`),
  KEY `FK8B869179CA2A7564` (`prices_id`),
  KEY `FK8B8691793224ADE5` (`ShopVariant_id`),
  CONSTRAINT `FK8B8691793224ADE5` FOREIGN KEY (`ShopVariant_id`) REFERENCES `ShopVariant` (`id`),
  CONSTRAINT `FK8B869179CA2A7564` FOREIGN KEY (`prices_id`) REFERENCES `Price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `ShopVariant_Price` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Sitemap`;
CREATE TABLE `Sitemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `rootNode_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `locale` (`locale`),
  KEY `FKE06444955BFC34CB` (`rootNode_id`),
  KEY `idx_locale` (`locale`),
  CONSTRAINT `FKE06444955BFC34CB` FOREIGN KEY (`rootNode_id`) REFERENCES `SitemapNode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Sitemap` WRITE;
INSERT INTO `Sitemap` VALUES (1,'fr_FR',1),(2,'de_DE',2),(3,'en_US',3);
UNLOCK TABLES;
DROP TABLE IF EXISTS `SitemapNode`;
CREATE TABLE `SitemapNode` (
  `contentId` bigint(20) DEFAULT NULL,
  `endDate` bigint(20) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `startDate` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  `visible` bit(1) NOT NULL,
  `id` bigint(20) NOT NULL,
  `sectionTag_id` bigint(20) DEFAULT NULL,
  `view_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD4FB143753F9A4EA` (`view_id`),
  KEY `FKD4FB1437A6741773` (`id`),
  KEY `FKD4FB1437B05DD0AD` (`sectionTag_id`),
  CONSTRAINT `FKD4FB143753F9A4EA` FOREIGN KEY (`view_id`) REFERENCES `View` (`id`),
  CONSTRAINT `FKD4FB1437A6741773` FOREIGN KEY (`id`) REFERENCES `Node` (`id`),
  CONSTRAINT `FKD4FB1437B05DD0AD` FOREIGN KEY (`sectionTag_id`) REFERENCES `SitemapSectionTag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SitemapNode` WRITE;
INSERT INTO `SitemapNode` VALUES (NULL,NULL,'fr_FR','Autogenerated Node',NULL,'DEFAULT','\0',1,NULL,NULL),(NULL,NULL,'de_DE','Autogenerated Node',NULL,'DEFAULT','\0',2,NULL,NULL),(5,NULL,'en_US','Autogenerated Node',NULL,'DEFAULT','',3,NULL,4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `SitemapNode_Role`;
CREATE TABLE `SitemapNode_Role` (
  `SitemapNode_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`SitemapNode_id`,`roles_id`),
  KEY `FK940DA39EEF67A598` (`SitemapNode_id`),
  KEY `FK940DA39E8FD5EEFF` (`roles_id`),
  CONSTRAINT `FK940DA39E8FD5EEFF` FOREIGN KEY (`roles_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK940DA39EEF67A598` FOREIGN KEY (`SitemapNode_id`) REFERENCES `SitemapNode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SitemapNode_Role` WRITE;
INSERT INTO `SitemapNode_Role` VALUES (3,1),(3,2),(3,3),(3,4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `SitemapNode_attributes`;
CREATE TABLE `SitemapNode_attributes` (
  `SitemapNode_id` bigint(20) NOT NULL,
  `attributes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `attributes_KEY` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`SitemapNode_id`,`attributes_KEY`),
  KEY `FKB146F25FEF67A598` (`SitemapNode_id`),
  CONSTRAINT `FKB146F25FEF67A598` FOREIGN KEY (`SitemapNode_id`) REFERENCES `SitemapNode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SitemapNode_attributes` WRITE;
INSERT INTO `SitemapNode_attributes` VALUES (3,'grey','style'),(3,'theme group','theme');
UNLOCK TABLES;
DROP TABLE IF EXISTS `SitemapSectionTag`;
CREATE TABLE `SitemapSectionTag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SitemapSectionTag` WRITE;
INSERT INTO `SitemapSectionTag` VALUES (2,'Tab_002'),(1,'Tag_001');
UNLOCK TABLES;
DROP TABLE IF EXISTS `StatisticsServer`;
CREATE TABLE `StatisticsServer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowProxy` bit(1) NOT NULL,
  `hostName` varchar(255) COLLATE utf8_bin NOT NULL,
  `milliseconds` bigint(20) DEFAULT NULL,
  `pathSeparator` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `hostName` (`hostName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StatisticsServer` WRITE;
INSERT INTO `StatisticsServer` VALUES (1,'\0','???',259200000,'§'),(2,'\0','192.168.1.3',NULL,'#'),(3,'\0','localhost',NULL,'___');
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreContent`;
CREATE TABLE `StoreContent` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `orderCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `mainImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK80519878CB21ED0E` (`mainImage_id`),
  KEY `FK80519878B3E279CF` (`id`),
  KEY `addIdx_orderCode` (`orderCode`),
  CONSTRAINT `FK80519878B3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK80519878CB21ED0E` FOREIGN KEY (`mainImage_id`) REFERENCES `StoreContentImageGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreContent` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreContentImageGroup`;
CREATE TABLE `StoreContentImageGroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `bundle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKC3E73C7C1AF247EF` (`bundle_id`),
  CONSTRAINT `FKC3E73C7C1AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreContentImageGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreContentImageGroup_VirtualFile`;
CREATE TABLE `StoreContentImageGroup_VirtualFile` (
  `StoreContentImageGroup_id` bigint(20) NOT NULL,
  `imageVersions_id` bigint(20) NOT NULL,
  `imageVersions_KEY` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`StoreContentImageGroup_id`,`imageVersions_KEY`),
  KEY `FK619873C426901594` (`StoreContentImageGroup_id`),
  KEY `FK619873C4296A6A89` (`imageVersions_id`),
  CONSTRAINT `FK619873C426901594` FOREIGN KEY (`StoreContentImageGroup_id`) REFERENCES `StoreContentImageGroup` (`id`),
  CONSTRAINT `FK619873C4296A6A89` FOREIGN KEY (`imageVersions_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreContentImageGroup_VirtualFile` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreContent_StoreContentImageGroup`;
CREATE TABLE `StoreContent_StoreContentImageGroup` (
  `StoreContent_id` bigint(20) NOT NULL,
  `alternativeImages_id` bigint(20) NOT NULL,
  PRIMARY KEY (`StoreContent_id`,`alternativeImages_id`),
  KEY `FKE6D7C23129F6094` (`StoreContent_id`),
  KEY `FKE6D7C23807A910B` (`alternativeImages_id`),
  CONSTRAINT `FKE6D7C23129F6094` FOREIGN KEY (`StoreContent_id`) REFERENCES `StoreContent` (`id`),
  CONSTRAINT `FKE6D7C23807A910B` FOREIGN KEY (`alternativeImages_id`) REFERENCES `StoreContentImageGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreContent_StoreContentImageGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreContent_StoreVariant`;
CREATE TABLE `StoreContent_StoreVariant` (
  `StoreContent_id` bigint(20) NOT NULL,
  `storeVariants_id` bigint(20) NOT NULL,
  PRIMARY KEY (`StoreContent_id`,`storeVariants_id`),
  UNIQUE KEY `storeVariants_id` (`storeVariants_id`),
  KEY `FKB352C8EB129F6094` (`StoreContent_id`),
  KEY `FKB352C8EB6733C949` (`storeVariants_id`),
  CONSTRAINT `FKB352C8EB129F6094` FOREIGN KEY (`StoreContent_id`) REFERENCES `StoreContent` (`id`),
  CONSTRAINT `FKB352C8EB6733C949` FOREIGN KEY (`storeVariants_id`) REFERENCES `StoreVariant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreContent_StoreVariant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreVariant`;
CREATE TABLE `StoreVariant` (
  `summary` longtext COLLATE utf8_bin,
  `description` longtext COLLATE utf8_bin NOT NULL,
  `orderCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `content_id` bigint(20) NOT NULL,
  `mainImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK55B77484CB21ED0E` (`mainImage_id`),
  KEY `FK55B77484894855DB` (`id`),
  KEY `FK55B77484C3A72B55` (`content_id`),
  KEY `addIdx_orderCode` (`orderCode`),
  CONSTRAINT `FK55B77484894855DB` FOREIGN KEY (`id`) REFERENCES `Variant` (`id`),
  CONSTRAINT `FK55B77484C3A72B55` FOREIGN KEY (`content_id`) REFERENCES `Content` (`id`),
  CONSTRAINT `FK55B77484CB21ED0E` FOREIGN KEY (`mainImage_id`) REFERENCES `StoreContentImageGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreVariant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StoreVariant_StoreContentImageGroup`;
CREATE TABLE `StoreVariant_StoreContentImageGroup` (
  `StoreVariant_id` bigint(20) NOT NULL,
  `alternativeImages_id` bigint(20) NOT NULL,
  PRIMARY KEY (`StoreVariant_id`,`alternativeImages_id`),
  KEY `FK1E42D29740875514` (`StoreVariant_id`),
  KEY `FK1E42D297807A910B` (`alternativeImages_id`),
  CONSTRAINT `FK1E42D29740875514` FOREIGN KEY (`StoreVariant_id`) REFERENCES `StoreVariant` (`id`),
  CONSTRAINT `FK1E42D297807A910B` FOREIGN KEY (`alternativeImages_id`) REFERENCES `StoreContentImageGroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StoreVariant_StoreContentImageGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StringAttribute`;
CREATE TABLE `StringAttribute` (
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `check_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK94E3A56B65F7CF3D` (`check_id`),
  KEY `FK94E3A56B8721794A` (`id`),
  CONSTRAINT `FK94E3A56B65F7CF3D` FOREIGN KEY (`check_id`) REFERENCES `AbstractTypedCheck` (`id`),
  CONSTRAINT `FK94E3A56B8721794A` FOREIGN KEY (`id`) REFERENCES `AbstractAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StringAttribute` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `StringValue`;
CREATE TABLE `StringValue` (
  `value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8DC4BC01174219F` (`id`),
  KEY `FK8DC4BC03CE3CBFE` (`attribute_id`),
  CONSTRAINT `FK8DC4BC01174219F` FOREIGN KEY (`id`) REFERENCES `AbstractValue` (`id`),
  CONSTRAINT `FK8DC4BC03CE3CBFE` FOREIGN KEY (`attribute_id`) REFERENCES `StringAttribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `StringValue` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Survey`;
CREATE TABLE `Survey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anonymous` bit(1) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `keepInSession` bit(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `requireAllRoles` bit(1) NOT NULL,
  `requireSurveyToken` bit(1) NOT NULL,
  `singleStepSave` bit(1) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Survey` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `SurveyToken`;
CREATE TABLE `SurveyToken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `surveyId` bigint(20) NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  `used` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `SurveyToken` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Survey_AbstractQuestion`;
CREATE TABLE `Survey_AbstractQuestion` (
  `Survey_id` bigint(20) NOT NULL,
  `questions_id` bigint(20) NOT NULL,
  UNIQUE KEY `questions_id` (`questions_id`),
  KEY `FK59B0846D241CACC6` (`questions_id`),
  KEY `FK59B0846D1F690A0B` (`Survey_id`),
  CONSTRAINT `FK59B0846D1F690A0B` FOREIGN KEY (`Survey_id`) REFERENCES `Survey` (`id`),
  CONSTRAINT `FK59B0846D241CACC6` FOREIGN KEY (`questions_id`) REFERENCES `AbstractQuestion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Survey_AbstractQuestion` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Survey_roleIds`;
CREATE TABLE `Survey_roleIds` (
  `Survey_id` bigint(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  KEY `FK9F43629D1F690A0B` (`Survey_id`),
  CONSTRAINT `FK9F43629D1F690A0B` FOREIGN KEY (`Survey_id`) REFERENCES `Survey` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Survey_roleIds` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `TaxGroup`;
CREATE TABLE `TaxGroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `percentage` bigint(20) NOT NULL,
  `shopSettings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `shopSettings_id` (`shopSettings_id`,`percentage`),
  UNIQUE KEY `shopSettings_id_2` (`shopSettings_id`,`name`),
  KEY `FKF202BDB4A9FDDEF` (`shopSettings_id`),
  CONSTRAINT `FKF202BDB4A9FDDEF` FOREIGN KEY (`shopSettings_id`) REFERENCES `ShopSettings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `TaxGroup` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `URLContent`;
CREATE TABLE `URLContent` (
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `metaKeywords` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `summary` longtext COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD173C2AB3E279CF` (`id`),
  CONSTRAINT `FKD173C2AB3E279CF` FOREIGN KEY (`id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `URLContent` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `creationTime` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `lastModificationTime` datetime NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `signUpLocale` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_bin NOT NULL,
  `superuser` bit(1) NOT NULL,
  `webdavEnabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `name` (`name`),
  KEY `index_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `User` WRITE;
INSERT INTO `User` VALUES (1,'root','2016-03-18 18:03:21','user@domain','2016-04-01 15:16:39','2016-03-18 18:03:21','422CCAECC1850E73598FEA2386921E96FFDEDEEF7113CB0656C413F90C2D5ADBB4FE2B6ABB00ADDED1613D300F2FA25C69C2C7180867F80D8D501ED9861A6065',NULL,'ACTIVE','',''),(2,'Bill','2016-03-28 14:59:03','bill@pulse.com','2016-04-01 12:58:16','2016-03-29 11:20:31','A10D01A2A0ACF51AB5F8570351B35E8C69830BE2E8619AFB4D9248583BE8FE6685FF40BB0CD25B3528F4B4FFF478BB5AEB6C0786FBD30A1D26F8EBA11AD22EBD',NULL,'ACTIVE','\0',''),(3,'Tom','2016-03-28 16:54:25','tom@pulse.com','2016-04-01 13:01:22','2016-03-28 16:54:25','A10D01A2A0ACF51AB5F8570351B35E8C69830BE2E8619AFB4D9248583BE8FE6685FF40BB0CD25B3528F4B4FFF478BB5AEB6C0786FBD30A1D26F8EBA11AD22EBD',NULL,'ACTIVE','\0',''),(4,'John','2016-03-29 10:54:51','john@pulse.com','2016-04-01 13:01:23','2016-03-29 10:54:51','A10D01A2A0ACF51AB5F8570351B35E8C69830BE2E8619AFB4D9248583BE8FE6685FF40BB0CD25B3528F4B4FFF478BB5AEB6C0786FBD30A1D26F8EBA11AD22EBD',NULL,'ACTIVE','\0',''),(5,'Bob','2016-03-29 10:57:17','bob@pulse.com','2016-04-01 13:00:23','2016-03-29 11:21:18','A10D01A2A0ACF51AB5F8570351B35E8C69830BE2E8619AFB4D9248583BE8FE6685FF40BB0CD25B3528F4B4FFF478BB5AEB6C0786FBD30A1D26F8EBA11AD22EBD',NULL,'ACTIVE','\0','');
UNLOCK TABLES;
DROP TABLE IF EXISTS `UserAgent`;
CREATE TABLE `UserAgent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `category` varchar(255) COLLATE utf8_bin NOT NULL,
  `regex` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `regex` (`regex`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `UserAgent` WRITE;
INSERT INTO `UserAgent` VALUES (1,'unknown','unknown',''),(2,'IE other','Microsoft','.*MSIE.*'),(3,'FF other','Firefox','.*Firefox.*'),(4,'Safari','Apple','.*Safari.*');
UNLOCK TABLES;
DROP TABLE IF EXISTS `UserAgentPerVisitAggregation`;
CREATE TABLE `UserAgentPerVisitAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  `counted_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK521E779A8E487982` (`statisticsServer_id`),
  KEY `FK521E779A296EA9E` (`counted_id`),
  CONSTRAINT `FK521E779A296EA9E` FOREIGN KEY (`counted_id`) REFERENCES `UserAgent` (`id`),
  CONSTRAINT `FK521E779A8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `UserAgentPerVisitAggregation` WRITE;
INSERT INTO `UserAgentPerVisitAggregation` VALUES (1,1459382399999,1459296000000,1,1,3),(2,1459382399999,1459296000000,1,1,4),(3,1459468799999,1459382400000,2,1,4),(4,1459555199999,1459468800000,3,1,4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `UserAgentPerVisitAggregation_UserAgentVersionCounter`;
CREATE TABLE `UserAgentPerVisitAggregation_UserAgentVersionCounter` (
  `UserAgentPerVisitAggregation_id` bigint(20) NOT NULL,
  `counters_id` bigint(20) NOT NULL,
  PRIMARY KEY (`UserAgentPerVisitAggregation_id`,`counters_id`),
  UNIQUE KEY `counters_id` (`counters_id`),
  KEY `FKCF7BB0D95E85B98D` (`counters_id`),
  KEY `FKCF7BB0D9DEA5186E` (`UserAgentPerVisitAggregation_id`),
  CONSTRAINT `FKCF7BB0D95E85B98D` FOREIGN KEY (`counters_id`) REFERENCES `UserAgentVersionCounter` (`id`),
  CONSTRAINT `FKCF7BB0D9DEA5186E` FOREIGN KEY (`UserAgentPerVisitAggregation_id`) REFERENCES `UserAgentPerVisitAggregation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `UserAgentPerVisitAggregation_UserAgentVersionCounter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `UserAgentVersionCounter`;
CREATE TABLE `UserAgentVersionCounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `counter` int(11) NOT NULL,
  `abstractAggregation_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF9EFE27E108C45DB` (`version_id`),
  KEY `FKF9EFE27E2D2B70A8` (`abstractAggregation_id`),
  CONSTRAINT `FKF9EFE27E108C45DB` FOREIGN KEY (`version_id`) REFERENCES `RegexVersion` (`id`),
  CONSTRAINT `FKF9EFE27E2D2B70A8` FOREIGN KEY (`abstractAggregation_id`) REFERENCES `UserAgentPerVisitAggregation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `UserAgentVersionCounter` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `UserAgent_RegexVersion`;
CREATE TABLE `UserAgent_RegexVersion` (
  `UserAgent_id` bigint(20) NOT NULL,
  `versions_id` bigint(20) NOT NULL,
  UNIQUE KEY `versions_id` (`versions_id`),
  KEY `FK469498F661A3E938` (`versions_id`),
  KEY `FK469498F665EE42F2` (`UserAgent_id`),
  CONSTRAINT `FK469498F661A3E938` FOREIGN KEY (`versions_id`) REFERENCES `RegexVersion` (`id`),
  CONSTRAINT `FK469498F665EE42F2` FOREIGN KEY (`UserAgent_id`) REFERENCES `UserAgent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `UserAgent_RegexVersion` WRITE;
INSERT INTO `UserAgent_RegexVersion` VALUES (2,1),(2,2),(2,3),(2,4),(3,5),(3,6),(3,7),(3,8),(3,9);
UNLOCK TABLES;
DROP TABLE IF EXISTS `User_Group`;
CREATE TABLE `User_Group` (
  `User_id` bigint(20) NOT NULL,
  `groups_id` bigint(20) NOT NULL,
  PRIMARY KEY (`User_id`,`groups_id`),
  KEY `FKE7B7ED0BFA20D266` (`User_id`),
  KEY `FKE7B7ED0BFCE002B9` (`groups_id`),
  CONSTRAINT `FKE7B7ED0BFA20D266` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKE7B7ED0BFCE002B9` FOREIGN KEY (`groups_id`) REFERENCES `Group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `User_Group` WRITE;
INSERT INTO `User_Group` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45);
UNLOCK TABLES;
DROP TABLE IF EXISTS `User_Permission`;
CREATE TABLE `User_Permission` (
  `User_id` bigint(20) NOT NULL,
  `permissions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`User_id`,`permissions_id`),
  KEY `FK6C1F06C3FA20D266` (`User_id`),
  KEY `FK6C1F06C31B59F431` (`permissions_id`),
  CONSTRAINT `FK6C1F06C31B59F431` FOREIGN KEY (`permissions_id`) REFERENCES `Permission` (`id`),
  CONSTRAINT `FK6C1F06C3FA20D266` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `User_Permission` WRITE;
INSERT INTO `User_Permission` VALUES (2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,43),(2,45),(2,47),(2,48),(2,49),(2,50),(2,56),(2,57),(2,59),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(2,94),(2,95),(2,96),(2,97),(2,98),(2,99),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,116),(2,128),(2,131),(2,132),(2,133),(2,134),(2,135),(2,136),(2,137),(2,138),(2,139),(2,140),(2,141),(2,142),(2,143),(2,144),(2,150),(2,151),(2,152),(2,153),(2,154),(2,155),(2,156),(2,157),(2,158),(2,159),(2,160),(2,161),(2,162),(2,163),(2,164),(2,165),(2,166),(2,167),(2,168),(2,169),(2,170),(2,171),(2,172),(2,173),(2,174),(2,175),(2,176),(2,177),(2,178),(2,179),(2,180),(2,181),(2,182),(2,183),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,43),(4,45),(4,56),(4,59),(4,99),(4,100),(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,116),(4,128),(4,131),(4,132),(4,133),(4,134),(4,135),(4,136),(4,137),(4,138),(4,139),(4,140),(4,141),(4,142),(4,143),(4,144),(4,150),(4,151),(4,152),(4,153),(4,155),(4,156),(4,157),(4,159),(4,160),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,43),(5,45),(5,56),(5,59),(5,99),(5,100),(5,101),(5,102),(5,103),(5,104),(5,105),(5,106),(5,107),(5,108),(5,116),(5,128),(5,131),(5,132),(5,133),(5,134),(5,135),(5,136),(5,137),(5,138),(5,139),(5,140),(5,141),(5,142),(5,143),(5,144),(5,150),(5,151),(5,152),(5,153),(5,155),(5,156),(5,157),(5,159),(5,160);
UNLOCK TABLES;
DROP TABLE IF EXISTS `User_Role`;
CREATE TABLE `User_Role` (
  `User_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`User_id`,`roles_id`),
  KEY `FK8B9F886AFA20D266` (`User_id`),
  KEY `FK8B9F886A8FD5EEFF` (`roles_id`),
  CONSTRAINT `FK8B9F886A8FD5EEFF` FOREIGN KEY (`roles_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK8B9F886AFA20D266` FOREIGN KEY (`User_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `User_Role` WRITE;
INSERT INTO `User_Role` VALUES (2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `VFSDeferredDelete`;
CREATE TABLE `VFSDeferredDelete` (
  `id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `uri` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VFSDeferredDelete` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Variant`;
CREATE TABLE `Variant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `parentVariant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7155A86521EEDBFF` (`parentVariant_id`),
  CONSTRAINT `FK7155A86521EEDBFF` FOREIGN KEY (`parentVariant_id`) REFERENCES `Variant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Variant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Variant_Attachment`;
CREATE TABLE `Variant_Attachment` (
  `Variant_id` bigint(20) NOT NULL,
  `attachments_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Variant_id`,`attachments_id`),
  UNIQUE KEY `attachments_id` (`attachments_id`),
  KEY `FKB7CF215DF541BB12` (`attachments_id`),
  KEY `FKB7CF215DF18F1FD5` (`Variant_id`),
  CONSTRAINT `FKB7CF215DF18F1FD5` FOREIGN KEY (`Variant_id`) REFERENCES `Variant` (`id`),
  CONSTRAINT `FKB7CF215DF541BB12` FOREIGN KEY (`attachments_id`) REFERENCES `Attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Variant_Attachment` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Variant_Variant`;
CREATE TABLE `Variant_Variant` (
  `Variant_id` bigint(20) NOT NULL,
  `variants_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Variant_id`,`variants_id`),
  UNIQUE KEY `variants_id` (`variants_id`),
  KEY `FKB212C28B29E5472C` (`variants_id`),
  KEY `FKB212C28BF18F1FD5` (`Variant_id`),
  CONSTRAINT `FKB212C28B29E5472C` FOREIGN KEY (`variants_id`) REFERENCES `Variant` (`id`),
  CONSTRAINT `FKB212C28BF18F1FD5` FOREIGN KEY (`Variant_id`) REFERENCES `Variant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Variant_Variant` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `Variant_VirtualFile`;
CREATE TABLE `Variant_VirtualFile` (
  `variant_id` bigint(20) NOT NULL,
  `virtualfile_id` bigint(20) NOT NULL,
  PRIMARY KEY (`variant_id`,`virtualfile_id`),
  KEY `FK32FF4A2DEC6EEAD8` (`virtualfile_id`),
  KEY `FK32FF4A2DF18F1FD5` (`variant_id`),
  CONSTRAINT `FK32FF4A2DEC6EEAD8` FOREIGN KEY (`virtualfile_id`) REFERENCES `VirtualFile` (`id`),
  CONSTRAINT `FK32FF4A2DF18F1FD5` FOREIGN KEY (`variant_id`) REFERENCES `Variant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `Variant_VirtualFile` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `View`;
CREATE TABLE `View` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `commandBuilder_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK28AEC570B91909` (`commandBuilder_id`),
  CONSTRAINT `FK28AEC570B91909` FOREIGN KEY (`commandBuilder_id`) REFERENCES `CommandBuilder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `View` WRITE;
INSERT INTO `View` VALUES (4,'CMSDisplay',4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `View_Content`;
CREATE TABLE `View_Content` (
  `content_id` bigint(20) DEFAULT NULL,
  `view_id` bigint(20) NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `FK1CC38CDF53F9A4EA` (`view_id`),
  KEY `FK1CC38CDFC3A72B55` (`content_id`),
  CONSTRAINT `FK1CC38CDF53F9A4EA` FOREIGN KEY (`view_id`) REFERENCES `View` (`id`),
  CONSTRAINT `FK1CC38CDFC3A72B55` FOREIGN KEY (`content_id`) REFERENCES `Content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `View_Content` WRITE;
INSERT INTO `View_Content` VALUES (5,4);
UNLOCK TABLES;
DROP TABLE IF EXISTS `VirtualFile`;
CREATE TABLE `VirtualFile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `created` bigint(20) NOT NULL,
  `directory` bit(1) NOT NULL,
  `filesize` bigint(20) NOT NULL,
  `isPublic` bit(1) NOT NULL,
  `lastModified` bigint(20) NOT NULL,
  `path` longtext COLLATE utf8_bin NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `lastModifier_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`name`),
  KEY `FK2847B307F1E43E85` (`creator_id`),
  KEY `FK2847B3071F98F255` (`parent_id`),
  KEY `FK2847B307C607F384` (`lastModifier_id`),
  CONSTRAINT `FK2847B3071F98F255` FOREIGN KEY (`parent_id`) REFERENCES `VirtualFile` (`id`),
  CONSTRAINT `FK2847B307C607F384` FOREIGN KEY (`lastModifier_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FK2847B307F1E43E85` FOREIGN KEY (`creator_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VirtualFile` WRITE;
INSERT INTO `VirtualFile` VALUES (1,'',1458313407593,'',0,'\0',1458313407593,'private:///',1,1,NULL),(2,'',1458313407597,'',0,'',1458313407597,'public:///',1,1,NULL);
UNLOCK TABLES;
DROP TABLE IF EXISTS `VirtualFile_DeadProperty`;
CREATE TABLE `VirtualFile_DeadProperty` (
  `VirtualFile_id` bigint(20) NOT NULL,
  `deadProperties_id` bigint(20) NOT NULL,
  PRIMARY KEY (`VirtualFile_id`,`deadProperties_id`),
  UNIQUE KEY `deadProperties_id` (`deadProperties_id`),
  KEY `FK936508B1EC6EEAD8` (`VirtualFile_id`),
  KEY `FK936508B122E81AB6` (`deadProperties_id`),
  CONSTRAINT `FK936508B122E81AB6` FOREIGN KEY (`deadProperties_id`) REFERENCES `DeadProperty` (`id`),
  CONSTRAINT `FK936508B1EC6EEAD8` FOREIGN KEY (`VirtualFile_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VirtualFile_DeadProperty` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `VirtualFile_readRoles`;
CREATE TABLE `VirtualFile_readRoles` (
  `VirtualFile_id` bigint(20) NOT NULL,
  `readRoles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`VirtualFile_id`,`readRoles_id`),
  KEY `FK1AEEA38F35BB5295` (`readRoles_id`),
  KEY `FK1AEEA38FEC6EEAD8` (`VirtualFile_id`),
  CONSTRAINT `FK1AEEA38F35BB5295` FOREIGN KEY (`readRoles_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK1AEEA38FEC6EEAD8` FOREIGN KEY (`VirtualFile_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VirtualFile_readRoles` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `VirtualFile_writeRoles`;
CREATE TABLE `VirtualFile_writeRoles` (
  `VirtualFile_id` bigint(20) NOT NULL,
  `writeRoles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`VirtualFile_id`,`writeRoles_id`),
  KEY `FK3C10A2561DEDF7DE` (`writeRoles_id`),
  KEY `FK3C10A256EC6EEAD8` (`VirtualFile_id`),
  CONSTRAINT `FK3C10A2561DEDF7DE` FOREIGN KEY (`writeRoles_id`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK3C10A256EC6EEAD8` FOREIGN KEY (`VirtualFile_id`) REFERENCES `VirtualFile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VirtualFile_writeRoles` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `VisitCountAggregation`;
CREATE TABLE `VisitCountAggregation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `endTime` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `counter` int(11) NOT NULL,
  `bounces` int(11) NOT NULL,
  `statisticsServer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9526F99E8E487982` (`statisticsServer_id`),
  CONSTRAINT `FK9526F99E8E487982` FOREIGN KEY (`statisticsServer_id`) REFERENCES `StatisticsServer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `VisitCountAggregation` WRITE;
INSERT INTO `VisitCountAggregation` VALUES (1,1459382399999,1459296000000,2,0,1),(2,1459468799999,1459382400000,2,1,1),(3,1459555199999,1459468800000,3,2,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_Address`;
CREATE TABLE `checkout_Address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `additionalNameInfo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `additionalStreetInfo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `institution` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `salutation` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_Address` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_Customer`;
CREATE TABLE `checkout_Customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) COLLATE utf8_bin NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `vatNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_Customer` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_DispatchData`;
CREATE TABLE `checkout_DispatchData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dispatchType_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `dispatchType_id` (`dispatchType_id`),
  KEY `FK4E888DBD9F930B32` (`dispatchType_id`),
  CONSTRAINT `FK4E888DBD9F930B32` FOREIGN KEY (`dispatchType_id`) REFERENCES `checkout_DispatchType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_DispatchData` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_DispatchType`;
CREATE TABLE `checkout_DispatchType` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCode` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4E902D4D9FB6D242` (`price_id`),
  CONSTRAINT `FK4E902D4D9FB6D242` FOREIGN KEY (`price_id`) REFERENCES `checkout_Price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_DispatchType` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_Order`;
CREATE TABLE `checkout_Order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billingAddress_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `deliveryAddress_id` bigint(20) DEFAULT NULL,
  `dispatchData_id` bigint(20) DEFAULT NULL,
  `orderContents_id` bigint(20) NOT NULL,
  `orderDetails_id` bigint(20) NOT NULL,
  `orderMetaData_id` bigint(20) NOT NULL,
  `paymentData_id` bigint(20) DEFAULT NULL,
  `totalPrice_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  UNIQUE KEY `orderMetaData_id` (`orderMetaData_id`),
  UNIQUE KEY `orderContents_id` (`orderContents_id`),
  UNIQUE KEY `totalPrice_id` (`totalPrice_id`),
  UNIQUE KEY `orderDetails_id` (`orderDetails_id`),
  KEY `FK58CCBAF5A67E5F56` (`deliveryAddress_id`),
  KEY `FK58CCBAF5A4E8291D` (`billingAddress_id`),
  KEY `FK58CCBAF59BE65EF2` (`orderDetails_id`),
  KEY `FK58CCBAF5A893C602` (`orderMetaData_id`),
  KEY `FK58CCBAF5BC719F52` (`totalPrice_id`),
  KEY `FK58CCBAF5E2CCC602` (`orderContents_id`),
  KEY `FK58CCBAF5ACF8BAD2` (`customer_id`),
  KEY `FK58CCBAF523B27B02` (`paymentData_id`),
  KEY `FK58CCBAF52869F532` (`dispatchData_id`),
  CONSTRAINT `FK58CCBAF523B27B02` FOREIGN KEY (`paymentData_id`) REFERENCES `checkout_PaymentData` (`id`),
  CONSTRAINT `FK58CCBAF52869F532` FOREIGN KEY (`dispatchData_id`) REFERENCES `checkout_DispatchData` (`id`),
  CONSTRAINT `FK58CCBAF59BE65EF2` FOREIGN KEY (`orderDetails_id`) REFERENCES `checkout_OrderDetails` (`id`),
  CONSTRAINT `FK58CCBAF5A4E8291D` FOREIGN KEY (`billingAddress_id`) REFERENCES `checkout_Address` (`id`),
  CONSTRAINT `FK58CCBAF5A67E5F56` FOREIGN KEY (`deliveryAddress_id`) REFERENCES `checkout_Address` (`id`),
  CONSTRAINT `FK58CCBAF5A893C602` FOREIGN KEY (`orderMetaData_id`) REFERENCES `checkout_OrderMetaData` (`id`),
  CONSTRAINT `FK58CCBAF5ACF8BAD2` FOREIGN KEY (`customer_id`) REFERENCES `checkout_Customer` (`id`),
  CONSTRAINT `FK58CCBAF5BC719F52` FOREIGN KEY (`totalPrice_id`) REFERENCES `checkout_TotalPrice` (`id`),
  CONSTRAINT `FK58CCBAF5E2CCC602` FOREIGN KEY (`orderContents_id`) REFERENCES `checkout_OrderContents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_Order` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_OrderContents`;
CREATE TABLE `checkout_OrderContents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalPrice_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `totalPrice_id` (`totalPrice_id`),
  KEY `FK4CFAB52FBC719F52` (`totalPrice_id`),
  CONSTRAINT `FK4CFAB52FBC719F52` FOREIGN KEY (`totalPrice_id`) REFERENCES `checkout_TotalPrice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_OrderContents` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_OrderContents_checkout_OrderPosition`;
CREATE TABLE `checkout_OrderContents_checkout_OrderPosition` (
  `checkout_OrderContents_id` bigint(20) NOT NULL,
  `orderPositions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`checkout_OrderContents_id`,`orderPositions_id`),
  UNIQUE KEY `orderPositions_id` (`orderPositions_id`),
  KEY `FK3BD8B84E60824FDB` (`checkout_OrderContents_id`),
  KEY `FK3BD8B84E9030171D` (`orderPositions_id`),
  CONSTRAINT `FK3BD8B84E60824FDB` FOREIGN KEY (`checkout_OrderContents_id`) REFERENCES `checkout_OrderContents` (`id`),
  CONSTRAINT `FK3BD8B84E9030171D` FOREIGN KEY (`orderPositions_id`) REFERENCES `checkout_OrderPosition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_OrderContents_checkout_OrderPosition` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_OrderDetails`;
CREATE TABLE `checkout_OrderDetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annotation` longtext COLLATE utf8_bin,
  `cancellationPolicyAccepted` bit(1) NOT NULL,
  `legalNoticeAccepted` bit(1) NOT NULL,
  `netOrder` bit(1) NOT NULL,
  `privacyStatementAccepted` bit(1) NOT NULL,
  `termsAndConditionsAccepted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_OrderDetails` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_OrderMetaData`;
CREATE TABLE `checkout_OrderMetaData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `netBased` bit(1) NOT NULL,
  `orderDate` bigint(20) NOT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `bundle_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK53EA49641AF247EF` (`bundle_id`),
  CONSTRAINT `FK53EA49641AF247EF` FOREIGN KEY (`bundle_id`) REFERENCES `Bundle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_OrderMetaData` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_OrderPosition`;
CREATE TABLE `checkout_OrderPosition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemId` bigint(20) DEFAULT NULL,
  `itemType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `orderCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_id` bigint(20) NOT NULL,
  `unitPrice_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `price_id` (`price_id`),
  UNIQUE KEY `unitPrice_id` (`unitPrice_id`),
  KEY `FK9B5DF33E9FB6D242` (`price_id`),
  KEY `FK9B5DF33E7F4DE7C6` (`unitPrice_id`),
  CONSTRAINT `FK9B5DF33E7F4DE7C6` FOREIGN KEY (`unitPrice_id`) REFERENCES `checkout_Price` (`id`),
  CONSTRAINT `FK9B5DF33E9FB6D242` FOREIGN KEY (`price_id`) REFERENCES `checkout_Price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_OrderPosition` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_PaymentData`;
CREATE TABLE `checkout_PaymentData` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8_bin NOT NULL,
  `paymentDate` bigint(20) NOT NULL,
  `providerTransactionId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin NOT NULL,
  `transactionId` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paymentMethod_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `paymentMethod_id` (`paymentMethod_id`),
  KEY `FK4E61BD37F35199A2` (`paymentMethod_id`),
  CONSTRAINT `FK4E61BD37F35199A2` FOREIGN KEY (`paymentMethod_id`) REFERENCES `checkout_PaymentMethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_PaymentData` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_PaymentMethod`;
CREATE TABLE `checkout_PaymentMethod` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCode` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4C7B6F2E9FB6D242` (`price_id`),
  CONSTRAINT `FK4C7B6F2E9FB6D242` FOREIGN KEY (`price_id`) REFERENCES `checkout_Price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_PaymentMethod` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_Price`;
CREATE TABLE `checkout_Price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8_bin NOT NULL,
  `netBased` bit(1) NOT NULL,
  `taxRate_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `taxRate_id` (`taxRate_id`),
  KEY `FK58DAE4F06749AD22` (`taxRate_id`),
  CONSTRAINT `FK58DAE4F06749AD22` FOREIGN KEY (`taxRate_id`) REFERENCES `checkout_TaxRate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_Price` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_Quota`;
CREATE TABLE `checkout_Quota` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(19,2) NOT NULL,
  `taxRate_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `taxRate_id` (`taxRate_id`),
  KEY `FK58EA721F6749AD22` (`taxRate_id`),
  CONSTRAINT `FK58EA721F6749AD22` FOREIGN KEY (`taxRate_id`) REFERENCES `checkout_TaxRate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_Quota` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_TaxRate`;
CREATE TABLE `checkout_TaxRate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `percentage` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_TaxRate` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_TotalPrice`;
CREATE TABLE `checkout_TotalPrice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency` varchar(255) COLLATE utf8_bin NOT NULL,
  `netBased` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_TotalPrice` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `checkout_TotalPrice_checkout_Quota`;
CREATE TABLE `checkout_TotalPrice_checkout_Quota` (
  `checkout_TotalPrice_id` bigint(20) NOT NULL,
  `amountQuotas_id` bigint(20) NOT NULL,
  PRIMARY KEY (`checkout_TotalPrice_id`,`amountQuotas_id`),
  UNIQUE KEY `amountQuotas_id` (`amountQuotas_id`),
  KEY `FK83C4F3608F0F0C19` (`checkout_TotalPrice_id`),
  KEY `FK83C4F360C64B68B8` (`amountQuotas_id`),
  CONSTRAINT `FK83C4F3608F0F0C19` FOREIGN KEY (`checkout_TotalPrice_id`) REFERENCES `checkout_TotalPrice` (`id`),
  CONSTRAINT `FK83C4F360C64B68B8` FOREIGN KEY (`amountQuotas_id`) REFERENCES `checkout_Quota` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `checkout_TotalPrice_checkout_Quota` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cmscontent_page`;
CREATE TABLE `cmscontent_page` (
  `CMSContent_id` bigint(20) NOT NULL,
  `pages_id` bigint(20) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`CMSContent_id`,`position`),
  UNIQUE KEY `pages_id` (`pages_id`),
  KEY `FK41B7A65E190B6AAC` (`CMSContent_id`),
  KEY `FK41B7A65E6F0DCA97` (`pages_id`),
  CONSTRAINT `FK41B7A65E190B6AAC` FOREIGN KEY (`CMSContent_id`) REFERENCES `CMSContent` (`id`),
  CONSTRAINT `FK41B7A65E6F0DCA97` FOREIGN KEY (`pages_id`) REFERENCES `Page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `cmscontent_page` WRITE;
INSERT INTO `cmscontent_page` VALUES (2,1,0),(5,5,0),(6,6,0),(5,7,1);
UNLOCK TABLES;
DROP TABLE IF EXISTS `filter_filtermatches`;
CREATE TABLE `filter_filtermatches` (
  `filter_id` bigint(20) NOT NULL,
  `filtermatches_id` bigint(20) NOT NULL,
  `matches_position` int(11) NOT NULL,
  PRIMARY KEY (`filter_id`,`matches_position`),
  KEY `FK98A9923497B21B29` (`filtermatches_id`),
  KEY `FK98A99234CAAF3E2B` (`filter_id`),
  CONSTRAINT `FK98A9923497B21B29` FOREIGN KEY (`filtermatches_id`) REFERENCES `FilterMatches` (`id`),
  CONSTRAINT `FK98A99234CAAF3E2B` FOREIGN KEY (`filter_id`) REFERENCES `Filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `filter_filtermatches` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `filter_filterrule`;
CREATE TABLE `filter_filterrule` (
  `filter_id` bigint(20) NOT NULL,
  `filterrule_id` bigint(20) NOT NULL,
  `rule_position` int(11) NOT NULL,
  PRIMARY KEY (`filter_id`,`rule_position`),
  KEY `FK54BA159B4995E04B` (`filterrule_id`),
  KEY `FK54BA159BCAAF3E2B` (`filter_id`),
  CONSTRAINT `FK54BA159B4995E04B` FOREIGN KEY (`filterrule_id`) REFERENCES `FilterRule` (`id`),
  CONSTRAINT `FK54BA159BCAAF3E2B` FOREIGN KEY (`filter_id`) REFERENCES `Filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `filter_filterrule` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `filterrule_filterruleproperty`;
CREATE TABLE `filterrule_filterruleproperty` (
  `filterrule_id` bigint(20) NOT NULL,
  `filterruleproperty_id` bigint(20) NOT NULL,
  `property_position` int(11) NOT NULL,
  PRIMARY KEY (`filterrule_id`,`property_position`),
  KEY `FK92D3D3F44995E04B` (`filterrule_id`),
  KEY `FK92D3D3F4F19CD74B` (`filterruleproperty_id`),
  CONSTRAINT `FK92D3D3F44995E04B` FOREIGN KEY (`filterrule_id`) REFERENCES `FilterRule` (`id`),
  CONSTRAINT `FK92D3D3F4F19CD74B` FOREIGN KEY (`filterruleproperty_id`) REFERENCES `FilterRuleProperty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `filterrule_filterruleproperty` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `selection_option`;
CREATE TABLE `selection_option` (
  `selection_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  PRIMARY KEY (`selection_id`,`option_id`),
  UNIQUE KEY `selection_id` (`selection_id`,`option_id`),
  KEY `FK20757E88384173DA` (`selection_id`),
  KEY `FK20757E882B8187FA` (`option_id`),
  CONSTRAINT `FK20757E882B8187FA` FOREIGN KEY (`option_id`) REFERENCES `Option` (`id`),
  CONSTRAINT `FK20757E88384173DA` FOREIGN KEY (`selection_id`) REFERENCES `Selection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `selection_option` WRITE;
UNLOCK TABLES;
DROP TABLE IF EXISTS `shopsettings_taxgroup`;
CREATE TABLE `shopsettings_taxgroup` (
  `shopsettings_id` bigint(20) NOT NULL,
  `taxgroup_id` bigint(20) NOT NULL,
  PRIMARY KEY (`shopsettings_id`,`taxgroup_id`),
  UNIQUE KEY `taxgroup_id` (`taxgroup_id`),
  KEY `FKF654661A817FA24F` (`taxgroup_id`),
  KEY `FKF654661AA9FDDEF` (`shopsettings_id`),
  CONSTRAINT `FKF654661A817FA24F` FOREIGN KEY (`taxgroup_id`) REFERENCES `TaxGroup` (`id`),
  CONSTRAINT `FKF654661AA9FDDEF` FOREIGN KEY (`shopsettings_id`) REFERENCES `ShopSettings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
LOCK TABLES `shopsettings_taxgroup` WRITE;
UNLOCK TABLES;
