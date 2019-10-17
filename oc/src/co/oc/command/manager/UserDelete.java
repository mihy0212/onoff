package co.oc.command.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.UserDAO;


public class UserDelete implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
//		String userNum = request.getParameter("userNum");
//		System.out.println(userNum);
//		UserDAO.getInstance().delete(conn, userNum);
//				
//
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/userlist.do");
//		dispatcher.forward(request, response);
		
		PrintWriter out = response.getWriter();
		String[] deleteNum = request.getParameterValues("checkArray[]");
		int n = 0;
		if(deleteNum != null) {
			for(int i=0; i<deleteNum.length; i++) {
				String userNum = deleteNum[i];
				n += UserDAO.getInstance().delete(conn, userNum);
			}
			out.print(n);
		} else {
			System.out.println("데이터가 없습니다.");
		}

		DAO.disconnect(conn);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

}


