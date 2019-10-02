package co.oc.command.join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;

public class LoginFormCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Login 폼이 화면에 표현 할 수 있도록 정의
		RequestDispatcher dispatcher = request.getRequestDispatcher("../join/jsp/loginform.jsp");
		dispatcher.forward(request, response);

	}

}
