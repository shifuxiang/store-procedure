/*
Navicat MySQL Data Transfer

Source Server         : 172.23.142.45
Source Server Version : 50173
Source Host           : 172.23.142.45:3306
Source Database       : AdInspect

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-19 19:32:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Procedure structure for `Into_creectshow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Into_creectshow`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Into_creectshow`(IN `duration` int(11))
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
	DECLARE ad_id 	VARCHAR(26);
	DECLARE ad_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE adv_name	VARCHAR(128);
	DECLARE in_order INT DEFAULT 0;
	DECLARE numofpicture INT DEFAULT 0;
	DECLARE monitor_count INT DEFAULT 0;
	DECLARE relative_position INT DEFAULT 0;		
	DECLARE inspecstarttime DATETIME DEFAULT '0000-00-00 00:00:00';		#这期间的变量为记录要插入的数据
	DECLARE done INT DEFAULT 0;																				#标志
	DECLARE cur1 CURSOR FOR SELECT hallno,create_time  FROM correct_show;			#从正确表中查询数据
	DECLARE cur2 CURSOR FOR SELECT hallno,time  FROM dragon ;									#从dragon表中查询数据
	DECLARE cur3 CURSOR FOR SELECT hall_no,advert_id,inspec_start_time,displayName,inspect_order,imglen  FROM oristarmr.app_monitor 
							WHERE hall_no=num AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(timet) 
							AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1 ORDER BY inspect_order;  #查询要插入的数据
	DECLARE  CONTINUE HANDLER FOR NOT FOUND  SET  done = 1; 								#设置标志位
	

	#首先查询dragon表 然后使用该次查处的数据去和正确表中的每一条去比较若正确表中存在改时间则退出循环，再从dragon表中获取一次数据，若正确表中没有该时间，
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
			IF DATE_FORMAT(timet,'%y-%m-%d') = DATE_FORMAT(correct_time,'%y-%m-%d')
			THEN
				LEAVE outer_lable;
			END IF;
			FETCH cur1 INTO correct_num,correct_time;
			SET correct_count = correct_count-1;
			END WHILE;
			SELECT * FROM dragon;
			SELECT COUNT(inspec_start_time) INTO time_count FROM oristarmr.app_monitor WHERE hall_no=num AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(timet) AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(timet)-duration);
			SELECT COUNT(monitor_status) INTO status_count FROM oristarmr.app_monitor WHERE monitor_status=1 AND hall_no=num AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(timet) AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(timet)-duration);
			IF time_count=status_count
			THEN

				SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor WHERE
					hall_no=num AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1;

				OPEN cur3;
				FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture;
				WHILE monitor_count != 0 DO
					SELECT SUM(imglen) INTO relative_position FROM oristarmr.app_monitor WHERE hall_no=num AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(timet) 
							AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(timet)-duration) AND monitor_status=1 AND  inspect_order<=in_order;
					INSERT INTO AdInspect.correct_show(hallno,advert_id,create_time,ad_name,inspect_order,imglen,Relative_starttime,inspect_start_time) VALUES(hall_num,ad_id,NOW(),adv_name,in_order,numofpicture,relative_position,ad_starttime);
					FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture;
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
