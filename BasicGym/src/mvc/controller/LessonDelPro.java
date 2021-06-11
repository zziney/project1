package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.database.DBConnection;

/**
 * Servlet implementation class LessonDelPro
 */
@WebServlet("/deleteLesson")
public class LessonDelPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonDelPro() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs =	 null;	
		String getid = request.getParameter("id");
		int l_id=Integer.parseInt(getid);
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from lesson WHERE l_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "delete from lesson WHERE l_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, l_id);
				pstmt.executeUpdate();
			}else 
				System.out.println("일치하는 강의가 없습니다");
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			try {
			if(rs!=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn !=null) conn.close();
				
			} catch (Exception e2) {
				e2.getMessage();
			}
		}
		response.sendRedirect("./lesson/editLessonList");
	}

}
