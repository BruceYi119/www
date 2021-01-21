package www.db.dto;

public class CmemberDTO {

	private String rownum = null;
	private String cmno = null;
	private String nick = null;
	private String id = null;
	private String reason = null;
	private String pobu = null;
	private String del_yn = null;
	private String mtype = null;
	private String subday = null;
	
	
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getSubday() {
		return subday;
	}
	public void setSubday(String subday) {
		this.subday = subday;
	}
	public String getCmno() {
		return cmno;
	}
	public void setCmno(String cmno) {
		this.cmno = cmno;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getPobu() {
		return pobu;
	}
	public void setPobu(String pobu) {
		this.pobu = pobu;
	}

	@Override
	public String toString() {
		return "CmemberDTO [rownum" + rownum + "cmno=" + cmno + ", nick=" + nick + ", id=" + id + ", reason=" + reason + ", pobu=" + pobu
				+ ", del_yn=" + del_yn + ", mtype=" + mtype +  ", subday=" + subday + "]";
	}

	public String toString(Boolean t) {
		return "rownum, cmno, nick, id, reason, pobu, del_yn, mtype, subday";
	}
}
