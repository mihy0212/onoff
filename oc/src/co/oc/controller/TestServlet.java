package co.oc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.LikeDAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.StoreDAO;
import co.oc.dao.UserDAO;
import co.oc.dto.AddDTO;
import co.oc.dto.LikeDTO;
import co.oc.dto.ReviewDTO;
import co.oc.dto.StoreDTO;
import co.oc.dto.UserDTO;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//접속
		Connection conn = DAO.connect();
		
		//회원 전체 조회TEST
//		List<UserDTO> list = UserDAO.getInstance().selectAll(conn);
//		for(UserDTO dto : list) {
//			System.out.println(dto.getUserEmail());
//		}
		
		//회원 한 명 조회 test
//		String userNum = "2";
//		UserDTO dto = UserDAO.getInstance().selectOne(conn, userNum);
//		System.out.println(dto.getUserEmail());
		
		//회원 입력 TEST
//		UserDTO udto = new UserDTO();
//		udto.setUserEmail("store3@gmail.com");
//		udto.setUserPw("1234");
//		udto.setUserName("사업자회원3");
//		udto.setUserNick("사업자회원3");
//		udto.setUserGrant("C");
//		udto.setStoreNum("3");
//		UserDAO.getInstance().insert(conn, udto);

		
		//회원 수정 TEST
//		UserDTO dto = new UserDTO();
//		dto.setUserNum("2");
//		dto.setUserPw("1234");
//		dto.setUserName("회원11");
//		dto.setUserNick("회원11");
//		dto.setUserGrant("U");
//		UserDAO.getInstance().update(conn, dto);
		
		//회원 삭제 TEST
//		String userNum = "3";
//		UserDAO.getInstance().delete(conn, userNum);
		
		////////////////////////////////////////////////////////////////
		
		//가게 전체 조회TEST
//		List<StoreDTO> list = StoreDAO.getInstance().selectAll(conn);
//		for(StoreDTO dto : list) {
//			System.out.println(dto.getStoreNum());
//			System.out.println(dto.getStoreName());
//		}
//		
		//가게 하나 조회1 test
//		String storeNum = "2";
//		StoreDTO dto = StoreDAO.getInstance().selectOne(conn, storeNum);
//		System.out.println(dto.getStoreName());
		
		//가게 하나 조회2 test
//		String userNum = "2";
//		StoreDTO dto = StoreDAO.getInstance().selectOne(conn, userNum);
//		System.out.println(dto.getStoreName());
		
		//가게 입력 TEST
//		StoreDTO sdto = new StoreDTO();
//		sdto.setStoreName("가게3");
//		sdto.setStoreAddr("대구광역시 중구 삼덕동 315-4");
//		sdto.setStoreXy("35.863758, 128.607560");
//		sdto.setStoreCateg1("1");
//		sdto.setStoreCateg2("2");
//		sdto.setStoreCateg3("1");
//		sdto.setStoreTime("10:00 ~ 17:00, 연중무휴");
//		sdto.setStoreTel("053-111-1111");
//		sdto.setStoreMenu("볶음밥 2000원");
//		sdto.setStoreEct("많이들 오세요~!");
//		sdto.setUserNum("6");
//		StoreDAO.getInstance().insert(conn, sdto);
		
		//가게 삭제 TEST
//		String storeNum = "2";
//		StoreDAO.getInstance().delete(conn, storeNum);
		
		////////////////////////////////////////////////////////////////
		
		//신청 전체 조회 TEST
//		List<AddDTO> list = AddDAO.getInstance().selectAll(conn);
//		for(AddDTO dto : list) {
//			System.out.println(dto.getStoreName());
//		}
		
		//신청 일부조회1
//		List<AddDTO> list2 = AddDAO.getInstance().selectStoreNum(conn, "1");
//		for(AddDTO dto : list2) {
//			System.out.println(dto.getStoreName());
//		}
		
		//신청 일부조회2
//		List<AddDTO> list3 = AddDAO.getInstance().selectUserNum(conn, "7");
//		for(AddDTO dto : list3) {
//			System.out.println(dto.getStoreName());
//		}
		
		//신청 등록하기
//		AddDTO dto = new AddDTO();
//		dto.setStoreName("신청4");
//		dto.setStoreAddr("대구광역시 중구 삼덕동 315-4");
//		dto.setStoreXy("35.863758, 128.607560");
//		dto.setStoreCateg1("1");
//		dto.setStoreCateg2("2");
//		dto.setStoreCateg3("2");
//		dto.setStoreLicense("1111111114");
//		dto.setAddCapture("캡처4.jpg");
//		dto.setUserNum("7");
//		AddDAO.getInstance().insert(conn, dto);
		
		//신청 수정하기1
