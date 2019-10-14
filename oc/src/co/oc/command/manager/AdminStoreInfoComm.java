package co.oc.command.manager;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.oc.command.Command;
import co.oc.dao.AddDAO;
import co.oc.dao.DAO;
import co.oc.dao.StoreDAO;
import co.oc.dto.AddDTO;
import co.oc.dto.Paging;
import co.oc.dto.StoreDTO;

public class AdminStoreInfoComm implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String userGrant = (String) session.getAttribute("userGrant");
		
		if( userGrant.equals("S") ) {
			Connection conn = DAO.connect();
			
			String p = request.getParameter("p"); //페이지 번호(pageNo)
			String aculumn = request.getParameter("aculumn");
			String acontent = request.getParameter("acontent");
			String bculumn = request.getParameter("bculumn");
			String bcontent = request.getParameter("bcontent");

			int pageNo = 1;
			if(p != null && !p.isEmpty()) {
				pageNo = Integer.parseInt(p);
			}
			if( aculumn == null || aculumn.isEmpty() ) {
				aculumn = "add_status";
				acontent = "%";
			}
			if( bculumn == null || bculumn.isEmpty()) {
				bculumn = "store_oc";
				bcontent = "%";
			}

			Paging apaging = new Paging();
			apaging.setPageUnit(2); //한 페이지에 출력할 레코드 건수
			apaging.setPageSize(2); //페이지바에 나타날 페이지 번호 수(이전 1 2 3 ...10 다음)
			apaging.setPage(pageNo);	//현재 페이지
			apaging.setTotalRecord(AddDAO.getInstance().getPageCount(conn, aculumn, acontent)); //총 레코드 건수
			request.setAttribute("apaging", apaging);
			
			int afirst = apaging.getFirst();
			int alast = apaging.getLast();
			AddDTO adto = new AddDTO();
			adto.setAddStatus(acontent);
			List<AddDTO> addlist = AddDAO.getInstance().selectSearch(conn, adto, afirst, alast);
			request.setAttribute("addlist", addlist);
			
			Paging bpaging = new Paging();
			bpaging.setPageUnit(10); //한 페이지에 출력할 레코드 건수
			bpaging.setPageSize(10); //페이지바에 나타날 페이지 번호 수(이전 1 2 3 ...10 다음)
			bpaging.setPage(pageNo);	//현재 페이지
			bpaging.setTotalRecord(StoreDAO.getInstance().getPageCount(conn, bculumn, bcontent)); //총 레코드 건수
			request.setAttribute("bpaging", bpaging);
			
			int bfirst = apaging.getFirst();
			int blast = apaging.getLast();
			StoreDTO sdto = new StoreDTO();
			sdto.setStoreOc(bcontent);
			List<StoreDTO> slist = StoreDAO.getInstance().selectSearch(conn, sdto, bfirst, blast);
			request.setAttribute("slist", slist);
			
			DAO.disconnect(conn);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/manager/admin_store.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("접근 에러 페이지 만들기");
		}
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

}
