package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import www.db.Db;
import www.db.Idao;
import www.db.dto.CompanyCodeDTO;
import www.db.dto.StockBoardDTO;

public class CompanyCodeDAO implements Idao {

	private Db db = null;
	private CompanyCodeDTO  dto = null;
	private String count = "0";
	public ArrayList<CompanyCodeDTO> list = null;
	
	public ArrayList<CompanyCodeDTO> getList() {
		return list;
	}
	public CompanyCodeDTO getDto() {
		return dto;
	}
	public CompanyCodeDAO() {
		db=Db.getInstance();
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
		int i = 0;
		
		try {
			while(db.rs.next()) {
				if (i == 0)
					dto = new CompanyCodeDTO();
				dto.setCno(db.rs.getString("cno"));
				dto.setCompany(db.rs.getString("company"));
				dto.setCode(db.rs.getString("code"));
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void setList() {
		list = new ArrayList<CompanyCodeDTO>();
		try {
			while(db.rs.next()) {
				CompanyCodeDTO dto = new CompanyCodeDTO();
					dto.setRownum(db.rs.getString("rownum"));
					dto.setCno(db.rs.getString("cno"));
					dto.setCompany(db.rs.getString("company"));
					dto.setCode(db.rs.getString("code"));
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
		CompanyCodeDAO dao = new CompanyCodeDAO();
		String sql = "select rownum,cno,company,code from ( select seq, t2. * from ( select rownum seq, t1.* from( select * from companycode where company like '%%' order by cno desc) t1 ) t2 where seq >=0 ) where rownum <=15";
		dao.selectAll(sql);
		System.out.println(dao.getList().toString());
//		String sql = "select * from companycode where cno=1";
//		dao.select(sql);
//		System.out.println(dao.getDto().toString());
	
	}
}
