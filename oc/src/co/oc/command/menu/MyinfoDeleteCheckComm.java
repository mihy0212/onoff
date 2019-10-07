package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;

public class MyinfoDeleteCheckComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DAO.connect();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/userdelecte.jsp");
		dispatcher.forward(request, response);
		
		DAO.disconnect(conn);
	}

}
