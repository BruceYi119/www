package www.db.dto;

public class Sub_customDTO {
	String scno = null;
	String sname = null;
	String scontent = null;
	String spw = null;
	String mcno = null;

	public String getMcno() {
		return mcno;
	}

	public void setMcno(String mcno) {
		this.mcno = mcno;
	}

	public String getScno() {
		return scno;
	}

	public void setScno(String scno) {
		this.scno = scno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public String getSpw() {
		return spw;
	}

	public void setSpw(String spw) {
		this.spw = spw;
	}

	@Override
	public String toString() {
		return "Sub_customDTO [scno=" + scno + ", sname=" + sname + ", scontent=" + scontent + ", spw=" + spw
				+ ", mcno=" + mcno + "]";
	}

}