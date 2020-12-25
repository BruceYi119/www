package www.db;

public interface Idao {
	void select(String sql, String ...args);		// 하나 조회
	void selectAll(String sql, String ...args);		// 여러개 조회
	int insert(String sql, String ...args);			// insert
	int update(String sql, String ...args);			// update
	int delete(String sql, String ...args);			// delete
	void setPstmt(String ...args);					// PreparedStatement.setString()
	void setDto();									// set DTO
	void setList();									// set list
}