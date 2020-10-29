package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;


public class BoardListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		
		DAO dao = new DAO();  // DAO 객체 생성
		BoardDTO[] arr = null;
		int board_champion = 0;
		
		try {
			
			board_champion = Integer.parseInt(request.getParameter("board_champion"));
			arr = dao.select(board_champion);  // 트랜잭션 수행
			
			
			System.out.println("리스트board_champion : " + board_champion);
			
			// "list" 란  name 으로 request 에 arr 을 저장
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("list", arr);
			request.setAttribute("board_champion", board_champion);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
