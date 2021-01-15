package www.html.header;

public class Header {

	private StringBuilder sb = new StringBuilder();
	private String coreBaseUrl = "/core/";
	private String baseCssUrl = "/view/css/";
	private String baseAdminCssUrl = "/admin/css/";
	private String baseJsUrl = "/view/js/";
	private String baseAdminJsUrl = "/admin/js/";
	private String[] coreCss = { "bootstrap-4.5.3/css/bootstrap.min.css" };
	private String[] css = { "global.css", "layout.css" };
	private String[] adminCss = { "global.css", "admin.css" };
	private String[] coreJs = { "jquery-3.5.1/jquery-3.5.1.min.js", "bootstrap-4.5.3/js/bootstrap.bundle.js", "axios-0.21.0/dist/axios.min.js" };
	private String[] js = { "global.js" };
	private String[] adminJs = { "admin.js" };
	private String title = "Doogle!";
	private String headerUrl = "/view/layout/header.jsp";

	public String getCss() {
		sb.setLength(0);

		for (String css : css)
			sb.append("<link rel=\"stylesheet\" href=\"" + baseCssUrl + css + "\" />\n");
		for (String css : coreCss)
			sb.append("<link rel=\"stylesheet\" href=\"" + coreBaseUrl + css + "\" />\n");

		return sb.toString();
	}

	public String getCss(String admin) {
		sb.setLength(0);

		for (String css : adminCss)
			sb.append("<link rel=\"stylesheet\" href=\"" + baseAdminCssUrl + css + "\" />\n");
		for (String css : coreCss)
			sb.append("<link rel=\"stylesheet\" href=\"" + coreBaseUrl + css + "\" />\n");

		return sb.toString();
	}

	public String getJs() {
		sb.setLength(0);

		for (String js : coreJs)
			sb.append("<script defer src=\"" + coreBaseUrl + js + "\"></script>\n");
		for (String js : js)
			sb.append("<script defer src=\"" + baseJsUrl + js + "\"></script>\n");

		return sb.toString();
	}

	public String getJs(String admin) {
		sb.setLength(0);

		for (String js : coreJs)
			sb.append("<script defer src=\"" + coreBaseUrl + js + "\"></script>\n");
		for (String js : adminJs)
			sb.append("<script defer src=\"" + baseAdminJsUrl + js + "\"></script>\n");

		return sb.toString();
	}

	public String getTitle() {
		return title;
	}

	public String getHeaderUrl() {
		return headerUrl;
	}

}