package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class AnswerCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String askRe = request.getParameter("askRe1");
		String userNum = request.getParameter("userNum");

		AskDTO adto = new AskDTO();
		adto.setUserNum(userNum);
		System.out.println(userNum);
		adto.setAskRe(askRe);
		adto.setAskTitle(request.getParameter("reTitle"));
		adto.setAskContent(request.getParameter("reContent"));
		
		Connection conn = DAO.connect();
		
		int n = AskDAO.getInstance().insert(conn, adto);
		if( n !=0 ) {
			response.sendRedirect("borderRead.do?key="+askRe);
		}
		
		DAO.disconnect(conn);
	}

}
