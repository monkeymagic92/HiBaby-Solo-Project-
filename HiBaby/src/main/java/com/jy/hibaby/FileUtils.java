package com.jy.hibaby;


import java.io.File;
import java.util.UUID;

import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	public static void makeFolder(String path) {
		File dir = new File(path);	
		System.out.println("1파일유틸 패스 : " + path);
		if(!dir.exists()) { // 만약 폴더가 없다면 ? 폴더만들어라
			System.out.println("2파일유틸 패스 : " + path);
			dir.mkdirs(); // mkdirs, mkdir 두개가 있는데 그냥 무조건 midirs 사용해라(굳이 좋은거냅두고 왜 mkdir씀 ? 복수형써라 그냥)
		}
		System.out.println("3파일유틸 패스 : " + path);
	}
	
	public static String getExt(String fileNm) {
		return fileNm.substring(fileNm.lastIndexOf("."));
	}
	
	
	public static String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
    }
	
	
	public static String getRandomUUID(MultipartFile mf) {
		String originFileNm = mf.getOriginalFilename();
		String ext = getExt(originFileNm);
		return UUID.randomUUID() + ext;
	}
	
	// thumFile saveFile 이랑 같은거임 saveFile 쓰면됨
	public static String saveFile(String path, MultipartFile mf) {
		if(mf.getOriginalFilename() == "") { return null; }
		String saveFileNm = getRandomUUID(mf);
		
		try {
			mf.transferTo(new File(path + saveFileNm));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return saveFileNm;
	}
	
	public static String thumFile(String path, MultipartFile mf) {
		if(mf.isEmpty()) { return null; }
		String saveFileNm = getRandomUUID(mf);
		
		try {
			mf.transferTo(new File(path + saveFileNm));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return saveFileNm;
	}
	

	public static boolean delFile(String path) {
		File file = new File(path);
		if(file.exists()) {
			System.out.println("4");
			return file.delete();
		}
		return false;
	}
}
