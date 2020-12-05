package com.jy.hibaby.cmt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jy.hibaby.TimeMaximum;
import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.cmt.model.CmtDMI;
import com.jy.hibaby.cmt.model.CmtVO;

@Service
public class CmtService {
	@Autowired
	private CmtMapper mapper;
	
		
	// 댓글 등록
	public int insCmt(CmtVO vo) {
        return mapper.insCmt(vo);
    }
	
	// 댓글 삭제
	public int delCmt(CmtVO vo) {
		return mapper.delCmt(vo);
	}
	
	
	// 댓글 갯수
	public int countCmt(BoardPARAM param) {
		int countCmt = mapper.cmtCount(param);
		return countCmt;
	}
	
	
	// 댓글 수정
	public int updCmt(CmtVO vo) {
		return mapper.updCmt(vo);
	}
	
	/*
	// 댓글 뿌리기
	public List<CmtDMI> selCmt(BoardPARAM param) {
		return mapper.selCmt(param);
	}
	*/
	
	// 댓글 뿌리기
	public List<CmtDMI> selCmt(BoardPARAM param) {
		
		return mapper.selCmt(param);
	}
	
	
	// 등록일자를 현재 시간 기준으로 바꿔주는 메소드 ex) 몇 시간전, 몇 일전..
	public static BoardDMI transListR_dt(BoardDMI param) {
		String paramR_dt = param.getR_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		try {
			date = sdf.parse(paramR_dt);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String strR_dt = TimeMaximum.calculateTime(date);
		param.setR_dt(strR_dt);
		
		return param;
	}
}
