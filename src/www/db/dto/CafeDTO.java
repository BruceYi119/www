package www.db.dto;




public class CafeDTO {
	
	private String rownum=null;
	private String cno=null;
	private String name=null;
	private String title=null;
	private String writype=null;
	private String animal=null;
	private String content=null;
	private String fname=null;
	private String readnum=null;
	private String liked=null;
	private String fimsi=null;
	private String writeday=null;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWritype() {
		return writype;
	}
	public void setWritype(String writype) {
		this.writype = writype;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
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
	public String getReadnum() {
		return readnum;
	}
	public void setReadnum(String readnum) {
		this.readnum = readnum;
	}
	public String getLiked() {
		return liked;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
	public String getFimsi() {
		return fimsi;
	}
	public void setFimsi(String fimsi) {
		this.fimsi = fimsi;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	@Override
	public String toString() {
		return "CafeDTO [rownum=" + rownum + ", cno=" + cno + ", name=" + name + ", title=" + title + ", writype=" + writype
				+ ", animal=" + animal + ", content=" + content + ", fname=" + fname + ", readnum=" + readnum
				+ ", liked=" + liked + ", fimsi=" + fimsi + ", writeday=" + writeday + "]";
	}

	public String toString(boolean t) {
		return "rownum, cno, name, title, writype, animal, content, fname, readnum, liked, fimsi, writeday";
	}
}
