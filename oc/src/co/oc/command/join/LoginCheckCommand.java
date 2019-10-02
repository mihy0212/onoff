package co.oc.command.join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;



public class LoginCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 id, pw 를 받아서 DB에서 확인 해서 인증하는 루틴
		UserDTO dto = new UserDTO();
		UserDAO dao = new UserDAO();
		HttpSession session = request.getSession(false); //세션객체를 사용

		String path = null;
		
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserPw(request.getParameter("userPW"));

		dto = dao.loginCheck(dto);
		if (dto.getUserGrant() != null) {
			session.setAttribute("userID", dto.getUserEmail());
			session.setAttribute("usetName", dto.getUserName());
			session.setAttribute("usetGrant", dto.getUserGrant());
			path = "jsp/loginOk.jsp";
		} else {
			path = "jsp/loginFail.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

}
