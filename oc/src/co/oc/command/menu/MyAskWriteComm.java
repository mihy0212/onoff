package co.oc.command.menu;

import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
				 //System.out.println(userNum);
				 
				String date_s = request.getParameter("askDate"); 
				SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd"); 
				Date date = null;
				try {
					date = dt.parse(date_s);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
				 
					
					// 빈 객체에 데이터 set
					AskDTO dto = new AskDTO();
					
					dto.setUserNum(userNum);
					dto.setAskTitle(request.getParameter("askTitle"));
					dto.setAskContent(request.getParameter("askContent"));
					dto.setAskDate(date);
					
					
					//DB에 저장
					AskDAO.getInstance().insert(conn, dto);
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/menu/my_ask.jsp");
					dispatcher.forward(request, response);

					DAO.disconnect(conn);
					
					
				
	}

}
