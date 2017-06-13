BEGIN
	#Routine body goes here...
	DECLARE correct_order INT DEFAULT 0;
	DECLARE correct_hallno INT DEFAULT 0;
	DECLARE correct_uuid VARCHAR(36);
	DECLARE correct_adprevious VARCHAR(64);
	DECLARE correct_adback VARCHAR(64);
	DECLARE correct_count INT DEFAULT 0;

	DECLARE monitor_order INT DEFAULT 0;
	DECLARE monitor_hallno INT DEFAULT 0;
	DECLARE monitor_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_endtime  DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_statu INT DEFAULT 0;
	DECLARE monitor_city VARCHAR(32);
	DECLARE monitor_cinemaname VARCHAR(36);
	DECLARE monitor_count INT DEFAULT 0;
	DECLARE monitor_id		VARCHAR(36);
	DECLARE monitor_id1 	VARCHAR(255);
	DECLARE monitor_adid1 VARCHAR(36);
	DECLARE monitor_starttime1 DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_endtime1 DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_order1 INT DEFAULT 0;

	DECLARE dragon_hallno INT DEFAULT 0;
	DECLARE dragon_time DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE dragon_status INT DEFAULT 0;
	

	DECLARE cur1 CURSOR FOR SELECT inspect_order,inspect_start_time,inspect_end_time,hall_no,monitor_status,cinema_city,cinema_name,advert_id FROM oristarmr.app_monitor 
	WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
	AND hall_no=dragon_hallno AND monitor_status = 2;
	
	#DECLARE cur2 CURSOR FOR SELECT hallno,advert_id,inspect_order,advert_back,advert_previous FROM correct_show WHERE inspect_order = monitor_order 
	#AND DATE_FORMAT(inspect_start_time,	'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno AND inspect_order = monitor_order;

	#DECLARE cur3 CURSOR FOR SELECT hallno,time FROM dragon ORDER BY id DESC LIMIT 1;

	SELECT hallno,time INTO dragon_hallno,dragon_time FROM dragon ORDER BY id  DESC LIMIT 1;
	#SELECT * FROM dragon ORDER BY id DESC LIMIT 1;
	#OPEN cur3;
	#FETCH cur3 INTO dragon_hallno,dragon_time;


	OPEN cur1;
/*
	SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor 
		WHERE monitor_status = 2 AND UNIX_TIMESTAMP(inspect_start_time) > (UNIX_TIMESTAMP(dragon_time)-duration );
		AND UNIX_TIMESTAMP(inspect_end_time) < UNIX_TIMESTAMP(dragon_time) AND hall_no = dragon_hallno;*/

	SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor 
						WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
						AND hall_no=dragon_hallno AND monitor_status = 2;
	WHILE monitor_count != 0 DO
	FETCH cur1 INTO monitor_order,monitor_starttime,monitor_endtime,monitor_hallno,monitor_statu,monitor_city,monitor_cinemaname,monitor_id;
	
	IF monitor_statu = 2
	THEN

	#OPEN cur2;
	#在存储过程中使用触发器调用的话，绝对不能有返回结果的语句。否则再出发起调用存储过程时，存储过程无法执行
	#SELECT * FROM correct_show WHERE advert_id = monitor_id AND DATE_FORMAT(inspect_start_time,'%y-%m-%d') = DATE_FORMAT(monitor_starttime,'%y-%m-%d');
	SELECT hallno,advert_id,inspect_order,advert_back,advert_previous INTO correct_hallno,correct_uuid,correct_order,correct_adback,correct_adprevious FROM correct_show
		WHERE DATE_FORMAT(inspect_start_time,	'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno AND advert_id = monitor_id;
	
	IF correct_order != 0
	THEN
	SELECT id,advert_id,inspect_start_time, inspect_end_time INTO monitor_id1,monitor_adid1,monitor_starttime1,monitor_endtime1 FROM oristarmr.app_monitor 
	WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
	AND hall_no=dragon_hallno  AND inspect_order = correct_order;
	#INSERT INTO oristarmr.app_monitor (id,advert_id,create_time,advert_back,advert_previous,cinema_city,cinema_name,hall_no,inspect_end_time,inspect_order,inspect_start_time,monitor_status,data_division)
	#VALUES (REPLACE(UUID(),'-',''),correct_uuid,NOW(),correct_adback,correct_adprevious,monitor_city,monitor_cinemaname,correct_hallno,monitor_endtime1,correct_order,monitor_starttime1,1,1);
	INSERT INTO oristarmr.app_monitor_rank(id,monitor_id,advert_id,create_time,advert_back,advert_previous,cinema_city,cinema_name,hall_no,inspect_end_time,
		inspect_order,inspect_start_time,monitor_status,data_division) VALUES(REPLACE(UUID(),'-',''),monitor_id1,monitor_adid1,NOW(),correct_adback,
		correct_adprevious,monitor_city,monitor_cinemaname,correct_hallno,monitor_endtime1,correct_order,monitor_starttime1,1,1);
	END IF;
	#CLOSE cur2 ;

	END IF;

	SET monitor_count = monitor_count-1;
	END WHILE;
	CLOSE cur1;
	#CLOSE cur3;
	
	
END