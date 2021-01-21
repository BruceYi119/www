package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.MoviesDTO;

public class MoviesDAO implements Idao {

	private Db db = null;
	private MoviesDTO dto = null;
	private ArrayList<MoviesDTO> list = null;

	public MoviesDAO() {
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
					dto = new MoviesDTO();
				
				dto.setRownum(db.rs.getString("rownum"));
				dto.setMno(db.rs.getString("mno"));
				dto.setTitle(db.rs.getString("title"));
				dto.setViewrating(db.rs.getString("viewrating"));
				dto.setSalesrating(db.rs.getString("salesrating"));
				dto.setGenre(db.rs.getString("genre"));
				dto.setRuntime(db.rs.getString("runtime"));
				dto.setReleasedate(db.rs.getString("releasedate"));
				dto.setFilmdirector(db.rs.getString("filmdirector"));
				dto.setImgtitle(db.rs.getString("imgtitle"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<MoviesDTO>();

		try {
			while(db.rs.next()) {
				MoviesDTO dto = new MoviesDTO();
				dto.setRownum(db.rs.getString("rownum"));
				dto.setMno(db.rs.getString("mno"));
				dto.setTitle(db.rs.getString("title"));
				dto.setViewrating(db.rs.getString("VIEWRATING"));
				dto.setSalesrating(db.rs.getString("salesrating"));
				dto.setGenre(db.rs.getString("genre"));
				dto.setRuntime(db.rs.getString("runtime"));
				dto.setReleasedate(db.rs.getString("releasedate"));
				dto.setFilmdirector(db.rs.getString("filmdirector"));
				dto.setImgtitle(db.rs.getString("imgtitle"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MoviesDTO getDto() {
		return dto;
	}

	public ArrayList<MoviesDTO> getList() {
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