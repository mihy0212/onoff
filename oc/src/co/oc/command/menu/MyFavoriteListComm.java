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
import co.oc.dao.DAO;
import co.oc.dao.FavoriteDAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.FavoriteDTO;
import co.oc.dto.LikeDTO;

public class MyFavoriteListComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		
		HttpSession session = request.getSession(false);
		String userNum = (String)session.getAttribute("userNum");

		int pagenum = 1;
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

		int size = 5;

		int tot = 0;
		int cnt = 0;

		try {

			cnt = ReviewDAO.getInstance().review_getPageCount(conn);
			tot = cnt / size;
			if (cnt % size != 0) {
				tot++;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int end = pagenum * size;
		int start = end - size + 1;

		FavoriteDTO dto = new FavoriteDTO();
		

		List<FavoriteDTO> list =FavoriteDAO.getInstance().selectUser(conn, dto, start, end);
		
		for( FavoriteDTO sdto: list) {
			System.out.println(sdto.getStoreName());
		}

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
				
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
		
		// review.jsp로 이동
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_act.jsp");
		dispatcher.forward(request, response);

	}
}