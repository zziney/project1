package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.database.DBConnection;
import mvc.model.Lesson;

/**
 * Servlet implementation class LessonEditView
 */
@WebServlet("/lesson/editLessonView")
public class LessonEditView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonEditView() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String getid = request.getParameter("id");
		int l_id = Integer.parseInt(getid);
		try {
			conn = DBConnection.getConnection(); 
			String sql="SELECT * FROM lesson WHERE l_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l_id);
			rs = pstmt.executeQuery();			
			rs.next();	
				String lesson = rs.getString("lesson");
				String trainer = rs.getString("trainer");
				String trainer_career = rs.getString("trainer_career");
				String scheduler1 = rs.getString("scheduler1");
				String scheduler2 = rs.getString("scheduler2");
				int price1 = rs.getInt("price1");
				int price2 = rs.getInt("price2");
				String descript = rs.getString("descript");
				String filename = rs.getString("filename");
				
				Lesson ls=new Lesson(l_id,lesson, trainer, trainer_career, scheduler1, scheduler2, price1, price2, descript, filename);			
							
				request.setAttribute("ls", ls);
					
		}catch(Exception ex) {
			System.out.println("showLesson() 오류입니다 :"+ex);
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		
		request.getRequestDispatcher("/lesson/editLessonView.jsp").forward(request, response);
	}

}
