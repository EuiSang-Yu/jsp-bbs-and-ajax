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
		
		int uid = Integer.parseInt(request.getParameter("board_no"));
		
		try {
			arr = dao.readByUid(uid);   // 읽기 + 조회수 증가	
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}

}
