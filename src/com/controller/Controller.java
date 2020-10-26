package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.command.NoticeWriteCommand;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
		
		
		// URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		
		// 컨트롤러는 다음의 두가지를 결정해야 한다
		Command command = null;  // 어떠한 로직을 수행할지 결정
		String viewPage =  null;  //  어떠한 페이지(뷰)를 보여줄지 결정
		
		// 컨트롤러는 커맨드에 따라 로직 수행
		// 결과를 보낼 view 를 결정
		
		switch(com) {
		case "/noticeWrite.do":
			viewPage = "noticeWrite.jsp";
			break;
		
		case "/noticeWriteOk.do":
			command = new NoticeWriteCommand();
			command.execute(request, response);
			viewPage = "noticeWriteOk.jsp";
			break;	
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}






























