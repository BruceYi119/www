package www.api.data;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;

public class Data {
	private JSONObject json;

	public JSONObject getXmlData(String uri) {
		try {
			URL url = new URL(uri);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			json = XML.toJSONObject(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return json;
	}

//	public static void main(String[] args) {
//		Data data = new Data();
//		StringBuffer sb = new StringBuffer();
//
//		sb.setLength(0);
//		sb.append("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?");
//		sb.append("serviceKey=y9OZ5IknnDqJ%2Fh8JC4EFpO%2FFpodQlQCfg87Wgy8hTeVGuW%2FGzeE8NlD8j3zXDwKiyqz2cstMO17oGqUEE8hL3w%3D%3D&");
//		sb.append("pageNo=1&");
//		sb.append("numOfRows=10&");
//		sb.append("startCreateDt=20200310&");
//		sb.append("endCreateDt=20200315&");
//
//		System.out.println(data.getXmlData(sb.toString()));
//	}

//	public JSONObject getXmlData(String uri) {
//		JSONObject json = null;
//
//		try {
//			URL url = new URL(uri);
//			
//			HttpURLConnection con = (HttpURLConnection)url.openConnection();
//			con.setRequestMethod("GET");
//			con.setConnectTimeout(3000);
//			con.setReadTimeout(3000);
//
//		    // 요청 방식 구하기
//		    System.out.println("getRequestMethod():" + con.getRequestMethod());
//		    // 응답 콘텐츠 유형 구하기
//		    System.out.println("getContentType():" + con.getContentType());
//		    // 응답 코드 구하기
//		    System.out.println("getResponseCode():"    + con.getResponseCode());
//		    // 응답 메시지 구하기
//		    System.out.println("getResponseMessage():" + con.getResponseMessage());
//
//		    // 응답 헤더의 정보를 모두 출력
//		    for (Map.Entry<String, List<String>> header : con.getHeaderFields().entrySet()) {
//		        for (String value : header.getValue()) {
//		            System.out.println(header.getKey() + " : " + value);
//		        }
//		    }
//
//		    // 응답 내용(BODY) 구하기        
//		    try (InputStream in = con.getInputStream();
//		            ByteArrayOutputStream out = new ByteArrayOutputStream()) {
//
//		        byte[] buf = new byte[1024 * 8];
//		        int length = 0;
//		        while ((length = in.read(buf)) != -1) {
//		            out.write(buf, 0, length);
//		        }
//
//		        json = XML.toJSONObject(new String(out.toByteArray(), "UTF-8"));
//		    }
//
//		    // 접속 해제
//		    con.disconnect();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return json;
//	}

}