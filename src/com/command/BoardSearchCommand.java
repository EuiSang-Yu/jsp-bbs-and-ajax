package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;

public class BoardSearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		DAO dao = new DAO();  // DAO 객체 생성
		BoardDTO[] arr = null;
		int board_champion = 0;
		String searchKind = "";
		String searchText = "";
		
		System.out.println("보드 서치 들어옴");
		try {
			
			board_champion = Integer.parseInt(request.getParameter("board_champion"));
			searchKind = request.getParameter("searchKind");
			searchText = request.getParameter("searchText");
			System.out.println("searchKind : " + searchKind);
			System.out.println("searchText : " + searchText);
			arr = dao.searchSelect(board_champion, searchKind, searchText);
			System.out.println("서치 셀렉 완료");
			System.out.println(arr.toString());
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("searchList", arr);
		request.setAttribute("board_champion", board_champion);
	}

}
