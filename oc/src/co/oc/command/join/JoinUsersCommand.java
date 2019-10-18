package co.oc.command.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;

public class JoinUsersCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDTO dto = new UserDTO();
		UserDAO dao = new UserDAO();
		PrintWriter out = response.getWriter();
		System.out.println("aaa");
		String path = null;
		dto.setUserEmail(request.getParameter("userEmail"));
		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserNick(request.getParameter("userNickname"));
		dto.setUserAddr(request.getParameter("userAddr"));
		dto.setUserXy(request.getParameter("xy"));
		System.out.println(dto.getUserXy());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Connection conn = DAO.connect();
		int n = dao.insert(conn, dto);
		DAO.disconnect(conn);
		if (n != 0) {
			out.print("<script>");
			out.print("alert(\"회원가입 되었습니다.\");");
			out.print("location.href='loginform.do'");
			out.print("</script>");
		
			{

			}
		} else {

			{
				path = "jsp/join/joinFail.jsp";

				// 인서트 하는 구문 삽입
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}

		}
	}
}