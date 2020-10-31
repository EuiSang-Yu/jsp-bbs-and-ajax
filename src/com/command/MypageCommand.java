package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
<<<<<<< HEAD
import dto.MemberDTO;
=======
import dto.BoardDTO;
import dto.UserDTO;
>>>>>>> branch 'master' of https://github.com/devYoooo/OP_IT.git

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session= request.getSession();
		System.out.println("마이페이지커멘드 진입");
		DAO dao = new DAO();
		UserDTO[] arr = null;
		
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(user_id);
		try {
			arr = dao.selectByuser_id(user_id);  // 읽어오기
			System.out.println("+++++++++++++++++++++++++++++arr : " + arr);
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}

}