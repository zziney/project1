package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import mvc.database.DBConnection;



public class DAO {
			
	private static DAO instance;
	private ArrayList<Lesson> listOfLesson = new ArrayList<Lesson>();	
	public static DAO getInstance() {
		if(instance == null)
			instance = new DAO();
		return instance;
	}
	
	
	
	//������������ ��������
		public  Lesson getLessonName(String lesson) {
			
			Lesson lessonName=null;
			
			for(int i=0; i<listOfLesson.size(); i++) {
				Lesson lesson1=listOfLesson.get(i);
				if(lesson1 !=null && lesson1.getLesson() !=null  && lesson1.getLesson().equals(lesson1)) {
					lessonName = lesson1;
					break;
				}
			}
			return lessonName;
				
		}
	
	
		
	
	//메인페이지 레슨리스트 쇼업
	public ArrayList<Lesson> showLesson() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql;				
		sql="SELECT * FROM lesson";
		ArrayList<Lesson> list=new ArrayList<Lesson>();				
		try {
			conn = DBConnection.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			
			while(rs.next()) {		
				Lesson lesson=new Lesson();
				lesson.setL_id(rs.getInt("l_id"));
				lesson.setLesson(rs.getString("lesson"));
				lesson.setTrainer(rs.getString("trainer"));
				lesson.setTrainer_career(rs.getString("trainer_career"));
				lesson.setScheduler1(rs.getString("scheduler1"));
				lesson.setScheduler2(rs.getString("scheduler2"));
				lesson.setPrice1(rs.getInt("price1"));
				lesson.setPrice2(rs.getInt("price2"));
				lesson.setDescript(rs.getString("descript"));
				lesson.setFilename(rs.getString("filename"));
				list.add(lesson);				
		}			
			return list;
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
		return null;
	}
	
