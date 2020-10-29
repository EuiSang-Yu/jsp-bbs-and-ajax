package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;


public class BoardUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		
		DAO dao = new DAO();
		BoardDTO[] arr = null;
		
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		
		try {
			arr = dao.selectByboard_id(board_id, board_champion);  // 읽어오기
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
