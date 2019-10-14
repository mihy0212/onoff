package co.oc.command.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;

public class StoreNickCheck implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		StoreDAO dao = new StoreDAO();

		String store = request.getParameter("storeName");
		Connection conn = DAO.connect();
		boolean chk = dao.isstoreCheck(conn, store);
		DAO.disconnect(conn);
		String path;
		if (chk)
			path = "jsp/join/storeOK.jsp"; // 사용가능 한 아이디
		else
			path = "jsp/join/storeNO.jsp"; // 사용불가능 한 아이디
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}
}
