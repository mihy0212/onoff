package co.oc.command.menu;

import java.io.IOException;
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

public class MyinfoComm implements Command {
//완료
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//접속
		Connection conn = DAO.connect();
		HttpSession session = request.getSession(false);
		String userNum = (String)session.getAttribute("userNum");
	    System.out.println(userNum);
		UserDTO dto = UserDAO.getInstance().selectOne(conn, userNum);
		
		
		 
        // ModifyFrom.jsp에 회원정보를 전달하기 위해 request에 UserDTO을 세팅한다.
        request.setAttribute("userDto", dto);
        //접속 해제
      	DAO.disconnect(conn);
      	RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/my_info.jsp");
    	dispatcher.forward(request, response);


	}
	 
  
}
