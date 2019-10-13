package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dto.UserDTO;

public class MyinfoDeleteCheckComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Connection conn = DAO.connect();
		/*
		 * Connection conn = DAO.connect(); UserDTO dto = new UserDTO(); HttpSession
		 * session = request.getSession(false); String userNum =
		 * (String)session.getAttribute("userNum");
		 * dto.setUserPw(request.getParameter("userPw"));
		 */
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/userdelecte.jsp");
		dispatcher.forward(request, response);
		
		DAO.disconnect(conn);
	}

}
