package co.oc.command.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;



public class LoginCheckCommand implements Command {
	// 로그인체크 후 로그인 되는 커맨드
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 id, pw 를 받아서 DB에서 확인 해서 인증하는 루틴
		UserDTO dto = new UserDTO();
		UserDAO dao = new UserDAO();
		HttpSession session = request.getSession(false); //세션객체를 사용
		String path = null;

		PrintWriter out = response.getWriter();
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserPw(request.getParameter("userPw"));

		Connection conn = DAO.connect();
	//	request.setCharacterEncoding("UTF-8");
	//	response.setContentType("text/html;charset=UTF-8");
		dto = dao.loginCheck(conn, dto);

		if (dto.getUserGrant() != null) {
			session.setAttribute("userNum", dto.getUserNum());
			session.setAttribute("userEmail", dto.getUserEmail());
			session.setAttribute("userName", dto.getUserName());
			session.setAttribute("userGrant", dto.getUserGrant());
			session.setAttribute("userAddr", dto.getUserAddr());
			session.setAttribute("userInday", dto.getUserInday());
			session.setAttribute("userNick", dto.getUserNick());
			session.setAttribute("userPw", dto.getUserPw());
			session.setAttribute("userXy", dto.getUserXy());
			session.setAttribute("storeNum", dto.getStoreNum());

//			out.print("<script>");
//			out.print("alert(\"로그인 되었습니다..\");");
//			out.print("location.href='index.do'");
//			out.print("</script>");
			path = "index.jsp";
		} else {
			path = "jsp/join/loginFail.jsp";
		}
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	
}
