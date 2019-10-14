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

public class IDFindCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		PrintWriter out = response.getWriter();
		String id = request.getParameter("userName");
		System.out.println(id);
		Connection conn = DAO.connect();
		String chk = dao.findid(conn, dto);
		DAO.disconnect(conn);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		if (chk != null) {
			out.print("<script>");
			out.print("alert(\"존재하지 않은 사용자 정보입니다\");");
			out.print("location.href='loginform.do'");
			out.print("</script>");

		} else {
			out.print("<script>");
			out.print("alert(\"찾으시는 아이디는 "+chk+"입니다.\");");
			out.print("location.href='loginform.do'");
			out.print("</script>");
		
			
		}

	}
}
