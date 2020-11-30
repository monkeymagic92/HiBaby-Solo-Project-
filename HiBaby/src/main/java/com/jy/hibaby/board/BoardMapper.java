package com.jy.hibaby.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.Pagination;
import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;

@Mapper
public interface BoardMapper {
	// select
	List<BoardDMI> selBoard(Pagination p);	// 게시글 전체 목록
	
	int maxI_board();		// 게시글 등록시 최대 i_board값 추가하기 (실제 로컬에서 주소지정할때 사용)
	
	int totalBoardCount();	// 게시글 총 개수
	
	List<BoardDMI> searchBoard(BoardDMI dmi);	// 게시글 검색
	
	int totalSearchCount(BoardDMI dmi);	// 검색시 게시글 개수
	// insert
	
	
	// update
	
	
	// delete
	int delBoard(BoardPARAM param); // 게시글 삭제
}
