package co.oc.command.menu2;

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
import co.oc.dao.LikeDAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.FavoriteDTO;
import co.oc.dto.LikeDTO;
import co.oc.dto.ReviewDTO;
import co.oc.dto.StoreDTO;

public class StoreInfoComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//앞선 페이지에서 클릭한 가게 번호 읽어오기
		HttpSession session = request.getSession(false);
		String sessionUserNum = session.getAttribute("userNum").toString();
		
		String storeNum = request.getParameter("storeNum");
//		String storeNum = "1";
		
		//DAO
		Connection conn = DAO.connect();
		
		//가게 정보 조회
		StoreDTO sdto = new StoreDTO();
		sdto = StoreDAO.getInstance().selectStoreNum(conn, storeNum);
		request.setAttribute("storeInfo", sdto);
		
		//회원이 가게를 좋아요했는지 조회
		if(sessionUserNum != null) {
			LikeDTO ldto = new LikeDTO();
			ldto.setStoreNum(storeNum);
			ldto.setUserNum(sessionUserNum);
			int likeAct = LikeDAO.getInstance().check(conn, ldto);
			request.setAttribute("likeAct", likeAct);
		}
		
		//회원이 가게를 즐겨찾기했는지 조회
		if(sessionUserNum != null) {
			FavoriteDTO fdto = new FavoriteDTO();
			fdto.setUserNum(sessionUserNum);
			fdto.setStoreNum(storeNum);
			int favoAct = FavoriteDAO.getInstance().check(conn, fdto);
			request.setAttribute("favoAct", favoAct);
		}
		
		
		//리뷰 조회
		List<ReviewDTO> list = ReviewDAO.getInstance().select1(conn, "store_num", storeNum, 1, 10);
		request.setAttribute("storeReview", list);
		
		//가게 별점 평균 조회
		String stars = String.format("%.1f", ReviewDAO.getInstance().selectStar(conn, storeNum));
		request.setAttribute("stars", stars);
		
		DAO.disconnect(conn);
		
		//값 담아 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu2/store_info.jsp");
		dispatcher.forward(request, response);
	}

}
