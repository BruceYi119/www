package www.db.dto;

public class MystoryDTO {

	private String rownum = null;
	private String sno = null;
	private String content = null;
	private String writedate = null;
	private String updatedate = null;
	private String movietitle = null;

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getMovietitle() {
		return movietitle;
	}

	public void setMovietitle(String movietitle) {
		this.movietitle = movietitle;
	}

	@Override
	public String toString() {
		return "MemberDTO [rownum=" + rownum + ", sno=" + sno + ", content=" + content + ", writedate=" + writedate
				+ ", updatedate=" + updatedate + ", movietitle=" + movietitle + "]";
	}

	public String toString(boolean t) {
		return "rownum, sno, content, writedate, updatedate, movietitle";
	}
}