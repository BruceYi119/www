package www.db.dao;




import java.util.ArrayList;
import java.sql.DriverManager;
import java.sql.SQLException;

import www.db.Idao;
import www.db.dto.CdatDTO;
import www.db.Db;

public class CdatDAO implements Idao {

	private Db db = null;
	private CdatDTO dto = null;
	public ArrayList<CdatDTO> list = null;
	
	
	public CdatDAO() {
		db = Db.getInstance();
	}
	
	@Override
	public void select(String sql, String... args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			this.dto = new CdatDTO();

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
					db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
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
		this.dto = new CdatDTO();

		try {
			while (db.rs.next()) {
				dto.setCdno(db.rs.getString("cdno"));
				dto.setDname(db.rs.getString("dname"));
				dto.setDcontent(db.rs.getString("dcontent"));
				dto.setCno(db.rs.getString("cno"));
				dto.setWriteday(db.rs.getString("writeday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void setList() {
		list = new ArrayList<CdatDTO>();

		try {
			while(db.rs.next()) {
				CdatDTO dto = new CdatDTO();

				dto.setCdno(db.rs.getString("cdno"));
				dto.setDname(db.rs.getString("dname"));
				dto.setDcontent(db.rs.getString("dcontent"));
				dto.setCno(db.rs.getString("cno"));
				dto.setWriteday(db.rs.getString("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	
	public CdatDTO getDto() {
		return dto;
	}

	public ArrayList<CdatDTO> getList() {
		return list;
	}


}
