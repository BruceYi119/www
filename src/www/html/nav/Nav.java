package www.html.nav;

public class Nav {

	private StringBuffer sb = new StringBuffer();
	private String baseUrl = "/view/";
	private String[] urlName = { "카카오맵", "번역기","강민규", "김희수", "박용순", "정지원", "진우람", "핸리" };
	private String[] url = { "api/kakao/map.jsp", "wooram/wooramtrans.jsp", "minkyu/minkyu.jsp", "heesoo/heesoo.jsp", "yongsoon/yongsoon.jsp", "jiwon/jiwon.jsp", "wooram/wooram.jsp", "henry/henry.jsp" };

	public String getMenu() {
		sb.setLength(0);

		sb.append("<ul id=\"menu\">\n");
		
		for (int i=0;i < url.length;i++)
			sb.append("<li><a href=\"" + baseUrl + url[i] + "\">" + urlName[i] + "</a></li>\n");

		sb.append("</ul>\n");
		
		return sb.toString();
	}

}