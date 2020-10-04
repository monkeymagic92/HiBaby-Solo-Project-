package com.jy.hibaby.user;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.user.model.UserVO;

@Mapper
public interface UserMapper {
	int insUser(UserVO param);
}
