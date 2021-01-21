package www.db.dto;

public class MymovielistDTO {

	private String rownum = null;
	private String mno = null;
	private String title= null;
	private String viewrating= null;
	private String salesrating = null;
	private String genre = null;
	private String runtime = null;
	private String releasedate = null;
	private String filmdirector = null;
	private String imgtitle = null;
	private String writedate = null;
	private String id = null;
	
	

	
	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getViewrating() {
		return viewrating;
	}

	public void setViewrating(String viewrating) {
		this.viewrating = viewrating;
	}

	public String getSalesrating() {
		return salesrating;
	}

	public void setSalesrating(String salesrating) {
		this.salesrating = salesrating;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}

	public String getFilmdirector() {
		return filmdirector;
	}

	public void setFilmdirector(String filmdirector) {
		this.filmdirector = filmdirector;
	}

	public String getImgtitle() {
		return imgtitle;
	}

	public void setImgtitle(String imgtitle) {
		this.imgtitle = imgtitle;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MemberDTO [rownum=" + rownum + ", mno=" + mno + ", title=" + title+ ", viewrating=" + viewrating + ", salesrating=" + salesrating + ", genre=" + genre + ", runtime=" + runtime
				+ ", releasedate=" + releasedate + ", filmdirector=" + filmdirector + ", imgtitle=" + imgtitle + ", writedate=" + writedate + ", id=" + id + "]";
	}

	public String toString(boolean t) {
		return "rownum, mno, title, viewrating, salesrating, genre, runtime, releasedate, filmdirector, imgtitle, writedate, id";
	}
}

