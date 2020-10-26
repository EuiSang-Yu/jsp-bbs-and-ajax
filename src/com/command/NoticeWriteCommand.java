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
		String test_title = request.getParameter("test_title");
		String test_content = request.getParameter("test_content");
		
			
			try {
				cnt = dao.insert(test_title, test_content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		
		
		request.setAttribute("result", cnt);
	}
}
