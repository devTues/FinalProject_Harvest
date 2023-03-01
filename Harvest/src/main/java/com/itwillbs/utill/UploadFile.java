package com.itwillbs.utill;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
		//파일 업로드
//		public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
		public static String fileUpload(HttpServletRequest request, MultipartFile fileName) throws Exception {
			String myPath = "resources/upload/";
			// 절대 경로
			String uploadPath = request.getRealPath(myPath);
			//상대 경로
//			String uploadPath = request.getSession().getServletContext().getRealPath(myPath);
			System.out.println(uploadPath);
			UUID uuid = UUID.randomUUID();
			String newFileName = uuid.toString() + "_" + fileName.getOriginalFilename();
			
			FileCopyUtils.copy(fileName.getBytes(), new File(uploadPath, newFileName));
			return newFileName;
		}
		
		//폴더이름 및 폴더 생성
//		public static String calcPath(String uploadPath) {
//			Calendar cal = Calendar.getInstance();
//			String yearPath = File.separator + cal.get(Calendar.YEAR);
//			String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//			String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

//			makeDir(uploadPath, yearPath, monthPath, datePath);
//			makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

//			return datePath;
//		}
		//폴더 생성
//		private static void makeDir(String uploadPath, String... paths) {
//
//			if (new File(paths[paths.length - 1]).exists()) {
//				return;
//			}
//
//			for (String path : paths) {
//				File dirPath = new File(uploadPath + path);
//
//				if (!dirPath.exists()) {
//					dirPath.mkdir();
//				}
//			}
//		}
}
