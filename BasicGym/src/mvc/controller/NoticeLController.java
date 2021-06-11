package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.database.DBConnection;
import mvc.model.Notice;

/**
 * Servlet implementation class NoticeListController
 */
@WebServlet("/notice/list")
public class NoticeLController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeLController() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		DBConnection dbconn = new DBConnection();
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs =	 null;	
		List<Notice> list = new ArrayList<Notice>();
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring(contextPath.length());
		
		if(command.equals("/notice/list")) {
		try {			
			conn = dbconn.getConnection();
			String sql = "select * from notice";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				Date date = rs.getDate("r_date");
				int hit = rs.getInt("hit");
				String r_date = date.toString();
				String content = null;
				
				Notice notice = new Notice(id, title, writer, content, r_date, hit);
				list.add(notice);
				
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		finally {
			try {
			if(rs!=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn !=null) conn.close();
				
			} catch (Exception e2) {
				e2.getMessage();
			}
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/notice/list.jsp").forward(request, response);
		}
		
		
		
		if (command.equals("/notice/detail")) {
			RequestDispatcher rd = request.getRequestDispatcher("/detail.jsp");
			rd.forward(request, response);
			//ctrlDetail(request);
		}
		
		
	}

	//private void ctrlDetail(HttpServletRequest request) {
		
	//}

}
