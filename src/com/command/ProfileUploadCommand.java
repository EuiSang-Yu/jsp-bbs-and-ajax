package com.command;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import dao.DAO;
import dto.UserDTO;

public class ProfileUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session= request.getSession();
		DAO dao = new DAO();
		UserDTO[] arr = null;
		int cnt = 0;
		
		
		String user_id = (String) session.getAttribute("user_id");
		
		// MultipartRequest 객체 생성 준비
		String saveDirectory = "C:\\goldspoon_workspace\\OP_IT\\WebContent\\profileImage";   	// 파일 저장 경로
		int maxPostSize = 5 * 1024 * 1024;  // POST 받기, 최대 5M byte
		String encoding = "utf-8";  // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트
		
		try{ // 실제로 예외를 반드시 cath 할 필요는 없지만 처리
			multi = new MultipartRequest(
					request,
					saveDirectory,
					maxPostSize,
					encoding,
					policy
					);
		System.out.println("사진------------------" + multi);
		} catch(Exception e){
			e.printStackTrace();	
		}
	
		Enumeration names = null;
		
		// 1. Parameter name 들 추출
		names = multi.getParameterNames(); // 일반 form 요소 name들 추출
		while(names.hasMoreElements()){
			String name = (String)names.nextElement();  // name
			String value = multi.getParameter(name); // value
		}
		
		// 2. File 들 추출
		names = multi.getFileNames();   // type="file" 요소 name들 추출
		String fileSystemName = null;
		while(names.hasMoreElements()){
			// <input type="file"> 의 name 가져오기
			String name = (String)names.nextElement();  
			
			// 위 name 에는 폼요소의 name 이 담겨있다.
			// 그 name 을 가지고 원래 파일 (업로드 할 파일) 을 가져온다
			String originalFileName = multi.getOriginalFileName(name);
			
			// 만약 업로드할 폴더에 동일 이름의 파일이 있으면 현재 올리는 파일 이름은 바뀐다 
			// (FileRenamePolicy 중복정책)
			// 그리고 나서 시스템 에 실제 업로딩 된 이름을 알려준다
			fileSystemName = multi.getFilesystemName(name);
			
			// 업로딩된 파일의 타입 : MIME 타입 ( ex: image/png ...)
			String fileType = multi.getContentType(name);
			
			System.out.println("사진이름----------------------------------------------"+fileSystemName);
			request.setAttribute("user_profileImage", fileSystemName);
		} // end while
		
		try {
			cnt = dao.profileImage_upload(fileSystemName);
		} catch (Exception e) {
			e.printStackTrace();
		}




	}

}
