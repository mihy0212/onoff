package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;
import co.oc.dto.UserDTO;

public class My_info_up_Form implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 // 세션이 가지고있는 로그인한 ID 정보를 가져온다
//		String id = request.getSession().getAttribute("sessionID").toString();

		//접속
		Connection conn = DAO.connect();
        // 수정할 회원정보를 가져온다.
        UserDAO dao = UserDAO.getInstance();
        UserDTO user = dao.selectOne(conn, "userNum");
        
        // ModifyFrom.jsp에 회원정보를 전달하기 위해 request에 MemberBean을 세팅한다.
        request.setAttribute("userInfo", user);
      //접속 해제
      		DAO.disconnect(conn);



	}

}
