package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class MyAskUpFormComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 //접속
		 Connection conn = DAO.connect();
		 // 세션이 가지고있는 로그인한 ID 정보를 가져온다
		 HttpSession session = request.getSession(false);
		 String askNum = (String)session.getAttribute("askNum");
		 //String path = null;
		 List<AskDTO> list = AskDAO.getInstance().selectOne(conn, "ask_re", askNum, 1, 1);
		 
		// request 객체에 list를 담아준다.
					request.setAttribute("list", list);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask_Update.jsp");
		 dispatcher.forward(request, response);
		
	
		//접속 해제
			DAO.disconnect(conn);
	}

}
