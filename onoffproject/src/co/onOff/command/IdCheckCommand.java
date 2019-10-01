package co.onOff.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.onOff.DAO.UsersDAO;

public class IdCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsersDAO dao = new UsersDAO();

		String id = request.getParameter("userID");
		boolean chk = dao.isIdCheck(id);
		String path;
		if (chk)
			path = "jsp/idOk.jsp"; // 사용가능 한 아이디
		else
			path = "jsp/idNo.jsp"; // 사용불가능 한 아이디
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}
}
