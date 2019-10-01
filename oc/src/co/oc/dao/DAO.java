package co.oc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {

	PreparedStatement psmt;
	ResultSet rs;
	
//	public DAO() {
//		try {
//			Context context = new InitialContext();
//			ds = (DataSource)context.lookup("java:comp/env/jdbc/onoff");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}

	// DB연결 메서드
		public static Connection connect() {
			Connection conn = null;
			try {
				Context initContext = new InitialContext();
				Context envContext = (Context) initContext.lookup("java:/comp/env");
				DataSource ds = (DataSource) envContext.lookup("jdbc/onoff");

				// 커넥션 얻기
				conn = ds.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}

		public static void disconnect(PreparedStatement pstmt, Connection conn) {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		public static void disconnect(Connection conn) {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
}
