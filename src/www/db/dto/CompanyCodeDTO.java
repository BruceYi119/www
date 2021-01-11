package www.db.dto;

public class CompanyCodeDTO {
	private String rownum = null;
	private String cno = null;
	private String company = null;
	private String code = null;
	
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "CompanycodeDTO [rownum=" + rownum + ", cno=" + cno + ", company=" + company + ", code=" + code + "]";
	}
	
	
}
