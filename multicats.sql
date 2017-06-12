/*
Navicat MySQL Data Transfer

Source Server         : 172.23.142.45
Source Server Version : 50173
Source Host           : 172.23.142.45:3306
Source Database       : AdInspect

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-06-12 11:11:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cinemainfo`
-- ----------------------------
CREATE TABLE `cinemainfo` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`city`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cinema_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`cinema_addr`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Table structure for `correct_show`
-- ----------------------------
CREATE TABLE `correct_show` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`hallno`  int(2) NULL DEFAULT NULL ,
`advert_id`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`ad_name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`inspect_order`  int(11) NULL DEFAULT NULL ,
`imglen`  int(11) NULL DEFAULT NULL ,
`Relative_starttime`  int(11) NULL DEFAULT NULL ,
`inspect_start_time`  datetime NULL DEFAULT NULL ,
`cinema_city`  varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`cinema_name`  varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`advert_back`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`advert_previous`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=230

;

-- ----------------------------
-- Table structure for `dragon`
-- ----------------------------
CREATE TABLE `dragon` (
`id`  int(5) NOT NULL AUTO_INCREMENT ,
`hallno`  int(2) NULL DEFAULT NULL ,
`taskid`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`time`  datetime NULL DEFAULT NULL ,
`status`  int(2) NULL DEFAULT NULL ,
`creattime`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=63

;

-- ----------------------------
-- Table structure for `features`
-- ----------------------------
CREATE TABLE `features` (
`id`  int(50) NOT NULL AUTO_INCREMENT ,
`uuid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`ad_fileName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bmp_fileName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fileName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`filePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fullFilePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bmp_fullFilePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`picture_order`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`quantity`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`bmp_quantity`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2474

;

-- ----------------------------
-- Table structure for `matchitem`
-- ----------------------------
CREATE TABLE `matchitem` (
`id`  int(10) NOT NULL AUTO_INCREMENT ,
`task_id`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`templet_uuid`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`inspect_order`  int(4) NULL DEFAULT NULL ,
`inspect_ts`  int(20) NULL DEFAULT NULL ,
`inspect_time`  varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`templet_order`  int(4) NULL DEFAULT NULL ,
`templet_name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`weight`  float NULL DEFAULT NULL ,
`time`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP ,
`inspect_featrue`  int(10) NOT NULL DEFAULT 0 ,
`templet_featrue`  int(10) NOT NULL DEFAULT 0 ,
`match_count`  int(10) NOT NULL DEFAULT 0 ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=58723

;

-- ----------------------------
-- Table structure for `readymark`
-- ----------------------------
CREATE TABLE `readymark` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`taskid`  char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`hallid`  int(3) NOT NULL ,
`cpos`  int(1) NOT NULL ,
`start`  datetime NOT NULL ,
`end`  datetime NOT NULL ,
`filefullpath`  varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`status`  int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL ,
`isresult`  int(1) NULL DEFAULT NULL ,
`existlongbiao`  int(1) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=2646

;

-- ----------------------------
-- Table structure for `suspicious_show`
-- ----------------------------
CREATE TABLE `suspicious_show` (
`id`  int(20) NOT NULL AUTO_INCREMENT ,
`task_id`  varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adback`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`adprev`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`start`  datetime NULL DEFAULT NULL ,
`end`  datetime NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=93

;

-- ----------------------------
-- Table structure for `tasks`
-- ----------------------------
CREATE TABLE `tasks` (
`id`  int(50) NOT NULL AUTO_INCREMENT ,
`uuid`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`orig_fileName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`fileName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`filePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`fullFilePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`startDateTime`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`endDateTime`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`hall_id`  int(50) NULL DEFAULT NULL ,
`frameRate`  int(50) NULL DEFAULT NULL ,
`frequency`  int(50) NOT NULL ,
`type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`videoWidth`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`videoHeight`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`dstVideoWidth`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`dstVideoHeight`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`realDuration`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`featureFilePath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ad_order`  varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`description`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=299

;

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
CREATE TABLE `test` (
`id`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' ,
`advert_id`  varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`create_time`  datetime NULL DEFAULT NULL ,
`displayName`  varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`modify_time`  datetime NULL DEFAULT NULL ,
`sortIdx`  bigint(20) NULL DEFAULT NULL ,
`status`  int(11) NULL DEFAULT NULL ,
`version`  int(11) NULL DEFAULT NULL ,
`allowIndex`  int(11) NULL DEFAULT NULL ,
`everyOne`  int(11) NULL DEFAULT NULL ,
`remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`sec_lev`  varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`advert_back`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`advert_previous`  varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`cinema_city`  varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`cinema_name`  varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`videopath`  varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`compare_imgpath`  varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`hall_no`  varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`inspect_end_time`  datetime NULL DEFAULT NULL ,
`inspect_order`  int(11) NULL DEFAULT NULL ,
`inspect_start_time`  datetime NULL DEFAULT NULL ,
`monitor_status`  int(11) NULL DEFAULT NULL ,
`dwnstatus`  varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`imglen`  int(11) NULL DEFAULT NULL ,
`playStatus`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci

;

-- ----------------------------
-- Table structure for `test2`
-- ----------------------------
CREATE TABLE `test2` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`hallno`  int(2) NULL DEFAULT NULL ,
`advert_id`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`crerate_time`  datetime NULL DEFAULT NULL ,
`ad_name`  varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL ,
`inspect_order`  int(11) NULL DEFAULT NULL ,
`inspect_start_time`  datetime NULL DEFAULT NULL ,
`imglen`  int(11) NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=latin1 COLLATE=latin1_swedish_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Procedure structure for `multicast`
-- ----------------------------
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `multicast`(IN `duration` int)
BEGIN
	#Routine body goes here...
	DECLARE dragon_count INT DEFAULT 0;
	DECLARE dragon_hallno INT DEFAULT 0;
	DECLARE dragon_time DATETIME DEFAULT '0000-00-00 00:00:00';

	DECLARE correct_count INT DEFAULT 0;
	DECLARE correct_hallno INT DEFAULT 0;
	DECLARE correct_time 	DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE correct_uuid VARCHAR(36);
	DECLARE correct_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE correct_imglen INT DEFAULT 0;
	DECLARE correct_city VARCHAR(32);
	DECLARE correct_cinemaname VARCHAR(36);
	DECLARE correct_inspectstarttime DATETIME DEFAULT '0000-00-00 00:00:00';

	DECLARE monitor_count INT DEFAULT 0;
	DECLARE monitor_hallno INT DEFAULT 0;
	DECLARE monitor_time DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_uuid VARCHAR(36);
	DECLARE monitor_id VARCHAR(255);
	DECLARE monitor_stat INT DEFAULT 0;
	
	DECLARE cur1 CURSOR FOR SELECT hallno,time FROM dragon;   #定义一个游标从dragon表中查询厅号和龙标出现的时间
	DECLARE cur2 CURSOR FOR SELECT hallno ,create_time,advert_id,Relative_starttime,imglen,cinema_city,cinema_name,inspect_start_time FROM correct_show 
			WHERE DATE_FORMAT(inspect_start_time,'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno;  #定义一个游标从correct_show表中查询厅号和创建时间
	DECLARE cur3 CURSOR FOR SELECT hall_no,inspect_start_time ,advert_id ,id,monitor_status FROM oristarmr.app_monitor 
			WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
						AND hall_no=dragon_hallno; #定义一个游标从app_monitor表中查询厅号和时间
	

	OPEN cur1;
	SELECT COUNT(id) INTO dragon_count FROM dragon;
	WHILE dragon_count != 0 DO
		FETCH cur1 INTO dragon_hallno,dragon_time;
		OPEN cur3;
		SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor 
					WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
						AND hall_no=dragon_hallno;

		WHILE monitor_count != 0 DO
				FETCH cur3 INTO monitor_hallno,monitor_time,monitor_uuid,monitor_id,monitor_stat;

				out_lable :BEGIN
				OPEN cur2;

				SELECT COUNT(id) INTO correct_count FROM correct_show 
						WHERE DATE_FORMAT(inspect_start_time,'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno;

				WHILE correct_count != 0 DO
					FETCH cur2 INTO correct_hallno,correct_time,correct_uuid,correct_starttime,correct_imglen,correct_city,correct_cinemaname,correct_inspectstarttime;
					IF monitor_uuid = correct_uuid 
						THEN
							CLOSE cur2;
							LEAVE out_lable;
					END IF;
					SET correct_count = correct_count - 1;
				END WHILE;
				#更新一条信息
				IF monitor_stat = 1
				THEN
				UPDATE oristarmr.app_monitor SET monitor_status = 4 WHERE hall_no = correct_hallno AND id = monitor_id;
				END IF;
				CLOSE cur2;
				END out_lable;
			SET monitor_count = monitor_count-1;
		END WHILE;
		CLOSE cur3;
	SET dragon_count = dragon_count -1;
	END WHILE;
	CLOSE cur1;
END
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `cinemainfo`
-- ----------------------------
ALTER TABLE `cinemainfo` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for `correct_show`
-- ----------------------------
ALTER TABLE `correct_show` AUTO_INCREMENT=230;
DELIMITER ;;
CREATE TRIGGER `test` AFTER INSERT ON `dragon` FOR EACH ROW begin
call Into_creectshow(480,10);
call AbnormalPlay1(480);
call multicast(480);
call order_error(480);
end
;;
DELIMITER ;

-- ----------------------------
-- Auto increment value for `dragon`
-- ----------------------------
ALTER TABLE `dragon` AUTO_INCREMENT=63;

-- ----------------------------
-- Auto increment value for `features`
-- ----------------------------
ALTER TABLE `features` AUTO_INCREMENT=2474;

-- ----------------------------
-- Auto increment value for `matchitem`
-- ----------------------------
ALTER TABLE `matchitem` AUTO_INCREMENT=58723;

-- ----------------------------
-- Auto increment value for `readymark`
-- ----------------------------
ALTER TABLE `readymark` AUTO_INCREMENT=2646;

-- ----------------------------
-- Auto increment value for `suspicious_show`
-- ----------------------------
ALTER TABLE `suspicious_show` AUTO_INCREMENT=93;

-- ----------------------------
-- Auto increment value for `tasks`
-- ----------------------------
ALTER TABLE `tasks` AUTO_INCREMENT=299;

-- ----------------------------
-- Auto increment value for `test2`
-- ----------------------------
ALTER TABLE `test2` AUTO_INCREMENT=1;
