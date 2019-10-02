package co.oc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dao.UserDAO;
import co.oc.dto.AddDTO;
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
		
		//가게 전체 조회TEST
		List<StoreDTO> list = StoreDAO.getInstance().selectAll(conn);
		for(StoreDTO dto : list) {
			System.out.println(dto.getStoreName());
		}
		
		//회원 한 명 조회 test
//		String userNum = "2";
//		UserDTO dto = UserDAO.getInstance().selectOne(conn, userNum);
//		System.out.println(dto.getUserEmail());
		
		//회원 입력 TEST
//		UserDTO udto = new UserDTO();
//		udto.setUserEmail("test9@gmail.com");
//		udto.setUserPw("1234");
//		udto.setUserName("회원9");
//		udto.setUserNick("회원9");
//		udto.setUserGrant("C");
//		udto.setStoreNum("4");
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
//		sdto.setStoreAddr("제주시 영평동 첨단로 242");
//		sdto.setStoreXy("32.550701, 125.550667");
//		sdto.setStoreCateg1("1");
//		sdto.setStoreCateg2("1");
//		sdto.setStoreCateg3("1");
//		sdto.setStoreTime("10:00 ~ 17:00, 연중무휴");
//		sdto.setStoreTel("053-111-1111");
//		sdto.setStoreMenu("볶음밥 4000원");
//		sdto.setStoreEct("우리 가게 성공 기원");
//		sdto.setUserNum("9");
//		StoreDAO.getInstance().insert(conn, sdto);
		
		//가게 삭제 TEST
//		String storeNum = "2";
//		StoreDAO.getInstance().delete(conn, storeNum);
		
		////////////////////////////////////////////////////////////////
		
		//사업자 전체 조회 TEST
		List<AddDTO>
		
		
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
