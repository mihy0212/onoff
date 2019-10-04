package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class MyAskListComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();

		int pagenum = 1; // ������ ��ȣ
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

// size ������ �������� �Խñ� ����. 5���� 1page
		int size = 5;

		int tot = 0;
		int cnt = 0;

		try {

			// �� �Խñ� ����.
			cnt = AskDAO.getInstance().ask_getPageCount(conn);
			// ������ ��ȣ
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

// 1page 1 ~ 5 5��
// 2page 6 ~ 10 5��
// 3page 11 ~ 16 5��

		int end = pagenum * size;
		int start = end - size + 1;

		System.out.println(start);
		System.out.println(end);


		// ����Խ��� �ҷ�����.
		ArrayList<AskDTO> list =AskDAO.getInstance().selectAll(conn, start, end);

		// request ��ü�� list�� ����ش�.
		request.setAttribute("list", list);
		
		// request ��ü�� �� ���������� ����ش�.
		request.setAttribute("tot", tot);
				

		// review.jsp�� �̵�
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask.jsp");
		dispatcher.forward(request, response);

	}

}
