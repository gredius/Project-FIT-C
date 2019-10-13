package team.project.one.vo;

public class BoardVO {
	private int fit_boardnum;
	private String fit_userid;
	private String fit_boardtitle;
	private String fit_pcsets;
	private String fit_boardcontent;
	private String fit_boarddate;
	private int fit_pcestimatenum;
	private int fit_boardhit;
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int fit_boardnum, String fit_userid, String fit_boardtitle, String fit_pcsets,
			String fit_boardcontent, String fit_boarddate, int fit_pcestimatenum, int fit_boardhit) {
		super();
		this.fit_boardnum = fit_boardnum;
		this.fit_userid = fit_userid;
		this.fit_boardtitle = fit_boardtitle;
		this.fit_pcsets = fit_pcsets;
		this.fit_boardcontent = fit_boardcontent;
		this.fit_boarddate = fit_boarddate;
		this.fit_pcestimatenum = fit_pcestimatenum;
		this.fit_boardhit = fit_boardhit;
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
	public String getFit_boardtitle() {
		return fit_boardtitle;
	}
	public void setFit_boardtitle(String fit_boardtitle) {
		this.fit_boardtitle = fit_boardtitle;
	}
	public String getFit_pcsets() {
		return fit_pcsets;
	}
	public void setFit_pcsets(String fit_pcsets) {
		this.fit_pcsets = fit_pcsets;
	}
	public String getFit_boardcontent() {
		return fit_boardcontent;
	}
	public void setFit_boardcontent(String fit_boardcontent) {
		this.fit_boardcontent = fit_boardcontent;
	}
	public String getFit_boarddate() {
		return fit_boarddate;
	}
	public void setFit_boarddate(String fit_boarddate) {
		this.fit_boarddate = fit_boarddate;
	}
	public int getFit_pcestimatenum() {
		return fit_pcestimatenum;
	}
	public void setFit_pcestimatenum(int fit_pcestimatenum) {
		this.fit_pcestimatenum = fit_pcestimatenum;
	}
	public int getFit_boardhit() {
		return fit_boardhit;
	}
	public void setFit_boardhit(int fit_boardhit) {
		this.fit_boardhit = fit_boardhit;
	}
	@Override
	public String toString() {
		return "BoardVO [fit_boardnum=" + fit_boardnum + ", fit_userid=" + fit_userid + ", fit_boardtitle="
				+ fit_boardtitle + ", fit_pcsets=" + fit_pcsets + ", fit_boardcontent=" + fit_boardcontent
				+ ", fit_boarddate=" + fit_boarddate + ", fit_pcestimatenum=" + fit_pcestimatenum + ", fit_boardhit="
				+ fit_boardhit + "]";
	}
	
	
	
}
