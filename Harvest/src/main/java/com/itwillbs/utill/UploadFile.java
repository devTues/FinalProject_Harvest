package com.itwillbs.utill;

import java.io.File;
import java.util.UUID;


import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
	//파일 업로드
	public static String fileUpload(MultipartFile fileName, String... uploadPath) throws Exception {
		UUID uuid = UUID.randomUUID();
		
		String newFileName = uuid.toString() + "_" + fileName.getOriginalFilename();
		
		// 물리적 경료에 저장
		FileCopyUtils.copy(fileName.getBytes(), new File(uploadPath[0], newFileName));
		// 상대적 경로에 저장
		FileCopyUtils.copy(fileName.getBytes(), new File(uploadPath[1], newFileName));
		
		return newFileName;
	}
	
}
