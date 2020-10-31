package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class ReplyWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		
		//입력한 값 (parameter) 받아오기
		String reply_writer = request.getParameter("reply_writer");
		String reply_content = request.getParameter("reply_content");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		System.out.println("board_title : "+reply_writer +" , board_content : " + reply_content + ", board_id" + board_id);
		
		//유효성 체크
		if(reply_writer != null && reply_content != null &&
				reply_writer.trim().length() > 0 && reply_content.trim().length() > 0) {
			try {
				cnt = dao.reply_insert(reply_writer, reply_content, board_id);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		
	}



}
