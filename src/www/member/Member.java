package www.member;

import javax.servlet.http.HttpSession;

import www.db.dao.MemberDAO;
import www.db.dto.MemberDTO;
import www.security.Security;

public class Member {

	public boolean adminLogin(HttpSession session, String id, String pw) {
		boolean login = false;

		Security s = new Security();
		MemberDAO dao = new MemberDAO();
		String sql = "select rownum, t.* from member t where id = ? and pw = ? and mtype = 'a'";
		MemberDTO dto = null;

		s.getSha512(pw);
		pw = s.getSha512();

		dao.select(sql, id, pw);

		if (dao.getDto() != null) {
			dto = dao.getDto();
			session.setAttribute("admin", dto.getId());
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			login = true;
		}

		return login;
	}

	public boolean login(HttpSession session, String id, String pw) {
		boolean login = false;

		Security s = new Security();
		MemberDAO dao = new MemberDAO();
		String sql = "select rownum, t.* from member t where id = ? and pw = ?";
		MemberDTO dto = null;

		s.getSha512(pw);
		pw = s.getSha512();

		dao.select(sql, id, pw);

		if (dao.getDto() != null) {
			dto = dao.getDto();
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			login = true;
		}

		return login;
	}

	public boolean isLogin(HttpSession session) {
		Boolean login = false;

		if (session.getAttribute("id") != null && session.getAttribute("name") != null)
			login = true;

		return login;
	}

	public boolean isAdminLogin(HttpSession session) {
		Boolean login = false;
		
		if (session.getAttribute("admin") != null)
			login = true;
		
		return login;
	}

}