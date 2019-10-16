package co.oc.command.menu2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.FavoriteDAO;
import co.oc.dao.LikeDAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.FavoriteDTO;
import co.oc.dto.LikeDTO;
import co.oc.dto.ReviewDTO;

public class StoreInfoChangeComm implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		Connection conn = DAO.connect();
		
		String choice = request.getParameter("choice");
		
		if(choice.equals("likeClick")) {
			LikeDTO ldto = new LikeDTO();
			ldto.setStoreNum(request.getParameter("storeNum"));
			ldto.setUserNum(request.getParameter("userNum"));
			int likeChk = LikeDAO.getInstance().checkInsert(conn, ldto);	
			int likeCount = LikeDAO.getInstance().selectStoreNum(conn, ldto.getStoreNum());
			
			JSONObject obj = new JSONObject();
			obj.put("likeChk",likeChk);
			obj.put("likeCount",likeCount);
			out.print(obj.toJSONString());
			
		} else if(choice.equals("favoClick")) {
			FavoriteDTO dto = new FavoriteDTO();
			dto.setStoreNum(request.getParameter("storeNum"));
			dto.setUserNum(request.getParameter("userNum"));
			int favoCount = FavoriteDAO.getInstance().checkInsert(conn, dto);
			out.print(favoCount);
			
		} else if(choice.equals("storeInfoUpdate")) {
			String check = request.getParameter("check");
			String content = request.getParameter("content");
			String storeNum = request.getParameter("storeNum");
			if(check.equals("store_addr")) {
				String check2 = request.getParameter("check2");
				String content2 = request.getParameter("content2");
				int n = StoreDAO.getInstance().update1(conn, check, content, storeNum);
				int a = StoreDAO.getInstance().update1(conn, check2, content2, storeNum);
				
				JSONObject obj = new JSONObject();
				obj.put("n",n);
				obj.put("a",a);
				out.print(obj.toJSONString());
			} else {
				int n = StoreDAO.getInstance().update1(conn, check, content, storeNum);
				out.print(n);				
			}
			
		} else if(choice.equals("reviewInsert")) {
			ReviewDTO dto = new ReviewDTO();
			String storeNum = request.getParameter("storeNum");
			dto.setStoreNum(storeNum);
			dto.setUserNum(request.getParameter("userNum"));
			dto.setReviewStar(request.getParameter("reviewStar"));
			dto.setReviewContent(request.getParameter("reviewContent"));
			int n = ReviewDAO.getInstance().insert(conn, dto);
			//out.print(n);
			if(n != 0) {
				response.sendRedirect("storeInfo.do?storeNum="+storeNum);
			}
			
		} else if(choice.equals("reviewDelete")) {
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
			
		} else if(choice.equals("reviewReply")) {
			ReviewDTO dto = new ReviewDTO();
			dto.setReviewRe(request.getParameter("reviewRe"));
			String storeNum = request.getParameter("storeNum");
			System.out.println(storeNum);
			dto.setStoreNum(storeNum);
			dto.setUserNum(request.getParameter("userNum"));
			dto.setReviewContent(request.getParameter("reviewContent"));
			int n = ReviewDAO.getInstance().insert(conn, dto);
			if(n != 0) {
				response.sendRedirect("storeInfo.do?storeNum="+storeNum);
			} else {
				System.out.println("리뷰 댓글 등록 실패");
			}
		}
		
		DAO.disconnect(conn);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	

}
