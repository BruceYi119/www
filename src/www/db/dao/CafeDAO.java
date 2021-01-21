package www.db.dao;




import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Idao;
import www.db.dto.CafeDTO;
import www.db.dto.MemberDTO;
import www.db.Db;

public class CafeDAO implements Idao {


	private Db db = null;
	private CafeDTO dto = null;
	public ArrayList<CafeDTO> list = null;

	public CafeDAO() {
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
		int i = 0;
		
		try {
			while (db.rs.next()) {
				if (i == 0)	
					dto = new CafeDTO();
				
				dto.setCno(db.rs.getString("cno"));
				dto.setName(db.rs.getString("name"));
				dto.setTitle(db.rs.getString("title"));
				dto.setWritype(db.rs.getString("writype"));
				dto.setAnimal(db.rs.getString("animal"));
				dto.setContent(db.rs.getString("content"));
				dto.setFname(db.rs.getString("fname"));
				dto.setReadnum(db.rs.getString("readnum"));
				dto.setLiked(db.rs.getString("liked"));
				dto.setFimsi(db.rs.getString("fimsi"));
				dto.setWriteday(db.rs.getString("writeday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void setList() {
		list = new ArrayList<CafeDTO>();

		try {
			while(db.rs.next()) {
				CafeDTO dto = new CafeDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setCno(db.rs.getString("cno"));
				dto.setName(db.rs.getString("name"));
				dto.setTitle(db.rs.getString("title"));
				dto.setWritype(db.rs.getString("writype"));
				dto.setAnimal(db.rs.getString("animal"));
				dto.setContent(db.rs.getString("content"));
				dto.setFname(db.rs.getString("fname"));
				dto.setReadnum(db.rs.getString("readnum"));
				dto.setLiked(db.rs.getString("liked"));
				dto.setFimsi(db.rs.getString("fimsi"));
				dto.setWriteday(db.rs.getString("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}


	}
	public CafeDTO getDto() {
		return dto;
	}

	public ArrayList<CafeDTO> getList() {
		return list;
	}
	
	public int getListCount1() {
		int cnt = 1;
		
		try {
			String sql = "select count(*) as cnt from cafe ";
			
			
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		return cnt;
	}
	public int getListCount2(String addsql,String sword) {
		int cnt = 1;
		
		try {
			String sql = "select count(*) as cnt from cafe "+addsql+" '%"+sword+"%'";
				
			
			
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		return cnt;
	}
	public int getListCount3(String addsql,String addsql2, String sword) {
		int cnt = 1;
		
		try {
			String sql = "select count(*) as cnt from cafe "+addsql+" '%"+sword+"%'";
			sql=sql + addsql2 +" '%"+sword+"%'";
			
			
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		return cnt;
	}
	
	public int getListCount4(String addsql,String find) {
		int cnt = 1;
		
		try {
			String sql = "select count(*) as cnt from cafe "+addsql+"'"+find+"'";
				
			
			
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
		return cnt;
	}
	
	
	
	public static void main(String[] args) {
//		CNO      NOT NULL NUMBER         
//		NAME              VARCHAR2(20)   
//		PWD               VARCHAR2(20)   
//		TITLE             VARCHAR2(100)  
//		WRITYPE           VARCHAR2(30)   
//		ANIMAL            VARCHAR2(20)   
//		CONTENT           VARCHAR2(1000) 
//		FNAME             VARCHAR2(100)  
//		READNUM           NUMBER         
//		LIKED             NUMBER         
//		FIMSI             VARCHAR2(100)  
//		WRITEDAY          DATE           
//		26	바둑이	1234	왈왈	애완동물 소개	강아지	하이		0	0		21/01/05 row
		CafeDAO dao = new CafeDAO();
		String sql = "select rownum, t.* from cafe t order by cno desc";
// ?가없죠?
		
		dao.select(sql);
		System.out.println(dao.getDto().toString());
	}
	
}