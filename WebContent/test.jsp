<%@page import="www.key.Key.Keys"%>
<%@page import="www.key.Key"%>
<%@page import="org.json.JSONObject"%>
<%@page import="www.api.data.Data"%>
<%
Key key = new Key();
Data data = new Data();
StringBuffer sb = new StringBuffer();
String serviceKey = key.getKeys().get(Keys.DATA_COVID19_SERVICEKEY);

sb.setLength(0);
sb.append("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?");
sb.append("serviceKey=");
sb.append(serviceKey);
sb.append("&pageNo=1&");
sb.append("numOfRows=10&");
sb.append("startCreateDt=20200310&");
sb.append("endCreateDt=20200315&");

JSONObject json = data.getXmlData(sb.toString());
%>
<%=json%>