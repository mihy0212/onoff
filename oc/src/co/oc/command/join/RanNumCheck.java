package co.oc.command.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.RandomDAO;
import co.oc.dto.RandomDTO;

public class RanNumCheck implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = DAO.connect();
		
		PrintWriter out = response.getWriter();
		
		String randomKey = request.getParameter("randomKey");
		String userEmail = request.getParameter("userEmail");
		
		RandomDTO dto = new RandomDTO();
		dto.setUserEmail(userEmail);
		dto.setRandomKey(randomKey);
		
		int n = RandomDAO.getInstance().select(conn, dto);
		int a = 0;
		if(n != 0) {
			a = RandomDAO.getInstance().delete(conn, userEmail);
		}
		out.print(a);
		
		DAO.disconnect(conn);

	}

}
