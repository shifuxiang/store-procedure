/*
Navicat MySQL Data Transfer

Source Server         : 172.23.142.45
Source Server Version : 50173
Source Host           : 172.23.142.45:3306
Source Database       : AdInspect

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-19 13:28:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Procedure structure for `Into_Appmonitor`
-- ----------------------------
DROP PROCEDURE IF EXISTS `Into_Appmonitor`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `Into_Appmonitor`(IN `duration` int,OUT `st_time` datetime,OUT `ho` int,OUT`count_t` int)
BEGIN
	#Routine body goes here...
	DECLARE appmonitor_count INT DEFAULT 0;
	DECLARE num INT DEFAULT 0;
	DECLARE timet DATETIME DEFAULT '0000-00-00 00:00:00'; 
	DECLARE done INT DEFAULT 0;
	DECLARE ho_num INT DEFAULT 0;
	DECLARE ad_id VARCHAR(255);
	DECLARE c_time DATETIME DEFAULT '0000-00-00 00:00:00'; 
	DECLARE adve_name VARCHAR(255);
	DECLARE in_order INT DEFAULT 0;
	DECLARE numofpicturre INT DEFAULT 0;
	DECLARE Relativestarttime INT DEFAULT 0;
	DECLARE count_id INT DEFAULT 0;
	DECLARE count_dragon INT DEFAULT 0;
	DECLARE cur1 CURSOR FOR SELECT hallno,time FROM dragon;
	DECLARE cur2 CURSOR FOR SELECT hallno,advert_id,create_time,ad_name,inspect_order,imglen,Relative_starttime FROM correct_show WHERE hallno = num 
						AND DATE_FORMAT(create_time,'%y-%m-%d') = DATE_FORMAT(timet,'%y-%m-%d');
	DECLARE CONTINUE HANDLER FOR NOT FOUND  SET done=1;
	OPEN cur1;
	SELECT COUNT(id) INTO count_dragon FROM dragon;
	FETCH cur1 INTO num,timet;
	WHILE count_dragon !=0 DO
	#REPEAT
	SET ho=num;
	SET st_time = timet;
	SELECT COUNT(id) INTO appmonitor_count FROM test2 WHERE hallno=num AND UNIX_TIMESTAMP(inspect_start_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(timet)-duration);
	IF appmonitor_count=0
		THEN
/*
		INSERT INTO test2(hallno,advert_id,crerate_time,ad_name,inspect_order,imglen)
			SELECT hallno,advert_id,create_time,ad_name,inspect_order,imglen FROM correct_show 
			WHERE hallno=num AND UNIX_TIMESTAMP(create_time)<UNIX_TIMESTAMP(timet) AND UNIX_TIMESTAMP(create_time)>(UNIX_TIMESTAMP(timet)-duration);
*/
	
	OPEN cur2;
	SELECT COUNT(id) INTO count_id FROM correct_show WHERE hallno = num 
						AND DATE_FORMAT(create_time,'%y-%m-%d') = DATE_FORMAT(timet,'%y-%m-%d');
	SET count_t = count_id;
	FETCH cur2 INTO ho_num,ad_id,c_time,adve_name,in_order,numofpicturre,Relativestarttime;
	WHILE count_id != 0 DO
	
	#INSERT INTO test2
	INSERT INTO test2(hallno,advert_id,crerate_time,ad_name,inspect_order,imglen,inspect_start_time) VALUES(ho_num,ad_id,NOW(),adve_name,in_order,numofpicturre,FROM_UNIXTIME(UNIX_TIMESTAMP(timet)-Relativestarttime,'%y-%m-%d %H:%i:%s'));

	#INSERT INTO oristarmr.appmonitor
	#INSERT INTO oristarmr.app_monitor(hall_no,advert_id,create_time,displayName,inspect_order,imglen,inspec_start_time) VALUES(ho_num,ad_id,NOW(),adve_name,in_order,numofpicturre,FROM_UNIXTIME(UNIX_TIMESTAMP(timet)-Relativestarttime,'%y-%m-%d %H:%i:%s'));
	
	FETCH cur2 INTO ho_num,ad_id,c_time,adve_name,in_order,numofpicturre,Relativestarttime;
	SET count_id = count_id-1;
	END WHILE;
	CLOSE cur2;
	#SELECT * from dragon;
	END IF;
	FETCH cur1 INTO num,timet;
	#UNTIL done=1
	#END REPEAT;
	SET count_dragon = count_dragon-1;
	END WHILE;
	CLOSE cur1;
END
;;
DELIMITER ;
