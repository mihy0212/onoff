package co.oc.command.manager;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

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

		String key = request.getParameter("key");
		
		Connection conn = DAO.connect();
		
		List<AskDTO> list = AskDAO.getInstance().selectOne(conn, "ask_re", key, 1, 10);
		request.setAttribute("list", list);
		
		DAO.disconnect(conn);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/borderRead.jsp");
		dispatcher.forward(request, response);		
		
	}

}