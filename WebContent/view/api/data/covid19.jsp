<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="www.api.data.Data"%>
<%@page import="www.key.Key"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Key key = new Key();
Data data = new Data();
StringBuffer sb = new StringBuffer();
LocalDate ld = LocalDate.now();
LocalDate pld = ld.minusDays(1);
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYMMdd");
String serviceKey = key.getKeys().get(Key.Kyes.DATA_COVID19_SERVICEKEY);
sb.setLength(0);
sb.append("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?");
sb.append("serviceKey=");
sb.append(serviceKey);
sb.append("&pageNo=1&");
sb.append("numOfRows=2&");
sb.append("startCreateDt=");
sb.append(dtf.format(pld));
sb.append("&endCreateDt=&");
sb.append(dtf.format(ld));

out.print(data.getXmlData(sb.toString()));
%>