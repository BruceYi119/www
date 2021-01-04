package www.api.naver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import www.key.Key;

public class Search {

	private Map<String, String> apiUrl = new HashMap<>();
	public enum api { INTELLECTUALS; }
	private String clientId;				//애플리케이션 클라이언트 아이디값
	private String clientSecret;			//애플리케이션 클라이언트 시크릿값
	private String baseUrl = "https://openapi.naver.com/v1/search/";
	private int display = 100;

	{
		Key key = new Key();
		clientId = key.getKeys().get(Key.Kyes.NAVER_SEARCH_ID);
		clientSecret = key.getKeys().get(Key.Kyes.NAVER_SEARCH_SECRET);

		apiUrl.put("NEWS", "news.json");
		apiUrl.put("BLOG", "blog");
		apiUrl.put("BOOK", "book.json");
		apiUrl.put("ENCYC", "encyc.json");
		apiUrl.put("MOVIE", "movie.json");
		apiUrl.put("CAFE", "cafearticle.json");
		apiUrl.put("KIN", "kin.json");
		apiUrl.put("LOCAL", "local.json");
		apiUrl.put("ERRATA", "errata.json");
		apiUrl.put("WEBKR", "webkr.json");
		apiUrl.put("IMAGE", "image");
		apiUrl.put("SHOP", "shop.json");
		apiUrl.put("DOC", "doc.json");
	}

	public static void main(String[] args) {
		Search s = new Search();

		System.out.println(s.search("파이썬", "BOOK"));
	}

	public int getDisplay() {
		return display;
	}

	public String search(String searchTxt, String api) {
		String text = null;

		try {
			text = URLEncoder.encode(searchTxt, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}

		String apiURL = baseUrl + apiUrl.get(api) + "?query=" + text + "&display=" + display;	// json 결과
		//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;			// xml 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL,requestHeaders);

		return responseBody;		
	}

	public String search(String searchTxt, String api, int page) {
		int start = page != 1 ? page * display - display + 1 : page;
		String text = null;

		try {
			text = URLEncoder.encode(searchTxt, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}

		String apiURL = baseUrl + apiUrl.get(api) + "?query=" + text + "&display=" + display + "&start=" + start;
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL,requestHeaders);
		
		return responseBody;		
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);

		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {	// 정상 호출
				return readBody(con.getInputStream());
			} else {											// 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}
	
	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	
	private static String readBody(InputStream body){
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}