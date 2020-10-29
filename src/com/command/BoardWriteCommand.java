package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int champion_no = Integer.parseInt(request.getParameter("champion_no"));
		
		System.out.println("라이트champion_no : " + champion_no);
		
		request.setAttribute("champion_no", champion_no);
		
	}

}
