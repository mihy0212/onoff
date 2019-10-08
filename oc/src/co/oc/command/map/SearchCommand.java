package co.oc.command.map;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.StoreDTO;

public class SearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DAO.connect();
		ArrayList<StoreDTO> list = new ArrayList<StoreDTO>();
		String keyword = request.getParameter("keyword");
		list = StoreDAO.getInstance().searchStore(conn, keyword);

		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);

		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/map/search.jsp");
		dispatcher.forward(request, response);
	}

}
