package co.oc.command.map;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;

public class StoreStateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		String userNum = request.getParameter("user");
		int storeState = StoreDAO.getInstance().storeState(conn, userNum);

		String oc = Integer.toString(storeState);

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(oc);
		
		DAO.disconnect(conn);
	}

}
