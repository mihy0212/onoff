package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;
import co.oc.dao.UserDAO;
import co.oc.dto.Paging;
import co.oc.dto.ReviewDTO;
import co.oc.dto.UserDTO;


public class UserList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserDTO> list ;
		UserDAO dao = new UserDAO();
		Connection conn = DAO.connect();
		
		
			
		list = dao.selectAll(conn);
		request.setAttribute("userlist", list); //db에서 넘어온 값을  request객체에 속성으로 삽입
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/userlist.jsp");
		dispatcher.forward(request, response);
	}

}
