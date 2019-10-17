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
import co.oc.dto.AskDTO;

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
		int n=	AskDAO.getInstance().update(conn, dto);
		
		String path = null;

		// 성공하면 
		if (n != 0) {
			path = "myAskRead.do";
		}
		// 실패하면
		else {
			path = "myaskupForm.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		DAO.disconnect(conn);
		
		 
		 
	}

}
