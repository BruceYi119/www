package www.db.dto;

public class StockBoardDTO {
	private String rownum = null;
	private String sbno = null;
	private String name = null;
	private String pwd = null;
	private String title = null;
	private String content = null;
	private String fname = null;
	private String writeday = null;
	private String readnum = null;
	private String good = null;
	private String bad = null;
	private String sung = null;
	private String kind = null;

	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getSbno() {
		return sbno;
	}
	public void setSbno(String sbno) {
		this.sbno = sbno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getReadnum() {
		return readnum;
	}
	public void setReadnum(String readnum) {
		this.readnum = readnum;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	public String getSung() {
		return sung;
	}
	public void setSung(String sung) {
		this.sung = sung;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	@Override
	public String toString() {
		return "StockBoardDTO [rownum=" + rownum + ", sbno=" + sbno + ", name=" + name + ", pwd=" + pwd + ", title="
				+ title + ", content=" + content + ", fname=" + fname + ", writeday=" + writeday + ", readnum="
				+ readnum + ", good=" + good + ", bad=" + bad + ", sung=" + sung + ", kind=" + kind + "]";
	}

	public String toString(boolean t) {
		return "rownum, sbno, name, pwd, title, content, fname, writeday, readnum, good, bad, sung, kind";
	}

}