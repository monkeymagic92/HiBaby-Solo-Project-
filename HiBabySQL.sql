CREATE TABLE t_user(
	i_user INT AUTO_INCREMENT,
	user_id VARCHAR(20) unique,
	user_pw VARCHAR(70),
	salt VARCHAR(80),
	nm VARCHAR(8),
	nick VARCHAR(14),
	email VARCHAR(34) unique,
	uNum INT(8),
	myPoint INT(8), -- 보유한 포인트
	myCash INT(8),  -- 환급받은 캐시
	sm VARCHAR(80),
	profile_img VARCHAR(200),
	r_dt DATETIME DEFAULT NOW(),
	m_dt DATETIME DEFAULT NOW(),
	loginChk INT(5) DEFAULT 1,	-- 로그인했을시 2로 값 넘기기
	PRIMARY KEY(i_user)
);
SELECT * FROM t_user;
DROP TABLE t_user;



UPDATE t_user
SET loginChk = '2'
WHERE i_user = 2;

SELECT B.to_user, B.i_user, A.nick, A.sm, A.profile_img, A.loginChk, C.totalPoint 
FROM t_user A

LEFT JOIN t_fr B
ON A.i_user = B.to_user

LEFT JOIN t_mypoint C
ON A.i_user = C.i_user

WHERE B.i_user = 1;






CREATE TABLE t_board(
    i_board int primary KEY AUTO_INCREMENT,
    image_1 VARCHAR(200),
    image_2 VARCHAR(200),
    image_3 VARCHAR(200),
    image_4 VARCHAR(200),
    title varchar(100) not null,
    ctnt varchar(2000) not null,
    hits int default 0,
    i_user int not null,
    r_dt datetime DEFAULT NOW(),
    FOREIGN key(i_user) REFERENCES t_user(i_user) ON DELETE CASCADE
);
SELECT * FROM t_board;
DROP TABLE t_board;



CREATE TABLE t_myPoint(
	i_point INT UNSIGNED AUTO_INCREMENT,
	i_user INT,
	totalPoint INT(8),	-- 총 누적 포인트
	totalCash INT(8),		-- 총 환급받은 캐시
	myPoint INT(8),		-- 현재 포인트
	myCash INT(8) DEFAULT 0,			-- 환급할 캐시입력
	myPointNow INT(8),	-- 환급후 포인트
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_point, i_user),
	FOREIGN KEY(i_user) REFERENCES t_user(i_user) ON DELETE CASCADE
);
SELECT * FROM t_myPoint;
DROP TABLE t_myPoint;

INSERT INTO t_myPoint
(i_user,totalPoint)
VALUES
(1, 30000);



CREATE TABLE t_cmt(
	i_cmt INT UNSIGNED AUTO_INCREMENT,
	i_user INT,
	i_board INT,
	ctnt VARCHAR(300) NOT null,
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
  	PRIMARY KEY (i_cmt, i_user, i_board),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user)  ON DELETE CASCADE,
	FOREIGN KEY (i_board) REFERENCES t_board(i_board) ON DELETE CASCADE
);
SELECT * FROM t_cmt;
DROP TABLE t_cmt;



CREATE TABLE t_fr(
	i_fr INT UNSIGNED AUTO_INCREMENT,
	i_user INT,
	to_user INT,
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_fr, i_user, to_user),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user)  ON DELETE CASCADE,
	FOREIGN KEY (to_user) REFERENCES t_user(i_user)  ON DELETE CASCADE
);
SELECT * FROM t_fr;
DROP TABLE t_fr;


SELECT B.to_user, A.i_user, A.nick, A.sm, A.profile_img, A.loginChk, C.totalPoint 
FROM t_user A

LEFT JOIN t_fr B
ON A.i_user = B.to_user

LEFT JOIN t_myPoint C
ON A.i_user = C.i_user

WHERE B.i_user = 1;




CREATE TABLE t_chat(
	i_chat INT UNSIGNED AUTO_INCREMENT,
	from_user INT(6),	
	to_user INT(6),
	ctnt VARCHAR(100),
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_chat, to_user, from_user),
	FOREIGN KEY(to_user) REFERENCES t_user(i_user) ON DELETE CASCADE,
	FOREIGN KEY(from_user) REFERENCES t_user(i_user) ON DELETE CASCADE	
);
DROP TABLE t_chat;
SELECT * FROM t_chat;




CREATE TABLE t_chatChk(
	i_chatChk INT UNSIGNED AUTO_INCREMENT,
	to_user INT(6),
	to_chk INT DEFAULT(0),
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_chatChk, to_user),
	FOREIGN KEY(to_user) REFERENCES t_user(i_user) ON DELETE CASCADE
);
DROP TABLE t_chatChk;
SELECT * FROM t_chatChk;

















SELECT B.i_user AS from_user, C.i_user AS to_user, B.profile_img AS from_profile_img, C.profile_img AS to_profile_img,
B.nick, ctnt
FROM t_chat A

LEFT JOIN t_user B
ON A.from_user = B.i_user

LEFT JOIN t_user C
ON A.to_user = C.i_user

WHERE A.to_user = 4 AND A.from_user = 1 OR A.from_user = 4 AND A.to_user = 1;

SELECT B.i_user AS from_user, C.i_user AS to_user,
B.profile_img AS from_profile_img,
 C.profile_img AS to_profile_img,
B.nick as from_nick, C.nick as to_nick, A.r_dt, ctnt
FROM t_chat A

LEFT JOIN t_user B
ON A.from_user = B.i_user

LEFT JOIN t_user C
ON A.to_user = C.i_user

WHERE A.to_user = 4 AND A.from_user = 1
OR
A.from_user = 4 AND A.to_user = 1;

















-- 랭크 순이 나타내는 쿼리문
SELECT B.nick, B.sm, A.totalPoint FROM t_mypoint A

LEFT JOIN t_user B
ON A.i_user = B.i_user

ORDER BY A.totalPoint DESC
LIMIT 3,1;


SELECT A.i_point, B.nick, B.sm, A.totalPoint FROM t_myPoint A

LEFT JOIN t_user B
ON A.i_user = B.i_user

ORDER BY A.totalPoint DESC
LIMIT 4,100;

