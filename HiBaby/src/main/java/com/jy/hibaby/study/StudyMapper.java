package com.jy.hibaby.study;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.PointVO;

@Mapper
public interface StudyMapper {

	PointVO oneRank();	// 랭킹 1등 정보
	
	PointVO twoRank();	// 2등 정보
	
	PointVO threeRank();	// 3등 정보
	
	List<PointVO> otherRank(); // 4등정보
	
}
