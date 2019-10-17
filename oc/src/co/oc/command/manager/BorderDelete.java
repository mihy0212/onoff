package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;


public class BorderDelete implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		String askNum = request.getParameter("askNum");
		System.out.println("askNum");
		AskDAO.getInstance().delete(conn, askNum);
				

		RequestDispatcher dispatcher = request.getRequestDispatcher("/list.do");
		dispatcher.forward(request, response);

		DAO.disconnect(conn);
	}

}


