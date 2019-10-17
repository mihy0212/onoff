package co.oc.command.menu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dto.ReviewDTO;

public class UpdateMyReiviewComm implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 접속
		PrintWriter out = response.getWriter();
		
		Connection conn = DAO.connect();
		ReviewDTO dto = new ReviewDTO();
	
		String storeNum = request.getParameter("storeNum");
		dto.setUserNum(request.getParameter("userNum"));
		dto.setReviewNum(request.getParameter("reviewNum"));
		dto.setReviewStar(request.getParameter("reviewStar"));
		dto.setReviewContent(request.getParameter("reviewContent"));
		
		int n = ReviewDAO.getInstance().update(conn, dto);
		double stars = ReviewDAO.getInstance().selectStar(conn, storeNum);

		JSONObject obj = new JSONObject();
		obj.put("n", n);
		obj.put("stars", stars);
		out.print(obj.toJSONString());
		
		DAO.disconnect(conn);
	}

}
