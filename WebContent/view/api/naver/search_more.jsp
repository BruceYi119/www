<%@page import="www.api.naver.Search"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Search nsapi = new Search();
StringBuilder sb = new StringBuilder();
ArrayList<JSONObject> list = new ArrayList();

request.setCharacterEncoding("utf-8");
String pagev = request.getParameter("page") != null ? request.getParameter("page") : "1";
String searchTxt = request.getParameter("search") != null ? request.getParameter("search") : "둘리";
String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "NEWS";
String display = request.getParameter("display") != null ? request.getParameter("display") : nsapi.getDisplay() + "";

String json = nsapi.search(searchTxt, searchType, Integer.parseInt(pagev));
JSONObject jo = new JSONObject(json);

String total = !searchType.equals("ERRATA")? "(" + jo.get("total").toString() + ")" : "";
String errata = "";

if (searchType.equals("ERRATA")) {
	errata = jo.get("errata").toString();
} else {
	JSONArray jsonList = (JSONArray)jo.get("items");
	Iterator it = jsonList.iterator();

	while(it.hasNext())
		list.add((JSONObject)it.next());
}

sb.append("{ \"html\": \"");

switch(searchType) {
	case "BOOK":
		break;
	case "MOVIE":
		break;
	case "LOCAL":
		break;
	case "ERRATA":
		break;
	case "IMAGE":
		for (JSONObject o : list) {
			sb.append("<li class='image'>");
			sb.append("<a href='" + o.get("link") + "' link='" + o.get("link") + "'><img src='" + o.get("thumbnail") + "' /></a>");
			sb.append("</li>");
		}
		break;
	default:
		for (JSONObject o : list) {
			sb.append("<li>");
			sb.append("<dl>");
			sb.append("<dt><a href='" + o.get("link") + "' target='_blank'>" + o.get("title") + "</a></dt>");
			sb.append("<dd>" + o.get("description") + "</dd>");
			sb.append("</dl>");
			sb.append("</li>");
		}
		break;
};

// sb.append("\" }");
sb.append("\", \"page\": " + pagev + " }");
out.print(sb.toString());
%>