//		AddDTO dto = new AddDTO();
//		dto.setStoreName("신청11");
//		dto.setStoreAddr("대구 중구 상서동 22-2 호당빌딩 1층");
//		dto.setStoreXy("35.234223, 222.235110");
//		dto.setStoreCateg1("1");
//		dto.setStoreCateg2("1");
//		dto.setStoreCateg3("1");
//		dto.setStoreLicense("1111111110");
//		dto.setAddCapture("캡처.jpg");
//		dto.setAddNum("1");
//		AddDAO.getInstance().update(conn, dto);
		
		//신청 수정하기2
//		AddDTO dto = new AddDTO();
//		dto.setAddStatus("2");
//		dto.setAddRe("");
//		dto.setStoreNum("3");
//		dto.setAddNum("5");
//		AddDAO.getInstance().updatePermit(conn, dto);
		
		//신청 삭제하기
//		String addNum = "4";
//		AddDAO.getInstance().delete(conn, addNum);
		
		////////////////////////////////////////////////////////////////
		
		//좋아요 등록
//		LikeDTO dto = new LikeDTO();
//		dto.setUserNum("4");
//		dto.setStoreNum("2");
//		LikeDAO.getInstance().insert(conn, dto);
		
		//좋아요 전체 현황 조회
//		List<LikeDTO> list1 = LikeDAO.getInstance().selectAll(conn);
//		for(LikeDTO dto : list1) {
//			System.out.println(dto.getStoreNum()+"번 가게를 "+dto.getUserNum()+"번 회원이 좋아함");
//			System.out.println();
//		}
		
		//좋아요 일부 조회1
//		List<LikeDTO> list2 = LikeDAO.getInstance().selectUserNum(conn, "2");
//		for(LikeDTO dto : list2) {
//			System.out.println(dto.getStoreNum()+"번 가게를 "+dto.getUserNum()+"번 회원이 좋아함");
//			System.out.println();
//		}
		
		//좋아요 일부 조회2
//		int likes = LikeDAO.getInstance().selectStoreNum(conn, "2");
//		System.out.println(likes);
		
		//좋아요 삭제
//		LikeDTO dto = new LikeDTO();
//		dto.setUserNum("4");
//		dto.setStoreNum("2");
//		LikeDAO.getInstance().delete(conn, dto);
		
		
		////////////////////////////////////////////////////////////////
		
		//리뷰 등록
//		ReviewDTO dto = new ReviewDTO();
//		dto.setReviewRe("9");
//		dto.setUserNum("7");
//		dto.setUserNick("사업자회원3");
//		dto.setStoreNum("3");
//		dto.setStoreName("가게3");
//		dto.setReviewStar("5");
//		dto.setReviewContent("감사합니다.");
//		ReviewDAO.getInstance().insert(conn, dto);
		
		//리뷰 전체 조회
//		List<ReviewDTO> list = ReviewDAO.getInstance().selectAll(conn);
//		for(ReviewDTO dto : list) {
//			System.out.println(dto.getUserNick() +"님이 "+dto.getStoreName()+"에 "+dto.getReviewStar()+"점을 주셨습니다.");
//		}
		
		//리뷰 일부조회1
//		List<ReviewDTO> list = ReviewDAO.getInstance().select1(conn, "reviewStar", "4");
//		for(ReviewDTO dto : list) {
//			System.out.println(dto.getUserNick() +"님이 "+dto.getStoreName()+"에 "+dto.getReviewStar()+"점을 주셨습니다.");
//		}
		
		//리뷰 일부 조회2
//		ReviewDTO dto = new ReviewDTO();
//		dto.setUserNum("3");
//		dto.setReviewStar("5");
//		List<ReviewDTO> list = ReviewDAO.getInstance().selectUserStar(conn, dto);
//		for(ReviewDTO dto1 : list) {
//			System.out.println(dto1.getUserNick() +"님이 "+dto1.getStoreName()+"에 "+dto1.getReviewStar()+"점을 주셨습니다.");
//		}
		
		//리뷰 일부 조회3
//		ReviewDTO dto = new ReviewDTO();
//		dto.setStoreNum("2");
//		dto.setReviewStar("5");
//		List<ReviewDTO> list = ReviewDAO.getInstance().selectStoreStar(conn, dto);
//		for(ReviewDTO dto1 : list) {
//			System.out.println(dto1.getUserNick() +"님이 "+dto1.getStoreName()+"에 "+dto1.getReviewStar()+"점을 주셨습니다.");
//		}
		
		//리뷰 일부조회4
		Double n = ReviewDAO.getInstance().selectStar(conn, "3");
		System.out.println(n+"점");
		
		//리뷰 수정
//		ReviewDTO dto = new ReviewDTO();
//		dto.setReviewNum("6");
//		dto.setReviewStar("3");
//		dto.setReviewContent("쏘쏘");
//		ReviewDAO.getInstance().update(conn, dto);
		
		//리뷰 삭제
//		ReviewDAO.getInstance().delete(conn, "11");
		
		
		
		//접속 해제
		DAO.disconnect(conn);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
