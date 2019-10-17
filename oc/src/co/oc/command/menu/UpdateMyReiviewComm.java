package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.ReviewDTO;

public class UpdateMyReiviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 접속
		Connection conn = DAO.connect();
		ReviewDTO dto = new ReviewDTO();
	
		String storeNum = request.getParameter("storeNum");
		dto.setUserNum(request.getParameter("userNum"));
		dto.setReviewNum(request.getParameter("reviewNum"));
		dto.setReviewStar(request.getParameter("reviewStar"));
		dto.setReviewContent(request.getParameter("reviewContent"));
		
		ReviewDAO.getInstance().selectStar(conn, storeNum);
		ReviewDAO.getInstance().update(conn, dto);
		// 접속 해제
		
		response.sendRedirect("myReview.do");
		DAO.disconnect(conn);
		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("myfavorite.do");
		 * dispatcher.forward(request, response);
		 */
	}

}
