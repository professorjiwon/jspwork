package vote;

public class VoteList {
	private int num;
	private String question;
	private String sdate;
	private String edate;
	private String wdate;
	private int type;
	private int active;
	
	public VoteList() {
	}
	public VoteList(int num, String question, String sdate, String edate, String wdate, int type, int active) {
		super();
		this.num = num;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.wdate = wdate;
		this.type = type;
		this.active = active;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "VoteList [num=" + num + ", question=" + question + ", sdate=" + sdate + ", edate=" + edate + ", wdate="
				+ wdate + ", type=" + type + ", active=" + active + "]";
	}
}
