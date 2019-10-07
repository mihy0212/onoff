package co.oc.command.manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dto.AskDTO;

public class BorderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<AskDTO> list = new ArrayList<AskDTO>();
		AskDAO dao = new AskDAO();
		
		list = dao.selectAll();
		request.setAttribute("list", list); //db에서 넘어온 값을  request객체에 속성으로 삽입
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/borderList.jsp");
		dispatcher.forward(request, response);
	}

}
