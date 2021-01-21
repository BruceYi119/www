package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.ReservationDTO;

public class ReservationDAO implements Idao {

	private Db db = null;
	private ReservationDTO dto = null;
	private ArrayList<ReservationDTO> list = null;

	public ReservationDAO() {
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
					dto = new ReservationDTO();

				dto.setRno(db.rs.getInt("rno"));
				dto.setRdate(db.rs.getString("rdate"));
				dto.setRtime(db.rs.getString("rtime"));
				dto.setRname(db.rs.getString("rname"));
				dto.setRphone(db.rs.getString("rphone"));
				dto.setRadult_cnt(db.rs.getInt("radult_cnt"));
				dto.setRchild_cnt(db.rs.getInt("rchild_cnt"));
				dto.setReat(db.rs.getString("reat"));
				dto.setRbigo(db.rs.getString("rbigo"));
				dto.setRchk(db.rs.getInt("rchk"));
				dto.setRwritedate(db.rs.getDate("rwritedate"));
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<ReservationDTO>();

		try {
			while(db.rs.next()) {
				ReservationDTO dto = new ReservationDTO();

				dto.setRno(db.rs.getInt("rno"));
				dto.setRdate(db.rs.getString("rdate"));
				dto.setRtime(db.rs.getString("rtime"));
				dto.setRname(db.rs.getString("rname"));
				dto.setRphone(db.rs.getString("rphone"));
				dto.setRadult_cnt(db.rs.getInt("radult_cnt"));
				dto.setRchild_cnt(db.rs.getInt("rchild_cnt"));
				dto.setReat(db.rs.getString("reat"));
				dto.setRbigo(db.rs.getString("rbigo"));
				dto.setRchk(db.rs.getInt("rchk"));
				dto.setRwritedate(db.rs.getDate("rwritedate"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ReservationDTO getDto() {
		return dto;
	}

	public ArrayList<ReservationDTO> getList() {
		return list;
	}

//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
//		MemberDTO dto = new MemberDTO();
//		String sql = "select rownum, t.* from member t";
//
//		dao.selectAll(sql);
//		System.out.println(dto.toString(true));
//	}

}