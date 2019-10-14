package co.oc.command.menu;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;

public class MyaskDeleteComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		String askNum = request.getParameter("key");
		System.out.println(askNum);
		AskDAO.getInstance().delete(conn, askNum);

		response.sendRedirect("myAsklist.do");


		DAO.disconnect(conn);

	}

}
