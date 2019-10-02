package co.oc.command.join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;

public class LogoutCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.invalidate(); //세션 삭제
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/join/logout.jsp");
		dispatcher.forward(request, response);
			
		
	}

}
