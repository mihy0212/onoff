package co.oc.command.menu2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.LikeDAO;
import co.oc.dto.LikeDTO;

public class LikeClickComm implements Command {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		LikeDTO ldto = new LikeDTO();
		ldto.setStoreNum(request.getParameter("storeNum"));
		ldto.setUserNum(request.getParameter("userNum"));
		
		//DAO
		Connection conn = DAO.connect();
		int likeChk = LikeDAO.getInstance().checkInsert(conn, ldto);	
		int likeCount = LikeDAO.getInstance().selectStoreNum(conn, ldto.getStoreNum());
		
		DAO.disconnect(conn);
		
		JSONObject obj = new JSONObject();
		obj.put("likeChk",likeChk);
		obj.put("likeCount",likeCount);
		out.print(obj.toJSONString());
	}

}
