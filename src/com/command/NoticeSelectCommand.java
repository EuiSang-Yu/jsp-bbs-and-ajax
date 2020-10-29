package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;


public class NoticeSelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		// 여기서 챔피언 고유번호에 따름(게시판)
		
		DAO dao = new DAO();
		BoardDTO[] arr = null;
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		int champion_no = Integer.parseInt(request.getParameter("champion_no"));
		
		try {
			arr = dao.selectByBoard_no(board_no,champion_no);  // 읽어오기
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
