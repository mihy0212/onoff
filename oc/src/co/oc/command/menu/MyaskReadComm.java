package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;

public class MyaskReadComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
	AskDAO dao = new AskDAO();
	
	String askNum = request.getParameter("askNum");
	
//	AskDTO dto = AskDAO.getInstance().selectOne(conn, askNum, content, start, end);
		
		

	RequestDispatcher dispatcher = request.getRequestDispatcher("my_ask.jsp");
	dispatcher.forward(request, response);
	DAO.disconnect(conn);
	}
}
