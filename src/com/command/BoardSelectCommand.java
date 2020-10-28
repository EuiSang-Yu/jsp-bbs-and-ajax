package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;
import dto.WriteDTO;


public class BoardSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		
		DAO dao = new DAO();
		BoardDTO[] arr = null;
		
		int uid = Integer.parseInt(request.getParameter("champion_no"));
		
		try {
			arr = dao.selectByBoard_no(uid);  // 읽어오기
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
