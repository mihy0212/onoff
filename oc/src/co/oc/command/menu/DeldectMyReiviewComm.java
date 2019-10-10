package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;

public class DeldectMyReiviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();

		String reviewNum = request.getParameter("reviewNum");
		
		ReviewDAO.getInstance().delete(conn, reviewNum);

		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_act.jsp");
		dispatcher.forward(request, response);

		DAO.disconnect(conn);
	}

}
