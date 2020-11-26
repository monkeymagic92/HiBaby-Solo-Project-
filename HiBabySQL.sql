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
	PRIMARY KEY(i_user)
);
SELECT * FROM t_user;

SELECT * FROM t_board;

UPDATE t_user
SET myPoint = 20000,
myCash = 1000
WHERE i_user = 2;



CREATE TABLE t_board(
    i_board int primary KEY AUTO_INCREMENT,
    title varchar(100) not null,
    ctnt varchar(2000) not null,
    hits int default 0,
    i_user int not null,
    r_dt datetime DEFAULT NOW(),
    FOREIGN key(i_user) REFERENCES t_user(i_user)
);
SELECT * FROM t_board;

INSERT INTO t_board (title, ctnt, i_user) VALUES ('11111','1111111111',1);
INSERT INTO t_board (title, ctnt, i_user) VALUES ('222222','22222',1);
INSERT INTO t_board (title, ctnt, i_user) VALUES ('33333','3333333',1);
INSERT INTO t_board (title, ctnt, i_user) VALUES ('44444','44444444',2);



CREATE TABLE t_myPoint(
	i_point INT UNSIGNED AUTO_INCREMENT,
	i_user INT,
	myPoint INT(8), -- 기존포인트
	myCash INT(8),  -- 환급 캐시백
	myPointNow INT(8),	-- 환급후 남은 포인트
	r_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_point, i_user),
	FOREIGN KEY(i_user) REFERENCES t_user(i_user)
);

DROP TABLE t_myPoint;
SELECT * FROM t_myPoint;

-- 포인트 환전내역 나타낼때 사용할 쿼리문임
SELECT A.i_point, A.myPoint, A.myCash, A.r_dt, A.i_point, A.i_user, B.i_user, B.nick FROM t_myPoint A
LEFT JOIN t_user B
ON A.i_user = B.i_user
WHERE A.i_user = 2;





