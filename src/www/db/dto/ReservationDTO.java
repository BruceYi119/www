package www.db.dto;

import java.sql.Date;

public class ReservationDTO {

	private int rno;
	private String rdate = null;
	private String rtime = null;
	private String rname = null;
	private String rphone = null;
	private int radult_cnt;
	private int rchild_cnt;
	private String reat = null;
	private String rbigo = null;
	private int rchk;
	private Date rwritedate = null;
	public static final String[] TimeBtn= {"1130","1200","1230","1300","1330","1400","1430","1500","1530","1600","1630","1700","1730","1800","1830","1900","1930","2000"};

	public static String[] getTimebtn() {
		return TimeBtn;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRtime() {
		return rtime;
	}

	public void setRtime(String rtime) {
		this.rtime = rtime;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRphone() {
		return rphone;
	}

	public void setRphone(String rphone) {
		this.rphone = rphone;
	}

	public int getRadult_cnt() {
		return radult_cnt;
	}

	public void setRadult_cnt(int radult_cnt) {
		this.radult_cnt = radult_cnt;
	}

	public int getRchild_cnt() {
		return rchild_cnt;
	}

	public void setRchild_cnt(int rchild_cnt) {
		this.rchild_cnt = rchild_cnt;
	}

	public String getReat() {
		return reat;
	}

	public void setReat(String reat) {
		this.reat = reat;
	}

	public String getRbigo() {
		return rbigo;
	}

	public void setRbigo(String rbigo) {
		this.rbigo = rbigo;
	}

	public int getRchk() {
		return rchk;
	}

	public void setRchk(int rchk) {
		this.rchk = rchk;
	}

	public Date getRwritedate() {
		return rwritedate;
	}

	public void setRwritedate(Date rwritedate) {
		this.rwritedate = rwritedate;
	}

	@Override
	public String toString() {
		return "ReservationDTO [rno=" + rno + ", rdate=" + rdate + ", rtime=" + rtime + ", rname=" + rname + ", rphone=" + rphone
				+ ", radult_cnt=" + radult_cnt + ", rchild_cnt=" + rchild_cnt + ", reat=" + reat + ", rbigo=" + rbigo
				+ ", rchk=" + rchk + ", rwritedate=" + rwritedate + "]";
	}

	public String toString(boolean t) {
		return "rno, rdate, rtime, rname, rphone, radult_cnt, rchild_cnt, reat, rbigo, rchk, rwritedate";
	}

}