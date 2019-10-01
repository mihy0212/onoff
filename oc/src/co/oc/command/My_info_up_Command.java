package co.oc.command;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;

public class My_info_up_Command implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = null;
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
//		String id = request.getSession().getAttribute("sessionID").toString();

		UserDAO dao = UserDAO.getInstance();

		// 수정할 정보를 자바빈에 세팅한다.
		UserDTO dto = new UserDTO();
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String userEmail = mail1 + "@" + mail2;
		dto.setUserEmail("userEmail");
		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserNick(request.getParameter("userNick"));
		dto.setUserAddr(request.getParameter("userAddr"));

		//접속
		Connection conn = DAO.connect();
		int n = dao.update(conn, dto);     
		//접속 해제
		 DAO.disconnect(conn);

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

}
