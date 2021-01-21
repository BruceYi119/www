package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.MystoryDTO;

public class MystoryDAO implements Idao {

	private Db db = null;
	private MystoryDTO dto = null;
	private ArrayList<MystoryDTO> list = null;

	public MystoryDAO() {
		db = Db.getInstance();
	}

	@Override
	public void select(String sql, String... args) {
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
	public void selectAll(String sql, String... args) {
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
	public int insert(String sql, String... args) {
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
	public int update(String sql, String... args) {
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
	public int delete(String sql, String... args) {
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
	public void setPstmt(String... args) {
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
					dto = new MystoryDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setSno(db.rs.getString("sno"));
				dto.setContent(db.rs.getString("content"));
				dto.setWritedate(db.rs.getString("writedate"));
				dto.setUpdatedate(db.rs.getString("updatedate"));
				dto.setMovietitle(db.rs.getString("movietitle"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<MystoryDTO>();

		try {
			while (db.rs.next()) {
				dto.setRownum(db.rs.getString("rownum"));
				dto.setSno(db.rs.getString("sno"));
				dto.setContent(db.rs.getString("content"));
				dto.setWritedate(db.rs.getString("writedate"));
				dto.setUpdatedate(db.rs.getString("updatedate"));
				dto.setMovietitle(db.rs.getString("movietitle"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MystoryDTO getDto() {
		return dto;
	}

	public ArrayList<MystoryDTO> getList() {
		return list;
	}

//	public static void main(String[] args) {
//		MoviesDAO dao = new MoviesDAO();
//		String sql = "select rownum, t.* from movies t";
//		dao.selectAll(sql);
//
//		for (MoviesDTO dto : dao.getList())
//			System.out.println(dto.getViewrating());
//	}

}