package mvc.model;

public class Notice {
	public Notice() {
		// TODO Auto-generated constructor stub
	}
	private int id;
	private String title;
	private String writer;
	private String Content;
	private String r_date;
	private int hit;
		
	public Notice(int id, String title, String writer, String content, String r_date, int hit) {
		super();
		this.id = id;
		this.title = title;
		this.writer = writer;
		Content = content;
		this.r_date = r_date;
		this.hit = hit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
	

}
