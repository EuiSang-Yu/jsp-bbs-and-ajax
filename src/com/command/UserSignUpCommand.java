package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class UserSignUpCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		
		//입력한 값 (parameter) 받아오기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int viewCnt = 0;
		
		System.out.println("board_title : "+title +" , board_content : " + content);
		
		//유효성 체크
		if(title != null && content != null &&
				title.trim().length() > 0 && content.trim().length() > 0) {
			try {
				cnt = dao.insert(title, content, viewCnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//end if
		
		
		request.setAttribute("result", cnt);
		
	}
	
	

}
