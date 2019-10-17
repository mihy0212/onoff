package co.oc.command.menu;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.ReviewDAO;

public class DeldectMyReiviewComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		Connection conn = DAO.connect();

		String reviewNum = request.getParameter("reviewNum");
		int n = ReviewDAO.getInstance().delete(conn, reviewNum);
		out.print(n);

		DAO.disconnect(conn);
	}

}
