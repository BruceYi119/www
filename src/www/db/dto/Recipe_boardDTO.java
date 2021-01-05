package www.db.dto;

public class Recipe_boardDTO {
	
	private String rownum = null;
	private String rbno = null;
	private String name = null;
	private String pwd = null;
	private String title = null;
	private String rcategory = null;
	private String rname = null;
	private String ingredients = null;
	private String content = null;
	private String img = null;
	private String readnum = null;
	private String liked = null;
	private String writeday = null;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getRbno() {
		return rbno;
	}
	public void setRbno(String rbno) {
		this.rbno = rbno;
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
	public String getRcategory() {
		return rcategory;
	}
	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	@Override
	public String toString() {
		return "Recipe_boardDTO [rownum=" + rownum + ", rbno=" + rbno + ", name=" + name + ", pwd=" + pwd + ", title="
				+ title + ", rcategory=" + rcategory + ", rname=" + rname + ", ingredients=" + ingredients
				+ ", content=" + content + ", img=" + img + ", readnum=" + readnum + ", liked=" + liked + ", writeday="
				+ writeday + "]";
	}
	
	public String toString(boolean t) {
		return "rownum, rbno, name, pwd, title, rcategory, rname, ingredients, content, img, readnum, liked, writeday";
	}

}