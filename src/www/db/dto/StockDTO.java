package www.db.dto;

public class StockDTO {
	private String rownum = null;
	private String sno = null;
	private String title = null;
	private String siga = null;
	private String gijun = null;
	private String beadang = null;
	private String suik = null;
	private String beadang1 = null;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSiga() {
		return siga;
	}
	public void setSiga(String siga) {
		this.siga = siga;
	}
	public String getGijun() {
		return gijun;
	}
	public void setGijun(String gijun) {
		this.gijun = gijun;
	}
	public String getBeadang() {
		return beadang;
	}
	public void setBeadang(String beadang) {
		this.beadang = beadang;
	}
	public String getSuik() {
		return suik;
	}
	public void setSuik(String suik) {
		this.suik = suik;
	}
	public String getBeadang1() {
		return beadang1;
	}
	public void setBeadang1(String beadang1) {
		this.beadang1 = beadang1;
	}
	@Override
	public String toString() {
		return "StockDTO [rownum=" + rownum + ", sno=" + sno + ", title=" + title + ", siga=" + siga + ", gijun="
				+ gijun + ", beadang=" + beadang + ", suik=" + suik + ", beadang1=" + beadang1 + "]";
	}
	
	public String toString(boolean t) {
		return "rownum,sno,title,siga,gijun,beadang,suik,beadang1";
	}
	
}
