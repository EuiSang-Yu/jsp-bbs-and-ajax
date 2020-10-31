package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class MyPageUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 지연	
			int cnt = 0;
			DAO dao = new DAO();
			
			//parameter
			int user_uid = Integer.parseInt(request.getParameter("user_uid"));
			
			String user_pw = request.getParameter("user_pw");
			String user_email = request.getParameter("user_email");
			String user_phone = request.getParameter("user_phone");
			
			if(user_email != null && user_email.trim().length() > 0) {
				try {
					cnt = dao.mypageUpdate(user_uid, user_pw, user_email, user_phone);
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
			request.setAttribute("result", cnt);
		}

	}


