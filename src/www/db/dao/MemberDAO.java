package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.MemberDTO;

public class MemberDAO implements Idao {

	private Db db = null;
	private MemberDTO dto = null;
	private ArrayList<MemberDTO> list = null;

	public MemberDAO() {
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
					dto = new MemberDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setMno(db.rs.getString("mno"));
				dto.setId(db.rs.getString("id"));
				dto.setPw(db.rs.getString("pw"));
				dto.setName(db.rs.getString("name"));
				dto.setPhone(db.rs.getString("phone"));
				dto.setBirth(db.rs.getString("birth"));
				dto.setZipcode(db.rs.getString("zipcode"));
				dto.setAddr(db.rs.getString("addr"));
				dto.setAddr_detail(db.rs.getString("addr_detail"));
				dto.setEmail(db.rs.getString("email"));
				dto.setMtype(db.rs.getString("mtype"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setWritedate(db.rs.getString("writedate"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<MemberDTO>();

		try {
			while(db.rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setMno(db.rs.getString("mno"));
				dto.setId(db.rs.getString("id"));
				dto.setPw(db.rs.getString("pw"));
				dto.setName(db.rs.getString("name"));
				dto.setPhone(db.rs.getString("phone"));
				dto.setBirth(db.rs.getString("birth"));
				dto.setZipcode(db.rs.getString("zipcode"));
				dto.setAddr(db.rs.getString("addr"));
				dto.setAddr_detail(db.rs.getString("addr_detail"));
				dto.setEmail(db.rs.getString("email"));
				dto.setMtype(db.rs.getString("mtype"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setWritedate(db.rs.getString("writedate"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MemberDTO getDto() {
		return dto;
	}

	public ArrayList<MemberDTO> getList() {
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