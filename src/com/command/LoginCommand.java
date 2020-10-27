package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class LoginCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
	
		String loginID = request.getParameter("loginID");
		String loginPW = request.getParameter("loginPW");
		
		
		//빈칸일때 cnt =0임
		if(loginID != null && loginPW != null &&
				loginID.trim().length() > 0 && loginPW.trim().length() > 0) {
			try {
				if(loginPW.equals(dao.login(loginID))) {  
					cnt = 1;
				}else {
					cnt = 0;
				}
			} catch (SQLException e) {
				cnt = 0;
			}
		}
		System.out.println("cnt : "+cnt);
		request.setAttribute("result", cnt);
		
	}
	
	

}
