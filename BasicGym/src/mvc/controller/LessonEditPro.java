package mvc.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.DAO;
import mvc.model.Lesson;

/**
 * Servlet implementation class EditLesson
 */
@WebServlet("/editLessonPro")
public class LessonEditPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonEditPro() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//레슨등록수정(관리자모드)
    	String filename="";
    	String web_path="/resources/images/";
    	ServletContext applications = request.getServletContext();
    	String realFolder = applications.getRealPath(web_path);
    	int maxSize = 5 * 1024 * 1024;
    	String encType = "utf-8";
    	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
    	@SuppressWarnings("rawtypes")
    	Enumeration files =  multi.getFileNames();
    	String fname = (String)files.nextElement();
    	filename = multi.getFilesystemName(fname);
    	
			DAO dao=DAO.getInstance();
			Lesson ls=new Lesson();
			
			int price1=Integer.parseInt(multi.getParameter("price1"));
			int price2=Integer.parseInt(multi.getParameter("price2"));
			int l_id = Integer.parseInt(multi.getParameter("l_id"));
			
			ls.setL_id(l_id);
			ls.setLesson(multi.getParameter("lesson"));
			ls.setTrainer(multi.getParameter("trainer"));
			ls.setTrainer_career(multi.getParameter("trainer_career"));
			ls.setScheduler1(multi.getParameter("scheduler1"));
			ls.setScheduler2(multi.getParameter("scheduler2"));
			ls.setPrice1(price1);
			ls.setPrice2(price2);
			ls.setDescript(multi.getParameter("descript"));
			ls.setFilename(filename);
											
			dao.updateLesson(ls);
			response.setContentType("text/html; charset=utf-8");								
			response.sendRedirect("./lesson/editLessonView");
			}
		
	

}
