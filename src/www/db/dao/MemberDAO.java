package www.db.dao;

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

	@Override
	public void select(String sql, String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectAll(String sql, String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(String sql, String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(String sql, String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String sql, String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setPstmt(String... args) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setDto() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setList() {
		// TODO Auto-generated method stub
		
	}

}