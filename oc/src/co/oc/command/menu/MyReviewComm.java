package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.ReviewDTO;

public class MyReviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		
		HttpSession session = request.getSession(false);
		String userNum = (String)session.getAttribute("userNum");
		System.out.println(userNum);

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
			cnt = ReviewDAO.getInstance().review_getPageCount(conn);
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

// 리스트를 안넘김.
		List<ReviewDTO> list = ReviewDAO.getInstance().select1(conn,"user_num", userNum, 1, 1); //all
		for(ReviewDTO dto: list) {
			System.out.println(dto.getReviewNum()+"akjdlaskdjf");
		}

		// request 객체에 list를 담아준다.
				request.setAttribute("list", list);
				System.out.println(list);
				
				// request 객체에 총 페이지수를 담아준다.
				request.setAttribute("tot", tot);
				// review.jsp로 이동
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_act.jsp");
		dispatcher.forward(request, response);

	}
}