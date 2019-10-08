package co.oc.command.menu2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.ReviewDTO;

public class ReviewInsertComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		ReviewDTO dto = new ReviewDTO();
		dto.setStoreNum(request.getParameter("storeNum"));
		dto.setUserNum(request.getParameter("userNum"));
		dto.setReviewStar(request.getParameter("reviewStar"));
		dto.setReviewContent(request.getParameter("reviewContent"));
		
		Connection conn = DAO.connect();
		int n = ReviewDAO.getInstance().insert(conn, dto);
		DAO.disconnect(conn);
		
		out.print(n);
		out.flush();

	}

}
