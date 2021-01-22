package www.db.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.annotation.MultipartConfig;

import www.db.Db;
import www.db.Idao;
import www.db.dto.Recipe_boardDTO;

public class Recipe_boardDAO implements Idao {

	private Db db = null;
	private Recipe_boardDTO dto = null;
	private ArrayList<Recipe_boardDTO> list = null;
	public String[] rcategorys = {
		"밑반찬","메인반찬","국/탕/찌개","디저트","면/만두","밥/죽/떡","김치/젓갈/장류",
		"양념/소스/잼","양식/샐러드/스프","차/음료/술","기타"
	};
	
	public Recipe_boardDAO() {
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
					dto = new Recipe_boardDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setRbno(db.rs.getString("rbno"));
				dto.setName(db.rs.getString("name"));
				dto.setTitle(db.rs.getString("title"));
				dto.setRcategory(db.rs.getString("rcategory"));
				dto.setIntro(db.rs.getString("intro"));
				dto.setIngredients(db.rs.getString("ingredients"));
				dto.setContent(db.rs.getString("content"));
				dto.setMainimg(db.rs.getString("mainimg"));
				dto.setImg(db.rs.getString("img"));
				dto.setReadnum(db.rs.getString("readnum"));
				dto.setLiked(db.rs.getString("liked"));
				dto.setWriteday(db.rs.getString("writeday"));
				dto.setAddtype(db.rs.getString("addtype"));

				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void setList() {
		list = new ArrayList<Recipe_boardDTO>();

		try {
			while(db.rs.next()) {
				Recipe_boardDTO dto = new Recipe_boardDTO();

				dto.setRownum(db.rs.getString("rownum"));
				dto.setRbno(db.rs.getString("rbno"));
				dto.setName(db.rs.getString("name"));
				dto.setTitle(db.rs.getString("title"));
				dto.setRcategory(db.rs.getString("rcategory"));
				dto.setIntro(db.rs.getString("intro"));
				dto.setIngredients(db.rs.getString("ingredients"));
				dto.setContent(db.rs.getString("content"));
				dto.setImg(db.rs.getString("img"));
				dto.setMainimg(db.rs.getString("mainimg"));
				dto.setReadnum(db.rs.getString("readnum"));
				dto.setLiked(db.rs.getString("liked"));
				dto.setWriteday(db.rs.getString("writeday"));
				dto.setAddtype(db.rs.getString("addtype"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Recipe_boardDTO getDto() {
		return dto;
	}

	public ArrayList<Recipe_boardDTO> getList() {
		return list;
	}

}