package team.project.one.vo;

public class CommentVO {
	private int fit_commentnum;
	private int fit_boardnum;
	private String fit_userid;
	private String fit_comments;
	private String fit_commentdate;
	public CommentVO() {
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int fit_commentnum, int fit_boardnum, String fit_userid, String fit_comments,
			String fit_commentdate) {
		super();
		this.fit_commentnum = fit_commentnum;
		this.fit_boardnum = fit_boardnum;
		this.fit_userid = fit_userid;
		this.fit_comments = fit_comments;
		this.fit_commentdate = fit_commentdate;
	}
	public int getFit_commentnum() {
		return fit_commentnum;
	}
	public void setFit_commentnum(int fit_commentnum) {
		this.fit_commentnum = fit_commentnum;
	}
	public int getFit_boardnum() {
		return fit_boardnum;
	}
	public void setFit_boardnum(int fit_boardnum) {
		this.fit_boardnum = fit_boardnum;
	}
	public String getFit_userid() {
		return fit_userid;
	}
	public void setFit_userid(String fit_userid) {
		this.fit_userid = fit_userid;
	}
	public String getFit_comments() {
		return fit_comments;
	}
	public void setFit_comments(String fit_comments) {
		this.fit_comments = fit_comments;
	}
	public String getFit_commentdate() {
		return fit_commentdate;
	}
	public void setFit_commentdate(String fit_commentdate) {
		this.fit_commentdate = fit_commentdate;
	}
	@Override
	public String toString() {
		return "CommentVO [fit_commentnum=" + fit_commentnum + ", fit_boardnum=" + fit_boardnum + ", fit_userid="
				+ fit_userid + ", fit_comments=" + fit_comments + ", fit_commentdate=" + fit_commentdate + "]";
	}
	
	
}
