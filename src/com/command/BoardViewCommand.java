package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;



public class BoardViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		DAO dao = new DAO();
		
		BoardDTO [] arr = null;
		


		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));


		System.out.println("board_id : " + board_id);

		
		try {
			arr = dao.readByboard_id(board_id, board_champion);
			request.setAttribute("list", arr);
		} catch(Exception e) {
			e.printStackTrace();
		}		

	}

}
