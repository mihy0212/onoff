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
import co.oc.dto.Paging;
import co.oc.dto.ReviewDTO;

public class StoreReviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//앞선 페이지에서 클릭한 가게 번호 읽어오기
		String storeNum = request.getParameter("storeNum");
//		System.out.println(storeNum);
		
		//DAO
		Connection conn = DAO.connect();
		
		//리뷰 페이징 처리해서 리뷰 조회하기
		String p = request.getParameter("p"); //페이지 번호(pageNo)
		
		int pageNo = 1;
		if(p != null && !p.isEmpty()) {
			pageNo = Integer.parseInt(p);
		}
		
		Paging paging = new Paging();
		paging.setPageUnit(5); //한 페이지에 출력할 레코드 건수
		paging.setPageSize(10); //페이지바에 나타날 페이지 번호 수(이전 1 2 3 ...10 다음)
		paging.setPage(pageNo);	//현재 페이지
		paging.setTotalRecord(ReviewDAO.getInstance().review_getPageCount(conn, "store_num", storeNum)); //총 레코드 건수
		request.setAttribute("paging", paging);
		System.out.println(paging.getTotalRecord());
		
		int first = paging.getFirst();
		int last = paging.getLast(); 
		List<ReviewDTO> list = ReviewDAO.getInstance().select1(conn, "store_num", storeNum, first, last);
		request.setAttribute("storeReview", list);
		
		
		//가게 별점 평균 조회
		String stars = String.format("%.1f", ReviewDAO.getInstance().selectStar(conn, storeNum));
		request.setAttribute("stars", stars);
		
		DAO.disconnect(conn);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu2/store_review.jsp");
		dispatcher.forward(request, response);

	}

}
