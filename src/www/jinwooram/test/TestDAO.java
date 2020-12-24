package www.jinwooram.test;

import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;

public class TestDAO implements Idao {

	private Db db = null;
	private TestDTO dto = null;
	private ArrayList<TestDTO> list = null;

	public TestDAO() {
		db = Db.getInstance();
	}

	@Override
	public void select(String sql, String... args) {
		try {
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
	public void insert(String sql, String... args) {
		try {
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);			
			db.pstmt.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}

	@Override
	public void update(String sql, String... args){
		try {
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);			
			db.pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}
	@Override
	public void delete(String sql, String... args) {
		try {
			db.pstmt = db.con.prepareStatement(sql);
			setPstmt(args);
			db.pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}
	@Override
	public void setDto() {
		dto = new TestDTO();

		try {
			while(db.rs.next()) {
				dto.setTno(db.rs.getString("tno"));
				dto.setContent(db.rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
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
	public void setList(){
		list = new ArrayList();

		try {
			while(db.rs.next()) {
				TestDTO dto = new TestDTO();

				dto.setTno(db.rs.getString("tno"));
				dto.setContent(db.rs.getString("content"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}
	}

	public static void main(String[] args) {
		// 하나조회
//		TestDAO dao = new TestDAO();
//		String sql = "select * from test where tno = ?";
//		String tno = "3";
//		String content = "content3";
//
//		dao.select(sql, tno);
//		System.out.println(dao.dto.toString());
		
		// 업데이트
//		TestDAO dao = new TestDAO();
//		String sql = "update test set content = ? where tno = ?";
//		String conetnt = "수정한 데이터";
//		String tno = "3";
//		
//		dao.update(sql, conetnt, tno);
		
		// 삭제
//		TestDAO dao = new TestDAO();
//		String sql = "delete from test where tno = ?";
//		String tno = "3";
//
//		dao.delete(sql, tno);
		
		// 전체조회
//		TestDAO dao = new TestDAO();
//		String sql = "select * from test";
//
//		dao.selectAll(sql);
//		
//		for (TestDTO dto : dao.list) {
//			System.out.println(dto.toString());
//		}

		// 추가
//		TestDAO dao = new TestDAO();
//		String sql = "insert into test values(?,?)";
//		String tno = "5";
//		String content = "추가하는 데이터";
//
//		dao.insert(sql, tno, content);
	}

}