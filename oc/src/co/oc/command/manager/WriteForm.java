package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;

public class WriteForm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String storeNum = request.getParameter("key");
		Connection conn = DAO.connect();
		
		String content = Integer.toString(key);
		List<AskDTO> list = AskDAO.getInstance().selectOne(conn, "ask_num", content, 1, 10);
		request.setAttribute("list", list);
		DAO.disconnect(conn);

		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/askform.jsp");
		dispatcher.forward(request, response);
	}

}
