package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dto.AddDTO;

public class AddReadComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addNum = (String) request.getParameter("addNum");
		Connection conn = DAO.connect();
		
		AddDTO adto = AddDAO.getInstance().selectAddNum(conn, addNum);
		request.setAttribute("adto", adto);
		request.getSession().setAttribute("adto", adto);
		
		DAO.disconnect(conn);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/admin_regist.jsp");
		dispatcher.forward(request, response);

	}

}
