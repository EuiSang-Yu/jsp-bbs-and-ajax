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
			
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			int board_champion = Integer.parseInt(request.getParameter("board_champion"));
			
			try {
				cnt = dao.delete(board_id, board_champion);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", cnt);
		}


}
