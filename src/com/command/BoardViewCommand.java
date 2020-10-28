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
		
<<<<<<< HEAD
		int uid = Integer.parseInt(request.getParameter("no")); //여기가에런데 넘버포맷엥러..
=======
		int board_no = Integer.parseInt(request.getParameter("board_no"));
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
		
		try {
			arr = dao.readByBoard_no(board_no);   // 읽기 + 조회수 증가	
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}

}
