package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import mvc.model.DAO;
import mvc.model.NewMember;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member.servlet")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
    	
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
		String action = request.getParameter("action");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//신규회원가입(액션)	
		if (action.equals("register")) {
			regiNewmember(request);
			RequestDispatcher rd=request.getRequestDispatcher("/member/registerResult.jsp");
			rd.forward(request, response);
		}
		
		//회원로그인 확인
		else if(action.equals("login")) {
			String m_id = request.getParameter("m_id");
			int result =loginMember(request);
			request.setAttribute("result", result);
			HttpSession session = request.getSession();
			session.setAttribute("m_id", m_id);
			RequestDispatcher rd=request.getRequestDispatcher("/member/loginResult.jsp");
			rd.forward(request, response);
		}
			
		}
	
	//loginMember
	public int loginMember(HttpServletRequest request) {
		// TODO Auto-generated method stub
		DAO dao = DAO.getInstance();
		String m_id=request.getParameter("m_id");
		String m_pw=request.getParameter("m_pw");
		int result = dao.loginConfirm(m_id, m_pw);
		System.out.println("건너온result"+result);
		System.out.println(m_id);
		System.out.println(m_pw);
		return result;
		 
		
		
	}
	

	//regiNewmember
	public void regiNewmember(HttpServletRequest request) {
		DAO dao = DAO.getInstance();
		NewMember mb = new NewMember();		
		mb.setM_id(request.getParameter("m_id"));
		mb.setM_name(request.getParameter("m_name"));
		mb.setM_pw(request.getParameter("m_pw"));
		mb.setP_number(request.getParameter("p_number"));
		mb.setE_address1(request.getParameter("e_address1"));
		mb.setE_address2(request.getParameter("e_address2"));		
		dao.insertMember(mb);
		
	}
		
				
}
