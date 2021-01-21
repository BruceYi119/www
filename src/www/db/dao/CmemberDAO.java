package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import www.db.Idao;
import www.db.dto.CmemberDTO;
import www.db.Db;

public class CmemberDAO implements Idao {

	private Db db = null;
	private CmemberDTO dto = null;
	private ArrayList<CmemberDTO> list = null;

	public CmemberDAO() {
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
					dto = new CmemberDTO();

				dto.setCmno(db.rs.getString("cmno"));
				dto.setNick(db.rs.getString("nick"));
				dto.setId(db.rs.getString("id"));
				dto.setReason(db.rs.getString("reason"));
				dto.setPobu(db.rs.getString("pobu"));
				dto.setMtype(db.rs.getString("mtype"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setSubday(db.rs.getString("subday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void setList() {
		list = new ArrayList<CmemberDTO>();

		try {
			while(db.rs.next()) {
				CmemberDTO dto = new CmemberDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setCmno(db.rs.getString("cmno"));
				dto.setNick(db.rs.getString("nick"));
				dto.setId(db.rs.getString("id"));
				dto.setReason(db.rs.getString("reason"));
				dto.setPobu(db.rs.getString("pobu"));
				dto.setMtype(db.rs.getString("mtype"));
				dto.setDel_yn(db.rs.getString("del_yn"));
				dto.setSubday(db.rs.getString("subday"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	public CmemberDTO getDto() {
		return dto;
	}
	public ArrayList<CmemberDTO> getList() {
		return list;
	}

	public int isusernick(String nick) {
		int cnt = 1;

		try {
			String sql = "select count(*) as cnt from cmember where nick='" + nick + "'";

			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if (db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}

		// 아이디가 존재하면 1, 아니면 0
		return cnt;
	}

	public int isuserid(String id) {
		int cnt = 0;

		try {
			String sql = "select count(*) as cnt from cmember where id='" + id + "'";

			db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
			db.pstmt = db.con.prepareStatement(sql);
			db.rs = db.pstmt.executeQuery();
			if (db.rs.next()) {
				cnt = db.rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.finalize();
		}

		// 아이디가 존재하면 1, 아니면 0
		return cnt;
	}


	public boolean nick_login(HttpSession session, String id) {
		boolean login = false;

		CmemberDTO dto = null;

		String sql = "select * from cmember where id=?";

		select(sql, id);

		if (getDto() != null) {
			dto = getDto();
			session.setAttribute("nick", dto.getNick());
			login = true;
		}

		return login;
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




}
