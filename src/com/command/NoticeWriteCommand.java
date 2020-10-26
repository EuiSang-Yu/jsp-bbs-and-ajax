package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class NoticeWriteCommand implements Command {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		
		//입력한 값 (parameter) 받아오기
		String title = request.getParameter("board_title");
		String content = request.getParameter("board_content");
		int viewCnt = 123;
		
//		//유효성 체크
//		if(title != null && content != null &&
//				title.trim().length() > 0 && content.trim().length() > 0) {
//			try {
//				cnt = dao.insert(title, content, viewCnt);
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}//end if
		
		try {
			System.out.println("들어오나?");
			cnt = dao.insert(title, content, viewCnt);
			System.out.println("insert완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("result", cnt);
	}
}
