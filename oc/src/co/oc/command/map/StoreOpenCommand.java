package co.oc.command.map;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dao.TimeDAO;

public class StoreOpenCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		
		String userNum = request.getParameter("userNum");
		
		StoreDAO.getInstance().storeOpen(conn, userNum);
		TimeDAO.getInstance().storeOpenLog(conn, userNum);
		
		DAO.disconnect(conn);
		
		// 홈으로 돌아가게 하기(홈 .do 알아내기)
		RequestDispatcher dispatcher=request.getRequestDispatcher("");
		dispatcher.forward(request, response);
	}

}
