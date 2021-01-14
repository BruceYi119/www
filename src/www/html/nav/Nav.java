package www.html.nav;

public class Nav {

	private StringBuilder sb = new StringBuilder();
	private String baseUrl = "/view/";
	private String[] urlName = { "카카오맵", "달력", "번역기", "금융(투자정보)", "갈비대첩", "뚝딱조립PC", "레시피", "애완동물카페", "핸리" };
	private String[] url = { "api/kakao/map.jsp", "calendar/calendar.jsp", "wooram/wooramtrans.jsp", "minkyu/minkyu.jsp", "heesoo/main/index.jsp", "yongsoon/pcEstimate.jsp", "jiwon/recipe_list.jsp", "wooram/list.jsp", "henry/henry.jsp" };

	public String getMenu() {
		sb.setLength(0);

		sb.append("<ul id=\"menu\">\n");
		
		for (int i=0;i < url.length;i++)
			sb.append("<li><a href=\"" + baseUrl + url[i] + "\">" + urlName[i] + "</a></li>\n");

		sb.append("</ul>\n");
		
		return sb.toString();
	}

}