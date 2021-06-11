package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.database.DBConnection;
import mvc.model.Notice;

/**
 * Servlet implementation class NoticeDController
 */
@WebServlet("/notice/detail")
public class NoticeDController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDController() {
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DBConnection dbconn = new DBConnection();
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs =	 null;	
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {			
			conn = dbconn.getConnection();
			String sql = "select * from notice WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			rs.next();
						
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				Date date = rs.getDate("r_date");
				int hit = rs.getInt("hit");
				String r_date = date.toString();
				String content = rs.getString("content");
				
				Notice notice = new Notice(id, title, writer, content, r_date, hit);
				request.setAttribute("notice", notice);
				
						
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
		request.getRequestDispatcher("/notice/detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
