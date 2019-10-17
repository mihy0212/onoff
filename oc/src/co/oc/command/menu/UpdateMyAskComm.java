package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.AskDTO;
import co.oc.dto.ReviewDTO;

public class UpdateMyAskComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 접속
		Connection conn = DAO.connect();
	AskDTO dto = new AskDTO();
	
		dto.setUserNum(request.getParameter("userNum"));
		dto.setAskNum(request.getParameter("askNum"));
		dto.setAskContent(request.getParameter("askContent"));
		dto.setAskTitle(request.getParameter("askTitle"));
		
		AskDAO.getInstance().update(conn, dto);
		// 접속 해제
		
		response.sendRedirect("myAsklist.do");
		DAO.disconnect(conn);
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("myfavorite.do");
		 * dispatcher.forward(request, response);
		 */
	}

}
