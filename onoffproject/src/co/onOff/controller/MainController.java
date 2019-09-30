package co.onOff.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.onOff.command.Command;
import co.onOff.command.IndexComm;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
        super();
    }
    
    HashMap<String, Command> map = null;

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		
		//최미현
		map.put("/index.do", new IndexComm());
		
		//백승진
		
		
		//권보성
		
		
		//복진영
		
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		String path = uri.substring(context.length());
		
		Command comm = map.get(path);
		try {
			comm.execute(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
