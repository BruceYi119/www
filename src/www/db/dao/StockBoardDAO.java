package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.StockBoardDTO;

public class StockBoardDAO implements Idao{
	
	
	private Db db = null;
	private StockBoardDTO  dto = null;
	private String count = "0";
	public ArrayList<StockBoardDTO> list = null;
	
	public ArrayList<StockBoardDTO> getList() {
		return list;
	}

	public StockBoardDTO getDto() {
		return dto;
	}
	
	public StockBoardDAO() {
		db= Db.getInstance();
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
		int i = 0;
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
			setPstmt(args);
			i = db.pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}

	@Override
	public int delete(String sql, String... args) {
		int i = 0;
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
			setPstmt(args);
			i= db.pstmt.executeUpdate();
			db.con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
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
			while(db.rs.next()) {
				if (i == 0)
					dto = new StockBoardDTO();

//				dto.setRownum(db.rs.getString("rownum"));
				dto.setSbno(db.rs.getString("sbno"));
				dto.setName(db.rs.getString("name"));
				dto.setPwd(db.rs.getString("pwd"));
				dto.setTitle(db.rs.getString("title"));
				dto.setContent(db.rs.getString("content"));
				dto.setFname(db.rs.getString("fname"));
				dto.setWriteday(db.rs.getString("writeday"));
				dto.setReadnum(db.rs.getString("readnum"));
				dto.setGood(db.rs.getString("good"));
				dto.setBad(db.rs.getString("bad"));
				dto.setSung(db.rs.getString("sung"));
				dto.setKind(db.rs.getString("kind"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<StockBoardDTO>();
		try {
				while(db.rs.next()) {
				StockBoardDTO dto = new StockBoardDTO();
					dto.setRownum(db.rs.getString("rownum"));
					dto.setSbno(db.rs.getString("sbno"));
					dto.setName(db.rs.getString("name"));
					dto.setPwd(db.rs.getString("pwd"));
					dto.setTitle(db.rs.getString("title"));
					dto.setContent(db.rs.getString("content"));
					dto.setFname(db.rs.getString("fname"));
					dto.setWriteday(db.rs.getString("writeday"));
					dto.setReadnum(db.rs.getString("readnum"));
					dto.setGood(db.rs.getString("good"));
					dto.setBad(db.rs.getString("bad"));
					dto.setSung(db.rs.getString("sung"));
					dto.setKind(db.rs.getString("kind"));
				list.add(dto);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount() {
		int cnt = 1;

		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			dto = new StockBoardDTO();
			String sql = "select count(*) as cnt from stockboard";
			db.pstmt=db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if(db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
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

	public void row_num(int index) {
		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			String sql = "select * from (select row_number() over(order by sbno desc) as rnum, kind, writeday, title, name, good, bad, readnum from stockboard ) where rnum >= " + index + " and rownum <=20";
			db.pstmt = db.con.prepareStatement(sql);
			db.rs= db.pstmt.executeQuery();
			setList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public String getCount() {
		return count;
	}

	public ArrayList<String> getKindList() {
		ArrayList<String> list = new ArrayList();
		String sql = "select kind from stockboard group by kind";

		try {
			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt=db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			
			while(db.rs.next()) {
				list.add(db.rs.getString("kind"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public static void main(String[] args) {
		
		StockBoardDAO dao = new StockBoardDAO();
		
		String sql = "select rownum, sbno, name, pwd, title, content, fname, writeday, readnum, good, bad, sung, kind from (select seq, t2.* from (select rownum seq, t1.* from (select * from stockboard where name like '%삼성%' order by sbno desc) t1) t2 where seq >= 0) where rownum <= 15";
		dao.selectAll(sql);
		System.out.println(dao.getList().toString());
		/*
		int index=10;
		String sql ="select rownum, sbno, name, pwd, title, content, fname, writeday, readnum, good, bad, sung, kind from (select seq, t2.* from (select rownum seq, t1.* from (select * from stockboard where name like '%삼성%' order by sbno desc) t1) t2 where seq >= 0) where rownum <= 15";
		dao.selectAll(sql);
		System.out.println(dao.list.toString());
		*/
		
//		String sql= "select * from stockboard where sbno=121";
//		dao.select(sql);
//		System.out.println(dao.getDto().toString());
		
//		dao.row_num(index);
//		String sql =  "select * from ( "+ rnum+") kind, writeday, title, name, good, bad, readnum from stockboard ) where rnum >= 10 and rownum <=20";
//		System.out.println(sql);
//		System.out.println(dao.list.toString());
//		int cnt = dao.getListCount();
//		System.out.println(cnt);
//		String sql= "select * from stockboard order by sbno desc";
//		dao.selectAll(sql);
//		System.out.println(dao.list.toString());
//		String sql = "insert into stockboard (sbno,name,title,content,fname,pwd,writeday,sung,kind) values (s_stockboard.nextval,?,?,?,?,?,sysdate,?,?)";
//		String name = dao.dto.getName();
//		String title = dao.dto.getTitle();
//		String content = dao.dto.getContent();
//		String fname = dao.dto.getFname();
//		String pwd = dao.dto.getPwd();
//		String sung  = dao.dto.getSung();
//		String kind = dao.dto.getKind();
//		
//		int r = dao.insert(sql, name,title,content,fname,pwd,sung,kind);
//		System.out.println(r);
	}
}
