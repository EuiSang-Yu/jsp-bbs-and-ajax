package com.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AjaxController implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			int cnt = 0;
			
			
			try {
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", cnt);
		}
}
