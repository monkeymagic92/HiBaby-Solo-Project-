package com.jy.hibaby.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jy.hibaby.FileUtils;
import com.jy.hibaby.board.model.BoardDMI;
import com.jy.hibaby.board.model.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	// 전체목록 이라서 일단 전체 회원이 나타나게 해놨음
	// 일단 매개변수 없이 작업하고 그유저게시글이 안뜨면 따로 매개변수값 로그인유저 세션값 박기  
	public List<BoardDMI> selBoard() {
		return mapper.selBoard();
	}
	
	// 판매글 등록
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
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/HiBaby/board/" + i_board + "/";
		
		System.out.println("경로 : " + path);
		
		// 단일파일
		/*
		MultipartFile file = mReq.getFile("image");
		FileUtils.makeFolder(path);
		String saveFile = FileUtils.thumFile(path, file);
		*/	
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardDMI vo = new BoardDMI();
				MultipartFile mf = fileList.get(i);

				String saveFileNm = FileUtils.thumFile(path, mf);
				
				System.out.println("saveFileNm: " + saveFileNm);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(list.size()<6) { // 총 사진 갯수 
				for(int i=list.size(); i<5; i++) {
					System.out.println("리스트 사이즈 : " + list.size());
					BoardDMI vo = new BoardDMI();
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
}
