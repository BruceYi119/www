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
String searchTxt = request.getParameter("search") != null ? request.getParameter("search") : "둘리";
String searchType = request.getParameter("searchType") != null ? request.getParameter("searchType") : "NEWS";
String searchTitle = request.getParameter("searchTitle") != null ? request.getParameter("searchTitle") : "뉴스";
String display = request.getParameter("display") != null ? request.getParameter("display") : nsapi.getDisplay() + "";
String json = nsapi.search(searchTxt, searchType);

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
		sb.append("<li class='image'>");

		for (JSONObject o : list)
			sb.append("<a href='" + o.get("link") + "' link='" + o.get("link") + "'><img src='" + o.get("thumbnail") + "' /></a>");

		sb.append("</li>");
		break;
	default:
		sb.append("<li>");
		sb.append("<dl>");

		for (JSONObject o : list) {
			sb.append("<dt><a href='" + o.get("link") + "'>" + o.get("title") + "</a></dt>");
			sb.append("<dd>" + o.get("description") + "</dd>");
		}

		sb.append("</dl>");
		sb.append("</li>");
		break;
};

sb.append("\" }");
out.print(sb.toString());
%>