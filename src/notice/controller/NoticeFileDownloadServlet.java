package notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.management.resource.internal.inst.FileInputStreamRMHooks;

/**
 * Servlet implementation class NoticeFileDownloadServlet
 */
@WebServlet(name = "NoticeFileDownload", urlPatterns = { "/noticeFileDownload" })
public class NoticeFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String filename = request.getParameter("filename");
		String filepath = request.getParameter("filepath");
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"upload/notice/";
		//파일이랑 서블릿연결
		FileInputStream fis = new FileInputStream(saveDirectory+filepath);//파일을 불러오기 위한 스트림 생성
		BufferedInputStream bis = new BufferedInputStream(fis);//속도를 위한 보조스트림 연결
		ServletOutputStream sos = response.getOutputStream();//파일을 내보내기 위한 스트림 생성
		BufferedOutputStream bos = new BufferedOutputStream(sos);//속도를 위한 보조스트림 연결
		String resFilename = "";
		//브라우저가 IE인지 확인
		boolean bool = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
		if(bool) {//IE인경우
			resFilename = URLEncoder.encode(filename, "UTF-8");
			resFilename = resFilename.replaceAll("\\\\", "%20");
		}else {//그외 브라우저인경우
			resFilename = new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		}
		//파일 다운로드를 위한 HTTP Header설정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		int read = -1;
		while((read = bis.read()) != -1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
