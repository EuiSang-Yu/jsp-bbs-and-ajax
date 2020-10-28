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
	
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		
		
		//빈칸일때 cnt =0임
		if(member_id != null && member_pw != null &&
				member_id.trim().length() > 0 && member_pw.trim().length() > 0) {
			try {
				if(member_pw.equals(dao.login(member_id))) {  
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
