package www.db.dto;

public class StockBoarddatDTO {
	String sbdno = null;
	String name = null;
	String content = null;
	String writeday = null;
	String sbno = null;
	public String getSbdno() {
		return sbdno;
	}
	public void setSbdno(String sbdno) {
		this.sbdno = sbdno;
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
	public String getSbno() {
		return sbno;
	}
	public void setSbno(String sbno) {
		this.sbno = sbno;
	}
	
	@Override
	public String toString() {
		return "StockBoarddatDTO [sbdno=" + sbdno + ", name=" + name + ", content=" + content + ", writeday=" + writeday
				+ ", sbno=" + sbno + "]";
	}
	
}
