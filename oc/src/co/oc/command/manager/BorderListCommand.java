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

public class BorderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AskDTO> list ;
		AskDAO dao = new AskDAO();
		Connection conn = DAO.connect();
		list = dao.selectAll(conn, 1, 100);
		request.setAttribute("list", list); //db에서 넘어온 값을  request객체에 속성으로 삽입
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/test2.jsp");
		dispatcher.forward(request, response);
	}

}
