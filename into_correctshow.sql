/*
Navicat MySQL Data Transfer

Source Server         : 172.23.142.45
Source Server Version : 50173
Source Host           : 172.23.142.45:3306
Source Database       : AdInspect

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-06-12 11:10:08
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
-- Procedure structure for `Into_creectshow`
-- ----------------------------
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Into_creectshow`(IN `duration` int(11),IN  `countControl` int(11))
BEGIN
	#Routine body goes here...
	DECLARE num INT DEFAULT 0;     #记录dragon表中的厅号
	DECLARE dragon_count INT DEFAULT 0;			#记录dragon表中的记录条数
	DECLARE correct_num INT DEFAULT 0;			#记录正确表中的厅号
	DECLARE correct_count INT DEFAULT 0;		#记录正确表中的记录条数
	DECLARE correct_time DATETIME DEFAULT '0000-00-00 00:00:00';  #记录正确表中的时间
	DECLARE timet DATETIME DEFAULT '0000-00-00 00:00:00'; 				#记录dragon表中的时间
	DECLARE time_count INT DEFAULT 0;															#在做判断时间条数和状态条数是否相等时记录时间条数			
	DECLARE status_count INT DEFAULT 0;														#在做判断时间条数和状态条数是否相等时记录状态条数
	DECLARE hall_num VARCHAR(20);																	#	
	DECLARE ad_id 	VARCHAR(36);
	DECLARE ad_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE adv_name	VARCHAR(128);
	DECLARE in_order INT DEFAULT 0;
	DECLARE numofpicture INT DEFAULT 0;
	DECLARE monitor_count INT DEFAULT 0;
	DECLARE relative_position INT DEFAULT 0;		
	DECLARE correct_cinemacity VARCHAR(32);
	DECLARE correct_cinemaname VARCHAR(36);
	DECLARE monitor_adback VARCHAR(64);
	DECLARE monitor_adprevious VARCHAR(64);
	DECLARE inspecstarttime DATETIME DEFAULT '0000-00-00 00:00:00';		#这期间的变量为记录要插入的数据
	DECLARE done INT DEFAULT 0;																				#标志位
	#DECLARE cur1 CURSOR FOR SELECT hallno,create_time  FROM correct_show;			#从正确表中查询数据
	DECLARE cur1 CURSOR FOR SELECT hallno,inspect_start_time  FROM correct_show;			#从正确表中查询数据
	DECLARE cur2 CURSOR FOR SELECT hallno,time  FROM dragon ;									#从dragon表中查询数据
	DECLARE cur3 CURSOR FOR SELECT hall_no,advert_id,inspect_start_time,displayName,inspect_order,imglen,cinema_city,cinema_name,advert_back,advert_previous  FROM oristarmr.app_monitor 
							WHERE hall_no=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) 
							AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1 ORDER BY inspect_order;  #查询要插入的数据
	DECLARE  CONTINUE HANDLER FOR NOT FOUND  SET  done = 1; 								#设置标志位
	

	#首先查询dragon表 然后使用该次查处的数据去和正确表中的每一条去比较若正确表中存在该天并且厅号相同则退出循环，再从dragon表中获取一次数据，若正确表中没有该时间，
	#则插入
	OPEN cur2;
	SELECT COUNT(id) INTO dragon_count FROM dragon;
	FETCH cur2 INTO num,timet;
	WHILE dragon_count != 0 DO
		OPEN cur1;
		SELECT COUNT(id) INTO correct_count FROM correct_show;
		FETCH cur1 INTO correct_num,correct_time;
		outer_lable :BEGIN
			WHILE correct_count !=0 DO
			#IF (DATE_FORMAT(timet,'%y-%m-%d') = DATE_FORMAT(from_unixtime(UNIX_TIMESTAMP(correct_time)-timeCalibration),'%y-%m-%d') AND num =correct_num)
			IF (DATE_FORMAT(timet,'%y-%m-%d') = DATE_FORMAT(correct_time,'%y-%m-%d') AND num =correct_num)
			THEN
				LEAVE outer_lable;
			END IF;
			FETCH cur1 INTO correct_num,correct_time;
			SET correct_count = correct_count-1;
			END WHILE;
			SELECT COUNT(inspect_start_time) INTO time_count FROM oristarmr.app_monitor WHERE hall_no=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration);
			SELECT COUNT(monitor_status) INTO status_count FROM oristarmr.app_monitor WHERE monitor_status=1 AND hall_no=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration);
			IF time_count=status_count AND time_count > countControl
			THEN

				SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor WHERE
					hall_no=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1;
				OPEN cur3;
				FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture,correct_cinemacity,correct_cinemaname,monitor_adback,monitor_adprevious;
				WHILE monitor_count != 0 DO
					
					SELECT SUM(imglen) INTO relative_position FROM oristarmr.app_monitor WHERE hall_no=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) 
							AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1 AND  inspect_order<=in_order;
					INSERT INTO AdInspect.correct_show(hallno,advert_id,create_time,ad_name,inspect_order,imglen,Relative_starttime,inspect_start_time,cinema_city,cinema_name,advert_back,advert_previous) 
						VALUES(hall_num,ad_id,NOW(),adv_name,in_order,numofpicture,relative_position,ad_starttime,correct_cinemacity,correct_cinemaname,monitor_adback,monitor_adprevious);
					FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture,correct_cinemacity,correct_cinemaname,monitor_adback,monitor_adprevious;
				SET monitor_count = monitor_count -1;
				END WHILE;
				
				CLOSE cur3;
			END IF;
		END outer_lable;
		CLOSE cur1;
	FETCH cur2 INTO num,timet;
	SET dragon_count = dragon_count-1;
	END WHILE;
	
	
	CLOSE cur2;
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
