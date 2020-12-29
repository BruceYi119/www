package www.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Db {

	private static Db instance;
	private String jdbc = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "oneteam";
	private String pw = "enffl";
	public Connection con = null;
	public Statement stmt = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;

	private Db() {
		try {
			Class.forName(jdbc);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static synchronized Db getInstance() {
		if (instance == null)
				instance = new Db();

		return instance;
	}

	@Override
	public void finalize() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getUrl() {
		return url;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

}