package co.onOff.DAO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DAO {

	DataSource ds;

	public DAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

}
