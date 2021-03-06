package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet(name = "Movie", urlPatterns = { "/movie" })
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String targetDt = request.getParameter("targetDt");//조회할 날짜
		String key  = "0a090972c34bf4413f54246105a5ac11";//나의 키값
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		String result = Jsoup.connect(url).data("key",key).data("targetDt",targetDt).userAgent("Mozilla").ignoreContentType(true).execute().body();
		JsonObject movieInfo1 = new JsonObject();
		JsonParser parser = new JsonParser();
		movieInfo1 = (JsonObject)parser.parse(result);
		JsonObject movieInfo2 = (JsonObject)movieInfo1.get("boxOfficeResult");
		JsonArray arr = (JsonArray)movieInfo2.get("dailyBoxOfficeList");
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(arr);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
