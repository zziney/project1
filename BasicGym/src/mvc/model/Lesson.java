package mvc.model;

public class Lesson 
{
	private int l_id;
	private String lesson;
	private String trainer;
	private String trainer_career;
	private String scheduler1;
	private String scheduler2;
	private int price1;
	private int price2;
	private String descript;
	private String filename;
	
	
	public Lesson() {
		super();
	}
	
	
	public Lesson(int l_id, String lesson, String trainer, String trainer_career, String scheduler1, String scheduler2,
			int price1, int price2, String descript, String filename) {
		super();
		this.l_id = l_id;
		this.lesson = lesson;
		this.trainer = trainer;
		this.trainer_career = trainer_career;
		this.scheduler1 = scheduler1;
		this.scheduler2 = scheduler2;
		this.price1 = price1;
		this.price2 = price2;
		this.descript = descript;
		this.filename = filename;
	}






	public int getL_id() {
		return l_id;
	}


	public void setL_id(int l_id) {
		this.l_id = l_id;
	}


	public String getLesson() {
		return lesson;
	}
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	public String getTrainer() {
		return trainer;
	}

	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}

	public String getTrainer_career() {
		return trainer_career;
	}

	public void setTrainer_career(String trainer_career) {
		this.trainer_career = trainer_career;
	}

	
	public String getScheduler1() {
		return scheduler1;
	}

	public void setScheduler1(String scheduler1) {
		this.scheduler1 = scheduler1;
	}

	public String getScheduler2() {
		return scheduler2;
	}

	public void setScheduler2(String scheduler2) {
		this.scheduler2 = scheduler2;
	}

	public int getPrice1() {
		return price1;
	}

	public void setPrice1(int price1) {
		this.price1 = price1;
	}

	public int getPrice2() {
		return price2;
	}

	public void setPrice2(int price2) {
		this.price2 = price2;
	}

	
	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
}
