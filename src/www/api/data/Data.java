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
//		Key key = new Key();
//		Data data = new Data();
//		StringBuffer sb = new StringBuffer();
//		String serviceKey = key.getKeys().get(Keys.DATA_COVID19_SERVICEKEY);
//
//		sb.setLength(0);
//		sb.append("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?");
//		sb.append("serviceKey=");
//		sb.append(serviceKey);
//		sb.append("&pageNo=1&");
//		sb.append("numOfRows=10&");
//		sb.append("startCreateDt=20200310&");
//		sb.append("endCreateDt=20200315&");
//
//		System.out.println(data.getXmlData(sb.toString()));
//	}

}