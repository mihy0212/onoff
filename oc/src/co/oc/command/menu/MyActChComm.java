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

public class MyActChComm implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Connection conn = DAO.connect();
		
		String choice = request.getParameter("choice");
		
		if(choice.equals("reviewDelete")) {
			String reviewNum = request.getParameter("reviewNum");
			int n = ReviewDAO.getInstance().delete(conn, reviewNum);
			out.print(n);
			
		} else if(choice.equals("reviewUpdate")) {
			ReviewDTO dto = new ReviewDTO();
			String storeNum = request.getParameter("storeNum");
			dto.setReviewNum(request.getParameter("reviewNum"));
			dto.setReviewStar(request.getParameter("reviewStar"));
			dto.setReviewContent(request.getParameter("reviewContent"));
			int n = ReviewDAO.getInstance().update(conn, dto);
			double stars = ReviewDAO.getInstance().selectStar(conn, storeNum);
			
			JSONObject obj = new JSONObject();
			obj.put("n", n);
			obj.put("stars", stars);
			out.print(obj.toJSONString());
			
		}
		DAO.disconnect(conn);

		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			execute(request, response);
		}
		

	}
