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

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import mvc.model.DAO;
import mvc.model.Lesson;

/**
 * Servlet implementation class LessonCon
 */
@WebServlet("/lesson.servlet")
public class LessonCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonCon() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//레슨등록(관리자모드)
    	String filename="";
    	String web_path="/resources/images/";
    	ServletContext applications = request.getServletContext();
    	String realFolder = applications.getRealPath(web_path);
    	//String realFolder ="C:\\jsp\\workspace\\BasicGym\\WebContent\\resources\\images" ;
    	int maxSize = 5 * 1024 * 1024;
    	String encType = "utf-8";
    	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
    	@SuppressWarnings("rawtypes")
    	Enumeration files =  multi.getFileNames();
    	String fname = (String)files.nextElement();
    	filename = multi.getFilesystemName(fname);
    	
			DAO dao=DAO.getInstance();
			Lesson lesson=new Lesson();
			
			int price1=Integer.parseInt(multi.getParameter("price1"));
			int price2=Integer.parseInt(multi.getParameter("price2"));
			int l_id = Integer.parseInt(multi.getParameter("l_id"));
			
			lesson.setL_id(l_id);
			lesson.setLesson(multi.getParameter("lesson"));
			lesson.setTrainer(multi.getParameter("trainer"));
			lesson.setTrainer_career(multi.getParameter("trainer_career"));
			lesson.setScheduler1(multi.getParameter("scheduler1"));
			lesson.setScheduler2(multi.getParameter("scheduler2"));
			lesson.setPrice1(price1);
			lesson.setPrice2(price2);
			lesson.setDescript(multi.getParameter("descript"));
			lesson.setFilename(filename);
											
			dao.insertLesson(lesson);
			response.setContentType("text/html; charset=utf-8");								
			RequestDispatcher rd=request.getRequestDispatcher("/lesson/regCompleted.jsp");
			rd.forward(request, response);
			}
    
    
	}


