package com.jy.hibaby.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.board.model.BoardVO;

@Mapper
public interface BoardMapper {
	// select
	List<BoardDMI> selBoard();
	
	int maxI_board(); 					  // 게시글 등록시 최대 i_board값 추가하기 (실제 로컬에서 주소지정할때 사용)
	
	
	// insert
	int insBoard(BoardVO param);	 // 판매글 등록
	
	// update
	int updImage(BoardVO param); // 사진 등록
	
	int updBoard(BoardVO param); // 판매글 수정
	
	// delete
	int delBoard(BoardPARAM param); // 게시글 삭제
}
