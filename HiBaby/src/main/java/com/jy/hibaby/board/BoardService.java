package com.jy.hibaby.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.board.model.BoardDMI;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	// 전체목록 이라서 일단 전체 회원이 나타나게 해놨음
	// 일단 매개변수 없이 작업하고 그유저게시글이 안뜨면 따로 매개변수값 로그인유저 세션값 박기  
	public List<BoardDMI> selBoard() {
		return mapper.selBoard();
	}
}
