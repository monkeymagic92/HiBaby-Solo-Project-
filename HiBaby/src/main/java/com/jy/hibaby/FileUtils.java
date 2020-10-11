package com.jy.hibaby;


import java.io.File;
import java.util.UUID;

import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	public static void makeFolder(String path) {
		File dir = new File(path);		
		if(!dir.exists()) { // 만약 폴더가 없다면 ? 폴더만들어라 
			dir.mkdirs(); // mkdirs, mkdir 이있는데 그냥 무조건 midirs 만들어라(굳이 좋은거냅두고 왜 mkdir씀 ? 복수형써라 그냥)
		}
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
	
	
	public static String saveFile(String path, MultipartFile mf) {
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
