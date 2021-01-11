package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.RcommentDTO;

public class RcommentDAO implements Idao {

	private Db db = null;
	private RcommentDTO dto = null;
	private ArrayList<RcommentDTO> list = null;

	public RcommentDAO() {
		db = Db.getInstance();
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
					dto = new RcommentDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setRcno(db.rs.getString("rcno"));
				dto.setName(db.rs.getString("name"));
				dto.setContent(db.rs.getString("content"));
				dto.setWriteday(db.rs.getString("writeday"));
				dto.setRno(db.rs.getString("rno"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<RcommentDTO>();

		try {
			while(db.rs.next()) {
				RcommentDTO dto = new RcommentDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setRcno(db.rs.getString("rcno"));
				dto.setName(db.rs.getString("name"));
				dto.setContent(db.rs.getString("content"));
				dto.setWriteday(db.rs.getString("writeday"));
				dto.setRno(db.rs.getString("rno"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public RcommentDTO getDto() {
		return dto;
	}

	public ArrayList<RcommentDTO> getList() {
		return list;
	}

}