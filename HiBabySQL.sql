CREATE TABLE t_user(
	i_user INT AUTO_INCREMENT,
	user_id VARCHAR(20) unique,
	user_pw VARCHAR(70),
	salt VARCHAR(80),
	nm VARCHAR(8),
	nick VARCHAR(14),
	email VARCHAR(34),
	uNum INT(8),
	myPoint INT(8),
	myCash INT(8),
	sm VARCHAR(80),
	profile_img VARCHAR(70),
	r_dt DATETIME DEFAULT NOW(),
	m_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_user)
);

SELECT * FROM t_user;

DROP TABLE t_user;





