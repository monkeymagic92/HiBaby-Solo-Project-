package com.jy.hibaby.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.PointVO;
import com.jy.hibaby.user.model.UserDMI;
import com.jy.hibaby.user.model.UserPARAM;
import com.jy.hibaby.user.model.UserVO;

@Mapper
public interface UserMapper {
	// select
	UserDMI selUser(UserPARAM param); 	// 해당유저 전체 컬럼값
	
	UserDMI findPwChk(UserPARAM param); // 비밀번호 변경전 입력정보 체크
	
	UserDMI findId(UserPARAM param);	// 아이디 찾기
	
	UserDMI emailChk(UserPARAM param);	// 이메일 중복체크
	
	UserDMI nickChk(UserPARAM param);	// 닉네임 중복체크
	
	UserPARAM selUserInfo(UserPARAM param); // n번 유저의 정보
	
	UserDMI selDetailUser(UserPARAM param);	// info 에서 변경시 값 불러오기
	
	List<UserPARAM> searchUserList(UserPARAM param);	// 유저목록 검색시 list 값
	
	UserPARAM detailUser(UserPARAM param);	// 유저 목록 상세 페이지
	
	UserDMI frUniqueChk(UserPARAM param);	// 친구추가 중복 제거
	
	List<UserPARAM> selFr(UserPARAM param);	// 친구목록 뿌리기
	
	
	int maxI_user();	// 회원가입시 t_myPoint 에 기본 포인트 적립용
	
	// isnert
	int joinUser(UserVO param);		// 회원가입
	
	int insMyPointPage (PointVO vo);	// 포인트몰 내역 조회
	
	int joinPoint(PointVO vo);	// 회원가입시 기본포인트 100제공
	
	
	
	// update 
	int changePw(UserPARAM param);			// 비밀번호 변경
	
	int insProfile_img(UserVO vo); 	        // 프로필사진 등록
	
	int userInfoChange(UserPARAM param);	// 유저정보 변경
	
	int updMyPoint(PointVO vo);		// 포인트 전환시 현재 point,cash 업뎃
	
	int updPoint(PointVO vo);
	
	int loginChkPlus(UserPARAM param);	// 로그인 할경우 접속상태 chk = 2
	
	int loginChkMin(UserPARAM param);	// 로그아웃 할경우 비접속 상태 chk = 1
	
	int insFr(UserPARAM param);	// 친구 추가
	
	
	// delete 
	
	int delProfile_img(UserPARAM param); // 프로필 사진 삭제
	
	int delImg(int i_user);
	
	int delFr(UserPARAM param);
	
}
