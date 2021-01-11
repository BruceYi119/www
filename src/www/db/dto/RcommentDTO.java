package www.db.dto;

public class RcommentDTO {
	
	private String rownum = null;
	private String rcno = null;
	private String name = null;
	private String content = null;
	private String writeday = null;
	private String rno = null;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getRcno() {
		return rcno;
	}
	public void setRcno(String rcno) {
		this.rcno = rcno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	
	@Override
	public String toString() {
		return "RcommentDTO [rownum=" + rownum + ", rcno=" + rcno + ", name=" + name +", content=" + content + ", writeday=" + writeday
				+ ", rno=" + rno + "]";
	}
	
	public String toString(boolean t) {
		return "rownum, rcno, name, content, writeday, rno";
	}


}