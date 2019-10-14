package co.oc.command.map;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.FavoriteDAO;
import co.oc.dto.FavoriteDTO;
import net.sf.json.JSONArray;

public class AjaxFavoriteStoreCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		HttpSession session = request.getSession(false);

		String userNum = (String) session.getAttribute("userNum");

		ArrayList<FavoriteDTO> list = FavoriteDAO.getInstance().userFavorite(conn, userNum);

		String map = JSONArray.fromObject(list).toString();

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(map);

		DAO.disconnect(conn);

	}

}
