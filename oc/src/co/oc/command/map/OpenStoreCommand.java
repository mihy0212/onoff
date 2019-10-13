package co.oc.command.map;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.StoreDTO;
import net.sf.json.JSONArray;

public class OpenStoreCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		List<StoreDTO> list = StoreDAO.getInstance().selectOpenStore(conn);

		String map = JSONArray.fromObject(list).toString();

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(map);

		DAO.disconnect(conn);
	}

}
