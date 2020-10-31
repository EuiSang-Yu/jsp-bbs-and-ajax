package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;
import dto.MemberDTO;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("마이페이지커멘드 진입");
		DAO dao = new DAO();
		MemberDTO[] arr = null;
		
		int user_uid = session.getAttribute("user_uid");
		
		try {
			arr = dao.selectByuser_uid(user_uid);  // 읽어오기
			System.out.println("+++++++++++++++++++++++++++++arr : " + arr);
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
