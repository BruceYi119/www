package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.StockDTO;

public class StockDAO implements Idao {
	
	private Db db = null;
	private StockDTO dto = null;
	private String count = "0";
	public ArrayList<StockDTO> list = null;
	
	public StockDTO getDto() {
		return dto;
	}


	public ArrayList<StockDTO> getList() {
		return list;
	}
	
	public StockDAO() {
		db = Db.getInstance();
	}

	@Override
	public void select(String sql, String... args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String sql, String... args) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String sql, String... args) {
		// TODO Auto-generated method stub
		return 0;
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
		int i=0;
		try {
			while(db.rs.next()) {
				if(i==0)
					dto= new StockDTO();
				dto.setSno(db.rs.getString("sno"));
				dto.setTitle(db.rs.getString("title"));
				dto.setSiga(db.rs.getString("siga"));
				dto.setGijun(db.rs.getString("gijun"));
				dto.setBeadang(db.rs.getString("beadang"));
				dto.setSuik(db.rs.getString("suik"));
				dto.setBeadang1(db.rs.getString("beadang1"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void setList() {
		list = new ArrayList<StockDTO>();
		try {
			while(db.rs.next()) {
				StockDTO dto = new StockDTO();
					dto.setRownum(db.rs.getString("rownum"));
					dto.setSno(db.rs.getString("sno"));
					dto.setTitle(db.rs.getString("title"));
					dto.setSiga(db.rs.getString("siga"));
					dto.setGijun(db.rs.getString("gijun"));
					dto.setBeadang(db.rs.getString("beadang"));
					dto.setSuik(db.rs.getString("suik"));
					dto.setBeadang1(db.rs.getString("beadang1"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void count(String sql, String ...args) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
			setPstmt(args);
			db.rs = db.pstmt.executeQuery();
			if (db.rs.next()) {
				count = db.rs.getString("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getCount() {
		return count;
	}

	public static void main(String[] args) {
		StockDAO dao = new StockDAO();
		dao.count.toString();
		System.out.println(dao.count.toString());
//		String sql = "select * from stock where title='진성티이씨'";
//		dao.select(sql);
//		System.out.println(dao.getDto().toString());
		
//		String sql = "select rownum,sno,title,siga,gijun,beadang,suik,beadang1 from (select seq,t2.* from( select rownum seq, t1.* from (select * from stock where title like '%삼성%' order by suik desc) t1) t2 where seq>=0 ) where rownum <=20";
//		dao.selectAll(sql);
//		System.out.println(dao.getList().toString());
	}
}
