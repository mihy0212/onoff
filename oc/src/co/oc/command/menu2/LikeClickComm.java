package co.oc.command.menu2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.LikeDAO;
import co.oc.dto.LikeDTO;

public class LikeClickComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		LikeDTO ldto = new LikeDTO();
		ldto.setStoreNum(request.getParameter("storeNum"));
		ldto.setUserNum(request.getParameter("userNum"));
		
		//DAO
		int likeCount = 0;
		Connection conn = DAO.connect();
		likeCount = LikeDAO.getInstance().checkInsert(conn, ldto);			
		DAO.disconnect(conn);
		out.print(likeCount);

	}

}
