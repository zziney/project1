package mvc.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.DAO;
import mvc.model.Lesson;


public class BasicController extends HttpServlet{
	 private static final long serialVersionUID=1L;
	 static final int LISTCOUNT=5;
	 
	 public BasicController() {
		// TODO Auto-generated constructor stub
	}
		
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	
	}
				 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		
			
			
			
		
			
	}

	
	

	
		
}
		
		
	


//			public void getlistLesson(HttpServletRequest request) {
//								
//				DAO dao = DAO.getInstance();
//				List<Lesson> lessonlist = new ArrayList<Lesson>();
//				
//				lessonlist = dao.getLessonList();
//				
//				request.setAttribute("lessonlist", lessonlist);
//										
//			}
//	
			
	
	
			
			//회원가입 입력하기
			
			
			//�Լ�2) �α��ν� ȸ�����̵� �������
			/*
			 * public void loginMemberName(HttpServletRequest request) {
			 * 
			 * DAO dao=DAO.getInstance(); String id=request.getParameter("id");
			 * 
			 * //String name=request.getParameter("name"); HttpSession
			 * session=request.getSession();
			 * 
			 * if(dao.getMemberName(id) ==true) { session.setAttribute("id", id); } }
			 */
		
		

			
	 

	
		
		

	

