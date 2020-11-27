package com.jy.hibaby.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.board.model.BoardVO;

@Mapper
public interface BoardMapper {
	List<BoardDMI> selBoard();
	
	
	// insert
	int insBoard(BoardVO param);	 // 판매글 등록
	
	// update
	int updImage(BoardVO param); // 사진 등록
	
	int updBoard(BoardVO param); // 판매글 수정
	
	// delete
	int delBoard(BoardPARAM param); // 게시글 삭제
}
