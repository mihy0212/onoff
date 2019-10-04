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

		int pagenum = 1; // 페이지 번호
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

// size 보여줄 페이지당 게시글 개수. 5개당 1page
		int size = 5;

		int tot = 0;
		int cnt = 0;

		try {

			// 총 게시글 개수.
			cnt = AskDAO.getInstance().ask_getPageCount(conn);
			// 페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

// 1page 1 ~ 5 5개
// 2page 6 ~ 10 5개
// 3page 11 ~ 16 5개

		int end = pagenum * size;
		int start = end - size + 1;

		System.out.println(start);
		System.out.println(end);


		// 리뷰게시판 불러오기.
		ArrayList<AskDTO> list =AskDAO.getInstance().selectAll(conn, start, end);

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
				

		// review.jsp로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask.jsp");
		dispatcher.forward(request, response);

	}

}
