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

public class MyAskRead implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		// �Ķ���Ͱ� ����
		int ask_re = Integer.parseInt(request.getParameter("ask_re"));

		// �ش� ����� ���� �ҷ�����.
	
//		AskDTO dto = AskDAO.getInstance().selectOne(conn, "ask_re", "ask_re", 1, 1);

		RequestDispatcher dispatcher = request.getRequestDispatcher("my_ask.jsp");
		dispatcher.forward(request, response);
		DAO.disconnect(conn);
	}
}
