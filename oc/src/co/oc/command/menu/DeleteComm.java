package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;

public class DeleteComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String id = request.getSession().getAttribute("sessionID").toString();
	        String pw = request.getParameter("password");
	      //접속
			Connection conn = DAO.connect();
			//접속 해제
			 DAO.disconnect(conn);
	        
	        // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
	        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
	        UserDAO dao = UserDAO.getInstance();
	      //  int check = dao.delete(conn, userNum);
	        
//	        if(check == 1){
	        //    session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
	    
	      ///작은창 회원정보가 삭제되었습니다.
	     
	         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
//	        }else{
	   
	      
	        //    alert("비밀번호가 맞지 않습니다.");
	         
	   
//	        } 
	  




	}

}
