package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class HistoryMainCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
	
		//input에서 입력한 값
		String search_id = request.getParameter("search_id");

		//빈칸일때 cnt =0임
		if(search_id != null && search_id.trim().length() > 0) {
			
			request.setAttribute("search_id", search_id);
		}
		
	}
	
	
}
