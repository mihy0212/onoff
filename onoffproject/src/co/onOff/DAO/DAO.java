package co.onOff.DAO;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAO {

	DataSource ds;
	Connection conn;
	public DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/onoff");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

}
