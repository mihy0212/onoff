package co.oc.command.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;


public class BorderDelete implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
//		String askNum = request.getParameter("askNum");
//		System.out.println(askNum);
//		AskDAO.getInstance().delete(conn, askNum);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/list.do");
//		dispatcher.forward(request, response);
		
		PrintWriter out = response.getWriter();
		String[] deleteNum = request.getParameterValues("checkArray[]");
		int n = 0;
		if(deleteNum != null) {
			for(int i=0; i<deleteNum.length; i++) {
				String askNum = deleteNum[i];
				n += AskDAO.getInstance().delete(conn, askNum);
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


