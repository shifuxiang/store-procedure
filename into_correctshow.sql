/*
Navicat MySQL Data Transfer

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-19 13:29:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Procedure structure for `Into_creectshow`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Into_creectshow`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Into_creectshow`(IN `duration` int(11),OUT `st_time` datetime,OUT `ho` int,OUT `ho_num`int)
BEGIN
	#Routine body goes here...
	DECLARE num INT DEFAULT 0;
	DECLARE t VARCHAR(25);
	DECLARE i INT DEFAULT 0;
	DECLARE timet DATETIME DEFAULT '0000-00-00 00:00:00'; 
	DECLARE time_count INT DEFAULT 0;
	DECLARE status_count INT DEFAULT 0;
	DECLARE hall_num VARCHAR(20);
	DECLARE ad_id 	VARCHAR(26);
	DECLARE ad_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE adv_name	VARCHAR(128);
	DECLARE in_order INT DEFAULT 0;
	DECLARE numofpicture INT DEFAULT 0;
	DECLARE monitor_count INT DEFAULT 0;
	DECLARE relative_position INT DEFAULT 0;
	DECLARE done INT DEFAULT 0;
	DECLARE dragon_stop INT DEFAULT 0;
	DECLARE cur1 CURSOR FOR SELECT hallno,create_time  FROM correct_show;
	DECLARE cur2 CURSOR FOR SELECT hallno,time  FROM dragon WHERE (hallno != num AND DATE_FORMAT(time,'%y-%m-%d')!= DATE_FORMAT(timet,'%y-%m-%d'));
	DECLARE cur3 CURSOR FOR SELECT hall_no,advert_id,inspec_start_time,displayName,inspect_order,imglen  FROM oristarmr.app_monitor 
							WHERE hall_no=ho AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(st_time) 
							AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(st_time)-duration) AND monitor_status=1 ORDER BY inspect_order;
	DECLARE  CONTINUE HANDLER FOR NOT FOUND  SET  done = 1; 
	OPEN cur1;
	
	FETCH cur1 INTO num,timet;
	REPEAT
	OPEN cur2;
	SELECT COUNT(id) INTO i FROM dragon ;
	FETCH cur2 INTO ho,st_time;
	loop1:WHILE i!=0 DO
	/*SELECT COUNT(inspec_start_time) INTO time_count FROM oristarmr.app_monitor 
		WHERE hall_no=ho AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(st_time) AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(st_time)-duration)
		AND time_count=
		(
				SELECT COUNT(monitor_status) INTO status_count FROM oristarmr.app_monitor WHERE monitor_status=1 AND hall_no=ho AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(st_time) AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(st_time)-duration)
		);*/

		SELECT COUNT(inspec_start_time) INTO time_count FROM oristarmr.app_monitor WHERE hall_no=ho AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(st_time) AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(st_time)-duration);
		SELECT COUNT(monitor_status) INTO status_count FROM oristarmr.app_monitor WHERE monitor_status=1 AND hall_no=ho AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(st_time) AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(st_time)-duration);
		IF time_count=status_count
		THEN

		SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor WHERE
			hall_no=ho AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(st_time) AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(st_time)-duration) AND monitor_status=1;
/*
		SELECT hall_no,advert_id,inspec_start_time,displayName,inspect_order,imglen  FROM oristarmr.app_monitor 
							WHERE hall_no=ho AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(st_time) 
							AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(st_time)-duration) AND monitor_status=1 ORDER BY inspect_order;
*/
/*
		#duo tiao yi kuai cha ru 
		INSERT INTO AdInspect.correct_show(hallno,advert_id,create_time,ad_name,inspect_order,imglen) SELECT hall_no,advert_id,inspec_start_time,displayName,inspect_order,imglen FROM oristarmr.app_monitor WHERE
			hall_no=ho AND TIME_TO_SEC(inspec_start_time)<TIME_TO_SEC(st_time) AND TIME_TO_SEC(inspec_start_time)>(TIME_TO_SEC(st_time)-duration) AND monitor_status=1;
*/
		
		#dan tiao cha ru
		OPEN cur3;
		FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture;
		SET ho_num = hall_num;
		WHILE monitor_count != 0 DO
		SELECT SUM(imglen) INTO relative_position FROM oristarmr.app_monitor WHERE hall_no=ho AND UNIX_TIMESTAMP(inspec_start_time)<UNIX_TIMESTAMP(st_time) 
							AND UNIX_TIMESTAMP(inspec_start_time)>(UNIX_TIMESTAMP(st_time)-duration) AND monitor_status=1 AND  inspect_order<=in_order;
 		INSERT INTO AdInspect.correct_show(hallno,advert_id,create_time,ad_name,inspect_order,imglen,Relative_starttime) VALUES(hall_num,ad_id,NOW(),adv_name,in_order,numofpicture,relative_position);
		FETCH cur3 INTO hall_num,ad_id,ad_starttime,adv_name,in_order,numofpicture;
		SET monitor_count = monitor_count -1;
		END WHILE;
		CLOSE cur3;

		END IF;
	FETCH cur2 INTO ho,st_time;
	SET i = i-1;
	END WHILE loop1;
	CLOSE cur2;
	FETCH cur1 INTO num,timet;
	UNTIL  done = 1  
	END REPEAT;
	
	CLOSE cur1;
END
;;
DELIMITER ;
