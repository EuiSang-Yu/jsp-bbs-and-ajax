package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class UserSignUpCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();

		//회원정보 값 받아오기
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_phone = request.getParameter("member_phone");

		System.out.println("member_id : " + member_id + " , " +
				"member_pw : " + member_pw + " , " +
				"member_name : "+ member_name + " , " +
				"member_email : " + member_email + " ," +
				"member_phone : " + member_phone);

	
	
		if(member_id != null && member_pw != null && member_name != null && member_email != null && member_phone != null &&
				member_id.trim().length() > 0 && member_pw.trim().length() > 0 && member_name.trim().length() > 0
				 && member_email.trim().length() > 0 && member_phone.trim().length() > 0) {
			try {
				cnt = dao.signUp(member_id, member_pw, member_name, member_email, member_phone);
			} catch (SQLException e) {
				cnt = 0;
			}
		}

		request.setAttribute("result", cnt); //signupOK 결과값 request

	}

}
