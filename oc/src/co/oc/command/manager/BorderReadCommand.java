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
import co.oc.dto.AskDTO;

public class BorderReadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AskDAO dao = new AskDAO();
		AskDTO dto = new AskDTO();
		int key = Integer.parseInt(request.getParameter("key"));
		Connection conn = DAO.connect();
		String check = null;
		String content = null;
		dto = dao.selectOne(conn, check, content, 1, 1);
		request.setAttribute("list", dto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/borderRead.jsp");
		dispatcher.forward(request, response);		
		
	}

}