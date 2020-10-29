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
		


		int board_no = Integer.parseInt(request.getParameter("board_no"));
		int champion_no = Integer.parseInt(request.getParameter("champion_no"));


		System.out.println("board_no : " + board_no);

		
		try {
			arr = dao.readByBoard_no(board_no, champion_no);
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}

}
