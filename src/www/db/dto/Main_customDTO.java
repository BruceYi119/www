package www.db.dto;

public class Main_customDTO {

	private String rownum = null;
	private String mcno = null;
	private String cpu = null;
	private String vga = null;
	private String power = null;
	private String mb = null;
	private String ram1 = null;
	private String ram2 = null;
	private String hdd = null;
	private String ssd = null;
	private String price = null;
	private String cpu_price = null;
	private String vga_price = null;
	private String power_price = null;
	private String mb_price = null;
	private String ram1_price = null;
	private String ram2_price = null;
	private String hdd_price = null;
	private String ssd_price = null;
	private String pw = null;

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getCpu_price() {
		return cpu_price;
	}

	public void setCpu_price(String cpu_price) {
		this.cpu_price = cpu_price;
	}

	public String getVga_price() {
		return vga_price;
	}

	public void setVga_price(String vga_price) {
		this.vga_price = vga_price;
	}

	public String getPower_price() {
		return power_price;
	}

	public void setPower_price(String power_price) {
		this.power_price = power_price;
	}

	public String getMb_price() {
		return mb_price;
	}

	public void setMb_price(String mb_price) {
		this.mb_price = mb_price;
	}

	public String getRam1_price() {
		return ram1_price;
	}

	public void setRam1_price(String ram1_price) {
		this.ram1_price = ram1_price;
	}

	public String getRam2_price() {
		return ram2_price;
	}

	public void setRam2_price(String ram2_price) {
		this.ram2_price = ram2_price;
	}

	public String getHdd_price() {
		return hdd_price;
	}

	public void setHdd_price(String hdd_price) {
		this.hdd_price = hdd_price;
	}

	public String getSsd_price() {
		return ssd_price;
	}

	public void setSsd_price(String ssd_price) {
		this.ssd_price = ssd_price;
	}

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
		return "Main_customDTO [rownum=" + rownum + ", mcno=" + mcno + ", cpu=" + cpu + ", vga=" + vga + ", power="
				+ power + ", mb=" + mb + ", ram1=" + ram1 + ", ram2=" + ram2 + ", hdd=" + hdd + ", ssd=" + ssd
				+ ", price=" + price + ", cpu_price=" + cpu_price + ", vga_price=" + vga_price + ", power_price="
				+ power_price + ", mb_price=" + mb_price + ", ram1_price=" + ram1_price + ", ram2_price=" + ram2_price
				+ ", hdd_price=" + hdd_price + ", ssd_price=" + ssd_price + "]";
	}

	public String toString(boolean t) {
		return "rownum, mcno, cpu, vga, power, mb, ram1, ram2, hdd, ssd, price";
	}

}