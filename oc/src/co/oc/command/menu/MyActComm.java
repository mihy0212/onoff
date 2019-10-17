package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

public class MyActComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		
		HttpSession session = request.getSession(false);
		String userNum = (String)session.getAttribute("userNum");
		String storeNum = request.getParameter("storeNum");
		String storeCateg1 = request.getParameter("storeCateg1");
		String storeCateg2 = request.getParameter("storeCateg2");
		String storeCateg3 = request.getParameter("storeCateg3");
		
//----------------------------------------페이징 처리--------------------------------------
		
		int pagenum = 1;
		if (request.getParameter("Page_num") != null) {
			pagenum = Integer.parseInt(request.getParameter("Page_num"));
		}

		int size = 5;

		int tot = 0;
		int cnt = 0;

		try {

			cnt = FavoriteDAO.getInstance().favorite_getPageCountuserNum(conn,userNum);
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
//----------------------------------------페이징 처리끝--------------------------------------
		
//----------------------------------------Favorite--------------------------------------		
		FavoriteDTO dto = new FavoriteDTO();
		dto.setUserNum(userNum);
		dto.setStoreNum(storeNum);
		dto.setStoreCateg1(storeCateg1);
		dto.setStoreCateg2(storeCateg2);
		dto.setStoreCateg3(storeCateg3);
		
		List<FavoriteDTO> list =FavoriteDAO.getInstance().selectUser(conn, dto, start, end);
		for( FavoriteDTO sdto: list) {
			System.out.println("즐겨찾기"+sdto.getStoreName());
		}

		// request 객체에 list를 담아준다.
		request.setAttribute("list", list);
				
		// request 객체에 총 페이지수를 담아준다.
		request.setAttribute("tot", tot);
		
//----------------------------------------Favorite--------------------------------------	
		
//----------------------------------------Review--------------------------------------		
		
		
		/*
		 * String choice = request.getParameter("choice"); ReviewDTO dto2 = new
		 * ReviewDTO(); if(choice != null) { if(choice.equals("reviewDelete")){ String
		 * reviewNum = request.getParameter("reviewNum"); System.out.println(reviewNum);
		 * ReviewDAO.getInstance().delete(conn, reviewNum); }else
		 * if(choice.equals("reviewUpdate")){
		 * dto2.setUserNum(request.getParameter("userNum"));
		 * dto2.setReviewNum(request.getParameter("reviewNum"));
		 * dto2.setReviewStar(request.getParameter("reviewStar"));
		 * dto2.setReviewContent(request.getParameter("reviewContent"));
		 * ReviewDAO.getInstance().selectStar(conn, storeNum);
		 * ReviewDAO.getInstance().update(conn, dto2);
		 * 
		 * 
		 * } }
		 */
		 
		
			List<ReviewDTO> list1 = ReviewDAO.getInstance().select1(conn, "user_num", userNum, start, end); // all
			
			for (ReviewDTO adto : list1) {
				System.out.println(adto.getStoreName());
			}
			// request 객체에 list를 담아준다.
			 request.setAttribute("riviewlist", list1);
			 //System.out.println(list1);

			 // request 객체에 총 페이지수를 담아준다.
			 request.setAttribute("tot", tot);
		
			// review.jsp로 이동
			DAO.disconnect(conn);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_act.jsp");
			dispatcher.forward(request, response);
//----------------------------------------Review--------------------------------------	
	
}
}