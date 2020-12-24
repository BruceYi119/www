package www.db.dto;

public class MemberDTO {

	private String mno = null;
	private String id = null;
	private String pw = null;
	private String name = null;
	private String phone = null;
	private String zipcode = null;
	private String addr = null;
	private String addr_detail = null;
	private String email = null;
	private String del_yn = null;
	private String writedate = null;

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mno=" + mno + ", id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone
				+ ", zipcode=" + zipcode + ", addr=" + addr + ", addr_detail=" + addr_detail + ", email=" + email
				+ ", del_yn=" + del_yn + ", writedate=" + writedate + "]";
	}

}