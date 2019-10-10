package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;


public class UserDelete implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();

		String userNum = request.getParameter("key");
		System.out.println(userNum);
		UserDAO.getInstance().delete(conn, userNum);
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/userlist");
		dispatcher.forward(request, response);

		DAO.disconnect(conn);
	}

}


