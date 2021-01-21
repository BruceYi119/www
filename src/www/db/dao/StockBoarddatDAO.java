package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.StockBoardDTO;
import www.db.dto.StockBoarddatDTO;

public class StockBoarddatDAO implements Idao{
	
	private Db db = null;
	private StockBoarddatDTO  ddto = null;
	public ArrayList<StockBoarddatDTO> list = null;

	public StockBoarddatDTO getDdto() {
		return ddto;
	}

	public ArrayList<StockBoarddatDTO> getList() {
		return list;
	}
	
	public StockBoarddatDAO() {
		db= Db.getInstance();
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
		}
	}

	@Override
	public void selectAll(String sql, String... args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
			setPstmt(args);
			db.rs= db.pstmt.executeQuery();
			setList();
		} catch (SQLException e) {
			e.printStackTrace();
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int update(String sql, String... args) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String sql, String... args) {
		int i = 0;
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			i=db.pstmt.executeUpdate();
			db.con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
		try {
			while(db.rs.next()) {
			ddto.setSbdno(db.rs.getString("sbdno"));
			ddto.setName(db.rs.getString("name"));
			ddto.setContent(db.rs.getString("content"));
			ddto.setWriteday(db.rs.getString("writeday"));
			ddto.setSbno(db.rs.getString("sbno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void setList() {
		list = new ArrayList<StockBoarddatDTO>();
		try {
			while(db.rs.next()) {
				StockBoarddatDTO ddto = new StockBoarddatDTO();
				ddto.setSbdno(db.rs.getString("sbdno"));
				ddto.setName(db.rs.getString("name"));
				ddto.setContent(db.rs.getString("content"));
				ddto.setWriteday(db.rs.getString("writeday"));
				ddto.setSbno(db.rs.getString("sbno"));
				list.add(ddto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		StockBoarddatDAO ddao = new StockBoarddatDAO();
		String sql = "select * from stockboarddat where sbno=85 order by sbdno desc";
		ddao.selectAll(sql);
		System.out.println(ddao.list.toString());
	}
}
