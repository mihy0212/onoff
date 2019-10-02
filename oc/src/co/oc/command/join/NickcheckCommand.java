package co.oc.command.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;

public class NickcheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();

		String Nick = request.getParameter("userNickname");
		Connection conn = DAO.connect();
		boolean chk = dao.isNickCheck(conn, Nick);
		DAO.disconnect(conn);
		String path;
		if (chk)
			path = "jsp/join/nickOk.jsp"; // 사용가능 한 아이디
		else
			path = "jsp/join/nickNo.jsp"; // 사용불가능 한 아이디
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}
}