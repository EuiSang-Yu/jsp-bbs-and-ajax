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
		String signUpID = request.getParameter("signUpID");
		String signUpPW = request.getParameter("signUpPW");
		String signUpName = request.getParameter("signUpName");
		String signUpEmail = request.getParameter("signUpEmail");
		String signUpNum = request.getParameter("signUpNum");

		System.out.println("signUpID : " + signUpID + " , " +
		"signUpPW : " + signUpPW + " , " +
				"signUpName : "+ signUpName + " , " +
				"signUpEmail : " + signUpEmail + " ," +
				"signUpNum : " + signUpNum);

	
	

			try {
				cnt = dao.signUp(signUpID, signUpPW, signUpName, signUpEmail, signUpNum);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		

		request.setAttribute("result", cnt); //signupOK 결과값 request

	}

}
