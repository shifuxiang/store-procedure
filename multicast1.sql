BEGIN
	#Routine body goes here...
	#dragon TABLE parameter
	DECLARE dragon_hallno INT DEFAULT 0;
	DECLARE dragon_time DATETIME DEFAULT '0000-00-00 00:00:00';
	
	#correct_show TABLE parameter
	DECLARE correct_hallno INT DEFAULT 0;
	DECLARE correct_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE correct_count INT DEFAULT 0;
	DECLARE correct_uuid VARCHAR(36);
	DECLARE correct_imglen INT DEFAULT 0;
	DECLARE correct_city VARCHAR(32);
	DECLARE correct_cinemaname VARCHAR(36);
	DECLARE correct_cratetime DATETIME DEFAULT '0000-00-00 00:00:00';

	#appmonitor TABLE parameter
	DECLARE monitor_count INT DEFAULT 0;
	DECLARE monitor_hallno INT DEFAULT 0;
	DECLARE monitor_starttime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_endtime DATETIME DEFAULT '0000-00-00 00:00:00';
	DECLARE monitor_id	VARCHAR(255);
	DECLARE monitor_uuid 	VARCHAR(36);
	DECLARE monitor_stat INT DEFAULT 0;
	DECLARE monitor_adback VARCHAR(64);
	DECLARE monitor_adprevious VARCHAR(64);
	DECLARE monitor_order INT DEFAULT 0;
	DECLARE monitor_imglen INT DEFAULT 0;
	DECLARE monitor_vediopath VARCHAR(128);
	DECLARE monitor_comparreimgpath VARCHAR(128);


	#定义一个游标从correct_show表中查询厅号和创建时间
	DECLARE cur1 CURSOR FOR SELECT hallno ,create_time,advert_id,imglen,cinema_city,cinema_name,inspect_start_time FROM correct_show 
		WHERE DATE_FORMAT(inspect_start_time,'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno;  

	#定义一个游标从app_monitor表中查询厅号和时间
	DECLARE cur2 CURSOR FOR SELECT hall_no,inspect_start_time,inspect_end_time ,advert_id ,id,monitor_status,advert_back,advert_previous,inspect_order,imglen,
	videopath,compare_imgpath FROM oristarmr.app_monitor WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) 
		AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) AND hall_no=dragon_hallno; 

	SELECT hallno,time INTO dragon_hallno,dragon_time FROM dragon ORDER BY id DESC LIMIT 1;
	OPEN cur2;
	SELECT COUNT(id) INTO monitor_count FROM oristarmr.app_monitor 
					WHERE UNIX_TIMESTAMP(inspect_start_time) < UNIX_TIMESTAMP(dragon_time) AND UNIX_TIMESTAMP(inspect_start_time)>(UNIX_TIMESTAMP(dragon_time)-duration) 
						AND hall_no=dragon_hallno;
	WHILE monitor_count != 0 DO
	FETCH cur2 INTO monitor_hallno,monitor_starttime,monitor_endtime,monitor_uuid,monitor_id,monitor_stat,monitor_adback,monitor_adprevious,monitor_order,monitor_imglen,
		monitor_vediopath,monitor_comparreimgpath;
	out_lable :BEGIN
		OPEN cur1;
			SELECT COUNT(id) INTO correct_count FROM correct_show 
				WHERE DATE_FORMAT(inspect_start_time,'%y-%m-%d') = DATE_FORMAT(dragon_time,'%y-%m-%d') AND hallno = dragon_hallno;
				WHILE correct_count != 0 DO
					FETCH cur1 INTO correct_hallno,correct_cratetime,correct_uuid,correct_imglen,correct_city,correct_cinemaname,correct_starttime;
					IF monitor_uuid = correct_uuid 
						THEN
							CLOSE cur1;
							LEAVE out_lable;
					END IF;
					SET correct_count = correct_count - 1;
				END WHILE;
				#更新一条信息
				IF monitor_stat = 1
				THEN
				#UPDATE oristarmr.app_monitor SET monitor_status = 4 WHERE hall_no = correct_hallno AND id = monitor_id;
				INSERT INTO oristarmr.app_monitor_multiple (id,create_time,advert_back,advert_previous,cinema_city,cinema_name,
					hall_no,inspect_end_time,inspect_order,inspect_start_time,monitor_status,imglen,videopath,compare_imgpath)VALUES(REPLACE(UUID(),'-',''),NOW(),monitor_adback,
					monitor_adprevious,correct_city,correct_cinemaname,monitor_hallno,monitor_endtime,monitor_order,monitor_starttime,4,monitor_imglen,monitor_vediopath,
					monitor_comparreimgpath);
				END IF;
				CLOSE cur1;
				END out_lable;
	SET monitor_count = monitor_count -1;
	END WHILE;
	CLOSE cur2;
	
	
END