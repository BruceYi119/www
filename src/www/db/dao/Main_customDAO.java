package www.db.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import www.db.Db;
import www.db.Idao;
import www.db.dto.Main_customDTO;

public class Main_customDAO implements Idao {

	private Db db = null;
	private Main_customDTO dto = null;
	private ArrayList<Main_customDTO> list = null;

	public Main_customDAO() {
		db = Db.getInstance();
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
					dto = new Main_customDTO();

					dto.setRownum(db.rs.getString("rownum"));
					dto.setMcno(db.rs.getString("mcno"));
					dto.setCpu(db.rs.getString("cpu"));
					dto.setVga(db.rs.getString("vga"));
					dto.setPower(db.rs.getString("power"));
					dto.setMb(db.rs.getString("mb"));
					dto.setRam1(db.rs.getString("ram1"));
					dto.setRam2(db.rs.getString("ram2"));
					dto.setHdd(db.rs.getString("hdd"));
					dto.setSsd(db.rs.getString("ssd"));
					dto.setPrice(db.rs.getString("price"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<Main_customDTO>();

		try {
			while(db.rs.next()) {
				Main_customDTO dto = new Main_customDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setMcno(db.rs.getString("mcno"));
				dto.setCpu(db.rs.getString("cpu"));
				dto.setVga(db.rs.getString("vga"));
				dto.setPower(db.rs.getString("power"));
				dto.setMb(db.rs.getString("mb"));
				dto.setRam1(db.rs.getString("ram1"));
				dto.setRam2(db.rs.getString("ram2"));
				dto.setHdd(db.rs.getString("hdd"));
				dto.setSsd(db.rs.getString("ssd"));
				dto.setPrice(db.rs.getString("price"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Main_customDTO getDto() {
		return dto;
	}

	// 테이블 전부 조회 select * from main_custom
	public ArrayList<Main_customDTO> getList() throws SQLException {
		String sql = "select * from main_custom ";
		db.con = DriverManager.getConnection(db.getUrl(), db.getId(), db.getPw());
		db.stmt = db.con.createStatement();
		db.rs = db.stmt.executeQuery(sql);
    	ArrayList<Main_customDTO> list = new ArrayList<Main_customDTO>();
    	while(db.rs.next())
    	{
    		Main_customDTO mdto = new Main_customDTO();
    		mdto.setMcno(db.rs.getString("mcno"));
    		mdto.setCpu(db.rs.getString("cpu"));
    		mdto.setVga(db.rs.getString("vga"));
    		mdto.setPower(db.rs.getString("power"));
    		mdto.setMb(db.rs.getString("mb"));
    		mdto.setRam1(db.rs.getString("ram1"));
    		mdto.setRam2(db.rs.getString("ram2"));
    		mdto.setHdd(db.rs.getString("hdd"));
    		mdto.setSsd(db.rs.getString("ssd"));
    		mdto.setPrice(db.rs.getString("price"));
    		list.add(mdto);
    	}
		return list;
	}
}