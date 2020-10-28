package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;
import dto.WriteDTO;


public class BoardViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		DAO dao = new DAO();
<<<<<<< HEAD
		BoardDTO[] arr = null;
		
=======
		BoardDTO [] arr = null;
		


		int uid = Integer.parseInt(request.getParameter("no")); //여기가에런데 넘버포맷엥러..


>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
		int board_no = Integer.parseInt(request.getParameter("board_no"));
<<<<<<< HEAD
		System.out.println("board_no : " + board_no);
=======

>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git
		
		try {
			arr = dao.readByBoard_no(board_no);   // 읽기 + 조회수 증가	
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}

}
