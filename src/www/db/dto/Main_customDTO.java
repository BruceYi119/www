package www.db.dto;

public class Main_customDTO {

	private String rownum  = null;
	private String mcno  = null;
	private String cpu  = null;
	private String vga  = null;
	private String power  = null;
	private String mb  = null;
	private String ram1  = null;
	private String ram2  = null;
	private String hdd  = null;
	private String ssd  = null;
	private String price  = null;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getMcno() {
		return mcno;
	}
	public void setMcno(String mcno) {
		this.mcno = mcno;
	}
	public String getCpu() {
		return cpu;
	}
	public void setCpu(String cpu) {
		this.cpu = cpu;
	}
	public String getVga() {
		return vga;
	}
	public void setVga(String vga) {
		this.vga = vga;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getMb() {
		return mb;
	}
	public void setMb(String mb) {
		this.mb = mb;
	}
	public String getRam1() {
		return ram1;
	}
	public void setRam1(String ram1) {
		this.ram1 = ram1;
	}
	public String getRam2() {
		return ram2;
	}
	public void setRam2(String ram2) {
		this.ram2 = ram2;
	}
	public String getHdd() {
		return hdd;
	}
	public void setHdd(String hdd) {
		this.hdd = hdd;
	}
	public String getSsd() {
		return ssd;
	}
	public void setSsd(String ssd) {
		this.ssd = ssd;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Main_customDTO [rownum=" + rownum + ", mcno=" + mcno + ", cpu=" + cpu + ", vga=" + vga + ", power=" + power + ", mb=" + mb
				+ ", ram1=" + ram1 + ", ram2=" + ram2 + ", hdd=" + hdd + ", ssd=" + ssd + ", price=" + price + "]";
	}
	
	public String toString(boolean t) {
		return "rownum, mcno, cpu, vga, power, mb, ram1, ram2, hdd, ssd, price";
	}

}