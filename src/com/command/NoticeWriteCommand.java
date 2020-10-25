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
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_viewCnt = 123;
		

			try {
				cnt = dao.insert(board_title, board_content, board_viewCnt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		
		
		request.setAttribute("result", cnt);
	}
}
