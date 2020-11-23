package www.html.header;

public class Header {

	private StringBuffer sb = new StringBuffer();
	private String coreBaseUrl = "/core/";
	private String baseCssUrl = "/view/css/";
	private String baseJsUrl = "/view/js/";
	private String[] coreCss = { "bootstrap-4.5.3/css/bootstrap.min.css" };
	private String[] css = { "global.css", "layout.css" };
	private String[] coreJs = { "jquery-3.5.1/jquery-3.5.1.min.js", "bootstrap-4.5.3/js/bootstrap.bundle.js" };
	private String[] js = { "test.js" };

	public String getCss() {
		sb.setLength(0);

		for (String css : css)
			sb.append("<link rel=\"stylesheet\" href=\"" + baseCssUrl + css + "\" />\n");
		for (String css : coreCss)
			sb.append("<link rel=\"stylesheet\" href=\"" + coreBaseUrl + css + "\" />\n");

		return sb.toString();
	}

	public String getJs() {
		sb.setLength(0);

		for (String js : coreJs)
			sb.append("<script defer src=\"" + coreBaseUrl + js + "\"></script>\n");
		for (String js : this.js)
			sb.append("<script defer src=\"" + baseJsUrl + js + "\"></script>\n");

		return sb.toString();
	}

}