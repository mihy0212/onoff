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

public class My_info_Comm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// 세션에서 아이디를 가져와 MemberDTO에 세팅한다.(DTO=DAO)
		String id = request.getSession().getAttribute("sessionID").toString();
//		 UserDTO.set

		//접속
		Connection conn = DAO.connect();
        // 수정할 회원정보를 가져온다.
        UserDAO dao = UserDAO.getInstance();
        UserDTO user = dao.selectOne(conn, "userNum");
        
        // ModifyFrom.jsp에 회원정보를 전달하기 위해 request에 UserDTO을 세팅한다.
        request.setAttribute("userInfo", user);
      //접속 해제
      		DAO.disconnect(conn);



	}
	 
 
  
      // 수정할 회원정보를 담고있는 MemberDTO을 DAO로 전달하여 회원정보 수정을 한다.
      dao.updateMember(MemberDTO);


}
