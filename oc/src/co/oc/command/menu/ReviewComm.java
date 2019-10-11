package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.ReviewDTO;

public class ReviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				Connection conn = DAO.connect();
		
		int pagenum = 1; // 페이지 번호
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

		// size 보여줄 페이지당 게시글 개수. 15개당 1page
		int size = 15;

		int tot = 0;
		int cnt = 0;

		try {

			// 총 게시글 개수.
			//cnt = ReviewDAO.getInstance().review_getPageCount(conn);
			//페이지 번호
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// 1page 1 ~ 15 15개
		// 2page 16 ~ 30 15개
		// 3page 31 ~ 45 15개
		
		int end = pagenum * size;
		int start = end - size + 1;
		
		System.out.println(start);
		System.out.println(end);

		// 리뷰게시판 불러오기.
		List<ReviewDTO> list = ReviewDAO.getInstance().selectAll(conn, start, end);

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
		
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
				

		// review.jsp로 이동
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("등록 가게의 전체리뷰");
		dispatcher.forward(request, response);

	}	}

