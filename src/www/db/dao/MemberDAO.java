package www.db.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.MemberDTO;
import www.security.Security;

public class MemberDAO implements Idao {

	private Db db = null;
	private MemberDTO dto = null;
	private ArrayList<MemberDTO> list = null;

	public MemberDAO() {
		db = new Db();
//		db = Db.getInstance();
	}

	@Override
	public void select(String sql, String ...args) {
		try {
			this.dto = new MemberDTO();

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
		this.dto = new MemberDTO();

		try {
			while (db.rs.next()) {
				dto.setMno(db.rs.getString("mno"));
				dto.setId(db.rs.getString("id"));
				dto.setPw(db.rs.getString("pw"));
				dto.setName(db.rs.getString("name"));
				dto.setPhone(db.rs.getString("phone"));
				dto.setZipcode(db.rs.getString("zipcode"));
				dto.setAddr(db.rs.getString("addr"));
				dto.setAddr_detail(db.rs.getString("addr_detail"));
				dto.setEmail(db.rs.getString("email"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setWritedate(db.rs.getString("writedate"));
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

				dto.setMno(db.rs.getString("mno"));
				dto.setId(db.rs.getString("id"));
				dto.setPw(db.rs.getString("pw"));
				dto.setName(db.rs.getString("name"));
				dto.setPhone(db.rs.getString("phone"));
				dto.setZipcode(db.rs.getString("zipcode"));
				dto.setAddr(db.rs.getString("addr"));
				dto.setAddr_detail(db.rs.getString("addr_detail"));
				dto.setEmail(db.rs.getString("email"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setWritedate(db.rs.getString("writedate"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//	public static void main(String[] args) {
//		MemberDAO dao = new MemberDAO();
		// insert
//		Security s = null;
//
//		String sql = "insert into member(mno,id,pw,name,phone,zipcode,addr,addr_detail,email) values(s_member.nextval,?,?,?,?,?,?,?,?)";
//		String id = "haha";
//		String pw = "qkqh1234";
//		String name = "바보삼둥이";
//		String phone = "010-0000-0000";
//		String zipcode = "010034";
//		String addr = "주소";
//		String addr_detail = "상세주소";
//		String email = "asdf@google.com";
//
//		s = new Security(pw);
//		pw = s.getSha512();
//
//		int r = dao.insert(sql, id, pw, name, phone, zipcode, addr, addr_detail, email);
//		System.out.println(r);

		// select
//		String sql = "select * from member where mno = ?";
//		String mno = "19";
//
//		dao.select(sql, mno);
//		System.out.println(dao.dto.toString());

		// selectAll
//		String sql = "select * from member order by id asc";
//
//		dao.selectAll(sql);
//		System.out.println(dao.list.toString());

		// update
//		String sql = "update member set name = ?, addr = ? where mno = ?";
//		String name = "수정된이름";
//		String addr = "수정된주소";
//		String mno = "20";
//
//		int r = dao.update(sql, name, addr, mno);
//		System.out.println(r);

		// delete
//		String sql = "delete from member where mno = ?";
//		String mno = "19";
//
//		int r = dao.delete(sql, mno);
//		System.out.println(r);
		
		// insert, update, delete시 int 를 반환하는데 실행된 결과수를 반환해주니 사용하실분은 int에 담아서 사용하시면 됩니다
//	}

}