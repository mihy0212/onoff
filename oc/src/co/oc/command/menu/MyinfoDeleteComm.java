package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;

public class MyinfoDeleteComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //접속
         Connection conn = DAO.connect();		 
		 // 세션이 가지고있는 로그인한 ID 정보를 가져온다
		 HttpSession session = request.getSession(false);
		 String userNum = (String)session.getAttribute("userNum");
		 System.out.println(userNum);
		 //String path = null;

		 UserDAO.getInstance().delete(conn, userNum);
			
		 session.invalidate();
		RequestDispatcher dispatcher=request.getRequestDispatcher("loginform.do");
		dispatcher.forward(request, response);
	  
		//접속 해제
		 DAO.disconnect(conn);



	}

}
