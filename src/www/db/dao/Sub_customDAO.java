package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.Sub_customDTO;

public class Sub_customDAO implements Idao {

	private Db db = null;
	private Sub_customDTO dto = null;
	private ArrayList<Sub_customDTO> list = null;

	public Sub_customDAO() {
		db = Db.getInstance();
	}

	public int count(String sql, String ...args) {
		int count = 0;

		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			db.rs = db.pstmt.executeQuery();

			while (db.rs.next())
				count = db.rs.getInt("total");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		
		return count;
	}

	@Override
	public void select(String sql, String ...args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			db.rs = db.pstmt.executeQuery();
			setDto();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}

	@Override
	public void selectAll(String sql, String ...args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			db.rs = db.pstmt.executeQuery();
			setList();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}

	@Override
	public int insert(String sql, String ...args) {
		int i = 0;

		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			i = db.pstmt.executeUpdate();
			db.con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}

		return i;
	}

	@Override
	public int update(String sql, String ...args) {
		int i = 0;
		
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			i = db.pstmt.executeUpdate();
			db.con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		
		return i;	
	}

	@Override
	public int delete(String sql, String ...args) {
		int i = 0;
		
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			i = db.pstmt.executeUpdate();
			db.con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}

		return i;
	}

	@Override
	public void setPstmt(String ...args) {
		if (args.length > 0) {
			int i = 1;

			for (String col : args) {
				try {
					db.pstmt.setString(i, col);
				} catch (SQLException e) {
					e.printStackTrace();
				}

				i++;
			}
		}
	}

	@Override
	public void setDto() {
		int i = 0;

		try {
			while (db.rs.next()) {
				if (i == 0)
					dto = new Sub_customDTO();

				dto.setScno(db.rs.getString("scno"));
				dto.setSname(db.rs.getString("sname"));
				dto.setScontent(db.rs.getString("scontent"));
				dto.setSpw(db.rs.getString("spw"));
				dto.setMcno(db.rs.getString("mcno"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<Sub_customDTO>();

		try {
			while(db.rs.next()) {
				Sub_customDTO dto = new Sub_customDTO();

				dto.setScno(db.rs.getString("scno"));
				dto.setSname(db.rs.getString("sname"));
				dto.setScontent(db.rs.getString("scontent"));
				dto.setSpw(db.rs.getString("spw"));
				dto.setMcno(db.rs.getString("mcno"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Sub_customDTO getDto() {
		return dto;
	}

	public ArrayList<Sub_customDTO> getList() {
		return list;
	}
	
}