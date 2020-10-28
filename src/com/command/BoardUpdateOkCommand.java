package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;


public class BoardUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 지연	
		int cnt = 0;
		DAO dao = new DAO();
		
		//parameter
		int no = Integer.parseInt(request.getParameter("board_no"));
		String title = request.getParameter("board_title");
		String content = request.getParameter("board_content");
		
		if(title != null && title.trim().length() > 0) {
			try {
				cnt = dao.update(title, content, no);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}

}