	public Lesson showLessonById(int l_id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql;
		sql="SELECT * FROM lesson WHERE l_id=?";
		try {
			conn = DBConnection.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, l_id);
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {		
				String lesson = rs.getString("lesson");
				String trainer = rs.getString("trainer");
				String trainer_career = rs.getString("trainer_career");
				String scheduler1 = rs.getString("scheduler1");
				String scheduler2 = rs.getString("scheduler2");
				int price1 = rs.getInt("price1");
				int price2 = rs.getInt("price2");
				String descript = rs.getString("descript");
				String filename = rs.getString("filename");
				Lesson ls=new Lesson(l_id, lesson, trainer, trainer_career, scheduler1, scheduler2, price1, price2, descript, filename);
				return ls;
			}			
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
		return null;

	}
								
		
	//레슨신규등록(관리자모드)
	public void insertLesson(Lesson lesson) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
		conn=DBConnection.getConnection();				
		String sql="insert into lesson values(?,?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, lesson.getL_id());
		pstmt.setString(2, lesson.getLesson());
		pstmt.setString(3, lesson.getTrainer());
		pstmt.setString(4, lesson.getTrainer_career());
		pstmt.setString(5, lesson.getScheduler1());
		pstmt.setString(6, lesson.getScheduler2());
		pstmt.setInt(7, lesson.getPrice1());
		pstmt.setInt(8, lesson.getPrice2());
		pstmt.setString(9, lesson.getDescript());
		pstmt.setString(10,lesson.getFilename());
		pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("insertLesson() 오류메세지:" + ex);
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
	}
	
	//레슨등록 수정하기(관리자모드)
		@SuppressWarnings("resource")
		public void updateLesson(Lesson ls) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int l_id = ls.getL_id();
			try {
			conn=DBConnection.getConnection();				
			String sql="select * from lesson where l_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, l_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				sql="update lesson set lesson=?, trainer=?, trainer_career=?, scheduler1=?, scheduler2=?, price1=?, price2=?, descript=?, filename=? WHERE l_id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, ls.getL_id());
				pstmt.setString(2, ls.getLesson());
				pstmt.setString(3, ls.getTrainer());
				pstmt.setString(4, ls.getTrainer_career());
				pstmt.setString(5, ls.getScheduler1());
				pstmt.setString(6, ls.getScheduler2());
				pstmt.setInt(7, ls.getPrice1());
				pstmt.setInt(8, ls.getPrice2());
				pstmt.setString(9, ls.getDescript());
				pstmt.setString(10,ls.getFilename());
				pstmt.executeUpdate();
			}
			
			}catch(Exception ex) {
				System.out.println("updateLesson() 오류메세지:" + ex.getMessage());
			}finally {
				try {
					if(rs != null)
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}catch(Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}
			}
		}
	
	
	
	//회원가입 등록시키기
	public void insertMember(NewMember newMember){
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		try {
		conn=DBConnection.getConnection();				
		String sql="insert into membertable values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);		
		pstmt.setString(1, newMember.getM_id());
		pstmt.setString(2, newMember.getM_name());
		pstmt.setString(3, newMember.getM_pw());
		pstmt.setString(4, newMember.getP_number());
		pstmt.setString(5, newMember.getE_address1());
		pstmt.setString(6, newMember.getE_address2());			
		pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("insertMember() Error:" + ex);
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
	}
	
	
	//회원로그인확인하기
	public  int loginConfirm(String m_id, String m_pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		String r_pw = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select m_id, m_pw from membertable where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				r_pw=rs.getString("m_pw");
				if (r_pw.equals(m_pw)) result = 1;
				else 							result = 0;
				}System.out.println("DBresult값:"+result);
				return result;
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			try { 
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.getMessage();
			}
		}
		System.out.println("m_pw비번"+m_pw);
		System.out.println("r_pw비번"+r_pw);
		System.out.println("result="+result);
		return result;
	}
	
	//회원아이디값 DB에서 갖고오기
	public String getUserId(String m_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userID="";
		try {
			conn = DBConnection.getConnection();
			String sql = "select m_id from membertable where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userID = rs.getString("m_id");
				return userID;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}finally {
			try { 
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.getMessage();
			}
		}
		return userID;
	}

	//�α������� �� DB(������̺�)�ΰ��� ���̵�(�ش��ϴ� �̸�)��������
	//DTO���� ������(�Լ�1)  DB�� ������ Ȯ�� �� �α��θ���Ʈ��������
	public Boolean getMemberName(String id) { //����Ÿ�� ���� ���̵� ���� �����ϰ�
		
		Connection conn = null;						//���ϰ���String �̴�
		PreparedStatement pstmt = null;
		ResultSet rs = null;						//����� ������ �ʱ�ȭ
				
		String sql = "select * from member where id=?"; //DB���� ���̵�,pw ����ͼ� sql�� ����
		//String name=null; 						//name���� �ʱ�ȭ
		Boolean result=false;
		//ArrayList<DTO> list = new ArrayList<DTO>(); //DTO����Ʈ ����
		
		try {
			conn=DBConnection.getConnection(); //DB���Ͷ� ����						
			pstmt=conn.prepareStatement(sql); //sql�̿��ؼ� ������Ʈ��Ʈ ����, ����
			pstmt.setString(1, id); //������Ʈ��Ʈ�� 1����(�ε���)�� id(����)�� �Է½��Ѷ�
			rs = pstmt.executeQuery(); //������Ʈ��Ʈ���� �������� ���� ����,rs����
			
			/*DTO dto=new DTO();		//
			dto.setId(rs.getString("id"));
			dto.setPassword(rs.getString("password"));
			dto.setName(rs.getString("name"));
			list.add(dto);
			
			return list; */
			if(rs.next()) 					//rs������ ������ �����ֳ�
				//name = rs.getString("name");	//������ 	"name"�� �ְ� �ٽ�Ʈ�� �����ؼ� rid�� ��ƶ�				
				result=true;			//������ Ʈ�縦 ����Ʈ�� ��ƶ�
				return result;		//����Ʈ ��ȯ�ض�
			}catch(Exception ex) {
				System.out.println("getMemberName() ���� : " + ex);
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
			return null;
	}

}	
			
			
			
		
	

	


