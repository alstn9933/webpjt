package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class AjaxTest6Servlet
 */
@WebServlet(name = "AjaxTest6", urlPatterns = { "/ajaxTest6" })
public class AjaxTest6Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTest6Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> list = new ArrayList<User>();
		list.add(new User(1,"박민수1","서울1"));
		list.add(new User(2,"박민수2","서울2"));
		list.add(new User(3,"박민수3","서울3"));
		list.add(new User(4,"박민수4","서울4"));
		list.add(new User(5,"박민수5","서울5"));
		int userNum = Integer.parseInt(request.getParameter("userNum"));
		JSONArray userArr = new JSONArray();
		if(userNum >=1 && userNum<=5) {
			User u = list.get(userNum-1);
			JSONObject result = new JSONObject();
			result.put("userNo", u.getUserNo());
			result.put("userName", URLEncoder.encode(u.getUserName(),"utf-8"));
			result.put("userAddr", URLEncoder.encode(u.getUserAddr(), "utf-8"));
			userArr.add(result);
		}else {
			for(User u : list) {
				JSONObject result = new JSONObject();
				result.put("userNo", u.getUserNo());
				result.put("userName", URLEncoder.encode(u.getUserName(),"utf-8"));
				result.put("userAddr", URLEncoder.encode(u.getUserAddr(), "utf-8"));
				userArr.add(result);
			}
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(userArr);
		out.flush();//버퍼링 되어서 아직 기록되지 않은 데이터를 출력스트림에 모두 출력
		out.close();//출력되지 않은 데이터가 있으면 먼저 출력하고 스트림 종료
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
