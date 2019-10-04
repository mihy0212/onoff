package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;

public class MyAskWriteComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//접속
				Connection conn = DAO.connect();
				HttpSession session = request.getSession(false);
				String userNum = (String)session.getAttribute("userNum");
				 System.out.println(userNum);
				 
				 
				 String askTitle = request.getParameter("ask_title");
				 String askContent = request.getParameter("ask_content");
					
					// 빈 객체에 데이터 set
					AskDTO dto = new AskDTO();
					
					dto.setUserNum(userNum);
					dto.setAskTitle(askTitle);
					dto.setAskTitle(askTitle);
					dto.setAskContent(askContent);
					
					
					//DB에 저장
					AskDAO.getInstance().insert(conn, dto);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("myAskWriteForm.dao");
					dispatcher.forward(request, response);

					DAO.disconnect(conn);
					
					
				
	}

}
