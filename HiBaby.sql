-- 유저 테이블
CREATE TABLE t_user(
	i_user INT UNSIGNED AUTO_INCREMENT,
	user_id VARCHAR(20) UNIQUE,
	user_pw VARCHAR(80) NOT NULL,
	nm VARCHAR(8) NOT NULL,
	nick VARCHAR(14) NOT NULL,
	phoneNumber VARCHAR(13) NOT NULL,
	profile_img VARCHAR(80),
	PRIMARY KEY(i_user)
);

SELECT * FROM t_user;