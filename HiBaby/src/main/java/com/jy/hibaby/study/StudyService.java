package com.jy.hibaby.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.PointVO;

@Service
public class StudyService {

	@Autowired
	private StudyMapper mapper;
	
	// 1등 정보
	public PointVO oneRank() {
		return mapper.oneRank();
	}
	
	// 2등 정보
	public PointVO twoRank() {
		return mapper.twoRank();
	}
	
	// 3등 정보
	public PointVO threeRank() {
		return mapper.threeRank();
	}
	
	// 4등 정보
	public PointVO fourRank() {
		return mapper.fourRank();
	}
	
	// 5등 정보
	public PointVO fiveRank() {
		return mapper.fiveRank();
	}
	
	
	// 나머지 정보
	public List<PointVO> otherRank() {
		return mapper.otherRank();
	}
	
	
	
}
