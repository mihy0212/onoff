package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class MyAskListComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();

		HttpSession session = request.getSession(false);
		String userNum = (String) session.getAttribute("userNum");
		System.out.println(userNum);
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

		System.out.println("st" + start);
		System.out.println("en" + end);

		// 리뷰게시판 불러오기.
		List<AskDTO> list = AskDAO.getInstance().selectOne(conn, "user_num", userNum, start, end);
		for (AskDTO dto : list) {
			System.out.println(dto.getAskNum());
		}

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);

		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
		

		// ask.jsp로 이동
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask.jsp");
		dispatcher.forward(request, response);

	}

}
