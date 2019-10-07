package co.oc.command.menu2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.LikeDAO;
import co.oc.dto.LikeDTO;

public class LikeClickComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		String sessionUserNum = session.getAttribute("userNum").toString();
		
		LikeDTO ldto = new LikeDTO();
		ldto.setStoreNum(request.getParameter("storeNum"));
		ldto.setUserNum(sessionUserNum);
		
		//DAO
		Connection conn = DAO.connect();
		int likes = LikeDAO.getInstance().check(conn, ldto);
		if(likes == 0) {
			LikeDAO.getInstance().insert(conn, ldto);
			likes = 1;
		} else if(likes == 1){
			LikeDAO.getInstance().delete(conn, ldto);
			likes = 0;
		}
		DAO.disconnect(conn);
		
		out.print(likes);
		System.out.println(likes);

	}

}
