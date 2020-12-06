package com.jy.hibaby.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jy.hibaby.FileUtils;
import com.jy.hibaby.Pagination;
import com.jy.hibaby.SecurityUtils;
import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardPARAM;
import com.jy.hibaby.board.model.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	// 전체목록 이라서 일단 전체 회원이 나타나게 해놨음
	// 일단 매개변수 없이 작업하고 그유저게시글이 안뜨면 따로 매개변수값 로그인유저 세션값 박기  
	public List<BoardDMI> selBoard(Pagination p) {
		return mapper.selBoard(p);
	}
	
	// 게시글 총 개수
	public int totalBoardCount() {
		return mapper.totalBoardCount();
	}
	
	// 검색
	public List<BoardDMI> searchBoard(Pagination p) {
		return mapper.searchBoard(p);
	}
	
	// 검색시 총 개수
	public int totalSearchCount(BoardDMI dmi) {
		return mapper.totalSearchCount(dmi);
	}

	public int selectBoardListCnt(BoardDMI dmi) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// 게시글 등록
	public int insBoard(BoardDMI param, MultipartHttpServletRequest mReq,
			HttpSession hs) {
		
		int i_board = 1;
		int result = 0;
		try { // 만약 게시글이 없는상태에서는 xml 에러가 뜨니 i_board 값을 1으로 주겠다
			i_board = mapper.maxI_board();
			
		} catch(Exception e) {
			i_board = 1;
		}
		hs.setAttribute("i_board", i_board); // SaleReg.POST DETAIL로 값 보낼떄 등록글을 바로 띄워줄수있게 세션박기
		
		System.out.println("아이보드값 : " + i_board);
		
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		
		System.out.println("경로 : " + path);
				
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);
				String saveFileNm = FileUtils.saveFile(path, mf);
				System.out.println("saveFileNm: " + saveFileNm);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			
			// 혹시 사진등록 문제생길경우 여기 숫자 수정하기 @@@@@@@@@@@@@
			if(list.size()<5) { // 총 사진 갯수 
				for(int i=list.size(); i<4; i++) {
					System.out.println("리스트 사이즈 : " + list.size());
					BoardVO vo = new BoardVO();
					vo.setImageFile("");
					list.add(vo);
				}
			}
			
			param.setImageFileList(list);
			result = mapper.insBoard(param);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 3;
		}	
		
		return result;
	}
	
	
	// 게시글 수정
	public int updBoard(BoardVO param, MultipartHttpServletRequest mReq,
			HttpSession hs) {
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		System.out.println("파일리스트 사이즈 : " + fileList.size());
		
		String fileChk = null;
		if(fileList.size() == 0) {
			int result = mapper.updBoard(param);
			System.out.println("file사이즈 : " + fileList.size());
			return result;
		}
					
		System.out.println("이거뜨면 밑에실행된거@@@@@@@@@@@@@@");

		int result = mapper.updBoard(param);
		int i_board = (int)hs.getAttribute("updI_board");
		if(param.getTitle().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		List<BoardVO> list = new ArrayList();
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);
				System.out.println("mf값 :" + mf);
				
				String saveFileNm = FileUtils.saveFile(path, mf);
				fileChk = saveFileNm;
				System.out.println("saveFileNm: " + saveFileNm);
				
				vo.setSeq(i+1);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(fileChk != null) {
				if(list.size()<5) { // 총 사진 갯수 
					for(int i=list.size(); i<4; i++) {
						BoardVO vo = new BoardVO();
						vo.setImageFile("");
						vo.setSeq(i+1);
						list.add(vo);
					}
				}
			}
			
			for(BoardVO vo : list) {
				vo.setI_board(i_board);
				result = mapper.updImage(vo);
			}
			
		} catch(Exception e) {
			result = 1;
		}	
		
		hs.removeAttribute("updI_board");
		return result;
	}
	
	
	
	// 게시글 상세페이지
	public BoardPARAM detailBoard(BoardPARAM vo) {
		return mapper.detailBoard(vo);
	}
	
	
	// 판매글 삭제
	public int boardDelete(BoardPARAM param) {
		
		return mapper.boardDelete(param);
	}
	
	
	// 조회수 증가
	public void addHit(BoardPARAM param, HttpServletRequest req) {
		String myIp = req.getRemoteAddr();
		ServletContext ctx = req.getServletContext();
		
		int i_user = SecurityUtils.getLoginUserPk(req);
		String currentReadIp = (String)ctx.getAttribute("current_board_read_ip" + param.getI_board());
		if(currentReadIp == null || !currentReadIp.equals(myIp)) {
			param.setI_user(i_user);
			mapper.updAddHit(param);
			ctx.setAttribute("current_board_read_ip" + param.getI_board(), myIp);
		}
	}
	
	

}
