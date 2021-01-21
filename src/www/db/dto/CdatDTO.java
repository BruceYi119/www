package www.db.dto;



public class CdatDTO extends CafeDTO{
	CafeDTO dto= new CafeDTO();
	
	private String cdno = null;
	private String dname = null;
	private String dcontent = null;
	private String cno= dto.getCno();
	private String writeday = null;
	
	public String getCdno() {
		return cdno;
	}
	public void setCdno(String cdno) {
		this.cdno = cdno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	@Override
	public String toString() {
		return "CdatDTO [cdno=" + cdno + ", dname=" + dname + ", dcontent=" + dcontent + ", cno="
				+ cno + ", writeday=" + writeday + "]";
	}
	
	
	
}
