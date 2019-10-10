package co.oc.command.menu;

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
public class MyAskRead implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
	
	String askNum = request.getParameter("key");
	
	System.out.println(askNum);
	List<AskDTO> list = AskDAO.getInstance().selectOne(conn, "ask_re", askNum, 1, 1);
		
	// request 객체에 list를 담아준다.
			request.setAttribute("list", list);

	// request 객체에 총 페이지수를 담아준다.
	RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask_Read.jsp");
	dispatcher.forward(request, response);
	DAO.disconnect(conn);
	}
}
