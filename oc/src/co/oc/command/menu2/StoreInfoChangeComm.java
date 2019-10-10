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
		
		String action = request.getParameter("action");
		
		
		if(action.equals("likeClick")) {
			LikeDTO ldto = new LikeDTO();
			ldto.setStoreNum(request.getParameter("storeNum"));
			ldto.setUserNum(request.getParameter("userNum"));
			int likeChk = LikeDAO.getInstance().checkInsert(conn, ldto);	
			int likeCount = LikeDAO.getInstance().selectStoreNum(conn, ldto.getStoreNum());
			
			JSONObject obj = new JSONObject();
			obj.put("likeChk",likeChk);
			obj.put("likeCount",likeCount);
			out.print(obj.toJSONString());
			
		} else if(action.equals("favoClick")) {
			FavoriteDTO dto = new FavoriteDTO();
			dto.setStoreNum(request.getParameter("storeNum"));
			dto.setUserNum(request.getParameter("userNum"));
			int favoCount = FavoriteDAO.getInstance().checkInsert(conn, dto);
			out.print(favoCount);
			
		} else if(action.equals("storeInfoUpdate")) {
			String check = request.getParameter("check");
			String content = request.getParameter("content");
			String storeNum = request.getParameter("storeNum");
			int n = StoreDAO.getInstance().update1(conn, check, content, storeNum);
			out.print(n);
			
		} else if(action.equals("reviewInsert")) {
			ReviewDTO dto = new ReviewDTO();
			dto.setStoreNum(request.getParameter("storeNum"));
			dto.setUserNum(request.getParameter("userNum"));
			dto.setReviewStar(request.getParameter("reviewStar"));
			dto.setReviewContent(request.getParameter("reviewContent"));
			int n = ReviewDAO.getInstance().insert(conn, dto);
			out.print(n);
			
		} else if(action.equals("reviewDelete")) {
			String reviewNum = request.getParameter("reviewNum");
			int n = ReviewDAO.getInstance().delete(conn, reviewNum);
			out.print(n);
			
		} else if(action.equals("reviewUpdate")) {
			
		}
//		else if(action.equals("reviewReply")) {
//			
//		}
		
		DAO.disconnect(conn);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	

}
