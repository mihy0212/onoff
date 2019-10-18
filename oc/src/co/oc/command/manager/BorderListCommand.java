package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.oc.command.Command;
import co.oc.dao.AskDAO;
import co.oc.dao.DAO;
import co.oc.dto.AskDTO;
import co.oc.dto.Paging;

public class BorderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AskDTO> list ;
		Connection conn = DAO.connect();
		
		String p = request.getParameter("p"); //페이지 번호(pageNo)
		
		int pageNo = 1;
		if(p != null && !p.isEmpty()) {
			pageNo = Integer.parseInt(p);
		}
		
		Paging paging = new Paging();
		paging.setPageUnit(10); //한 페이지에 출력할 레코드 건수
		paging.setPageSize(10); //페이지바에 나타날 페이지 번호 수(이전 1 2 3 ...10 다음)
		paging.setPage(pageNo);	//현재 페이지
		paging.setTotalRecord(AskDAO.getInstance().ask_getPageCount(conn)); //총 레코드 건수
		request.setAttribute("paging", paging);
		
		int first = paging.getFirst();
		int last = paging.getLast();
		list = AskDAO.getInstance().selectAll(conn, first, last);
		request.setAttribute("list", list);
		
		DAO.disconnect(conn);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/manager/test2.jsp");
		dispatcher.forward(request, response);
	}

}
