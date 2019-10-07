package co.oc.command.menu2;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.ReviewDTO;
import co.oc.dto.StoreDTO;

public class StoreInfoComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//앞선 페이지에서 클릭한 가게 번호 읽어오기
//		String storeNum = request.getParameter("storeNum");
		String storeNum = "2";
		
		//DAO
		Connection conn = DAO.connect();
		
		//가게 정보 조회
		StoreDTO sdto = new StoreDTO();
		sdto = StoreDAO.getInstance().selectStoreNum(conn, storeNum);
		request.setAttribute("storeInfo", sdto);
		
		//리뷰 조회
		List<ReviewDTO> list = ReviewDAO.getInstance().select1(conn, "store_num", storeNum, 1, 10);
		request.setAttribute("storeReview", list);
		
		DAO.disconnect(conn);
		
		//값 담아 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu2/store_info.jsp");
		dispatcher.forward(request, response);
	}

}