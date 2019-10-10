package co.oc.command.manager;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dto.AddDTO;

public class AdminStoreInfoComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String userGrant = session.getAttribute("userGrant").toString();
		System.out.println(userGrant);
		
		if( userGrant.equals("S") ) {
			Connection conn = DAO.connect();
			List<AddDTO> addlist = AddDAO.getInstance().selectAll(conn);
			
			request.setAttribute("addlist", addlist);
			DAO.disconnect(conn);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/admin_store.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("접근 에러 페이지 만들기");
		}
		

	}

}
