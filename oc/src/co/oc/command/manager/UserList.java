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
		 Connection conn = DAO.connect();
		
		 int pagenum = 1; 
	     if (request.getParameter("Page_num") != null) {
	         pagenum = Integer.parseInt(request.getParameter("Page_num"));
	      }
	     
	      int size = 10;
	      int tot = 0;
	      int cnt = 0;

	      try {
	         cnt = UserDAO.getInstance().user_getPageCount(conn);
	         System.out.println(cnt+"cnt");
	         tot = cnt / size;
	         if (cnt % size != 0) {
	            tot++;
	         }

	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      int end = pagenum * size;
	      int start = end - size + 1;
		
	      List<UserDTO> list ;
		  UserDAO dao = new UserDAO();
		  list = dao.selectAll(conn, start, end);
		  System.out.println("list" + list);
	      
	      request.setAttribute("userlist", list); //db에서 넘어온 값을  request객체에 속성으로 삽입
	      request.setAttribute("tot", tot);
	
	      DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/userlist.jsp");
		dispatcher.forward(request, response);
	}

}
