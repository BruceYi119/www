package www.jinwooram.test;

public class TestDTO {

	private String tno = null;
	private String content = null;
	
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "TestDTO [tno=" + tno + ", content=" + content + "]";
	}
}