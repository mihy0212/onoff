package co.oc.cotroller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
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
//		Connection conn = DAO.connect();
		
		//회원 전체 조회TEST
//		List<UserDTO> list = UserDAO.getInstance().selectAll(conn);
//		for(UserDTO dto : list) {
//			System.out.println(dto.getUserEmail());
//		}
		
		//회원 입력 TEST
//		UserDTO dto = new UserDTO();
//		dto.setUserEmail("test3@gmail.com");
//		dto.setUserPw("1234");
//		dto.setUserName("회원3");
//		dto.setUserNick("회원3");
//		dto.setUserGrant("U");
//		UserDAO.getInstance().insert(conn, dto);

		
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
		
		
		//접속 해제
//		DAO.disconnect(conn);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
