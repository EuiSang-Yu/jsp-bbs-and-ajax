package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class BoardDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			int cnt = 0;
			DAO dao = new DAO();
			
			int board_no = Integer.parseInt(request.getParameter("board_no"));
			int champion_no = Integer.parseInt(request.getParameter("champion_no"));
			
			try {
				cnt = dao.delete(board_no, champion_no);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", cnt);
		}


}
