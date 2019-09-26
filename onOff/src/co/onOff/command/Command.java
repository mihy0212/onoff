package co.onOff.command;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException;

}
