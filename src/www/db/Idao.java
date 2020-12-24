package www.db;

import java.sql.SQLException;

public interface Idao {
	void select(String sql, String ...args);			// 하나 조회
	void selectAll(String sql, String ...args);			// 여러개 조회
	void insert(String sql, String ...args);			// insert
	void update(String sql, String ...args);			// update
	void delete(String sql, String ...args);			// delete
	void setPstmt(String ...args);						// PreparedStatement.setString()
	void setDto();										// set DTO
	void setList();										// set list
}