package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.Command;
import com.command.HistoryMainCommand;
import com.command.LoginCommand;
import com.command.ReplyDeleteCommand;
import com.command.ReplyWriteCommand;
import com.command.MyPageUpdateOkCommand;
import com.command.ProfileUploadCommand;
import com.command.MypageCommand;
import com.command.UserSignUpCommand;
import com.command.BoardDeleteCommand;
import com.command.BoardListCommand;
import com.command.BoardUpdateCommand;
import com.command.BoardUpdateOkCommand;
import com.command.BoardViewCommand;
import com.command.BoardWriteCommand;
import com.command.BoardWriteOkCommand;



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
		
		case "/historyMain.do":
			command = new HistoryMainCommand();
			command.execute(request, response);
			viewPage = "historyMain.jsp";
			break;
		
		case "/boardListTable.do":
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage = "boardListTable.jsp";
			break;
		
		case "/boardWrite.do":
			command = new BoardWriteCommand();
			command.execute(request, response);
			viewPage = "boardWrite.jsp";
			break;
		
		case "/boardWriteOk.do":
			command = new BoardWriteOkCommand();
			command.execute(request, response);
			viewPage = "boardWriteOk.jsp";
			break;	
			
		case "/boardView.do":
			command = new BoardViewCommand();
			command.execute(request, response);
			viewPage = "boardView.jsp";
			break;
		case "/boardUpdate.do":
			command = new BoardUpdateCommand();
			command.execute(request, response);
			viewPage = "boardUpdate.jsp";
			break;
		case "/boardUpdateOk.do":
			command = new BoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "boardUpdateOk.jsp";
			break;
			
		case "/boardDeleteOk.do":
			command = new BoardDeleteCommand();
			command.execute(request, response);
			viewPage = "boardDeleteOk.jsp";
			break;	
			
		case "/signUp.do":
			viewPage = "signUp.jsp";
			break;	
			
		case "/signupOk.do":
			command = new UserSignUpCommand();
			command.execute(request, response);
			viewPage = "signupOk.jsp";
			break;
			
		case "/login.do":
			viewPage = "login.jsp";
			break;
			
		case "/loginOk.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
			
			
		case "/logout.do":
			viewPage = "logout.jsp";
			break;
			
		case "/myPage.do":
			command = new MypageCommand();
			command.execute(request, response);
			viewPage = "myPage.jsp";
			break;
			
		case "/myPageUpdateOk.do":
			command = new MyPageUpdateOkCommand();
			command.execute(request, response);
			viewPage = "myPageUpdateOk.jsp";
			break;
				
			
		case "/replyWriteOk.do":
			command = new ReplyWriteCommand();
			command.execute(request, response);
			viewPage = "replyWriteOk.jsp";
			break;
		
			
		case "/replyDeleteOk.do":
			command = new ReplyDeleteCommand();
			command.execute(request, response);
			viewPage = "replyDeleteOk.jsp";
			break;
			

		case "/profileUpload.do":
			command = new ProfileUploadCommand();
			command.execute(request, response);
			viewPage = "profileUpload.jsp";
			break;
		}
		
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}






























