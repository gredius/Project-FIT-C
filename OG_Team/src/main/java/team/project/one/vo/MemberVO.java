package team.project.one.vo;

public class MemberVO {
	private String fit_userid;
	private String fit_userpwd;
	private String fit_usernick;
	private String fit_usermail;
	private String fit_userkeyvalue;
	private String fit_userestimatenum;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String fit_userid, String fit_userpwd, String fit_usernick, String fit_usermail,
			String fit_userkeyvalue, String fit_userestimatenum) {
		super();
		this.fit_userid = fit_userid;
		this.fit_userpwd = fit_userpwd;
		this.fit_usernick = fit_usernick;
		this.fit_usermail = fit_usermail;
		this.fit_userkeyvalue = fit_userkeyvalue;
		this.fit_userestimatenum = fit_userestimatenum;
	}

	public String getFit_userid() {
		return fit_userid;
	}

	public void setFit_userid(String fit_userid) {
		this.fit_userid = fit_userid;
	}

	public String getFit_userpwd() {
		return fit_userpwd;
	}

	public void setFit_userpwd(String fit_userpwd) {
		this.fit_userpwd = fit_userpwd;
	}

	public String getFit_usernick() {
		return fit_usernick;
	}

	public void setFit_usernick(String fit_usernick) {
		this.fit_usernick = fit_usernick;
	}

	public String getFit_usermail() {
		return fit_usermail;
	}

	public void setFit_usermail(String fit_usermail) {
		this.fit_usermail = fit_usermail;
	}

	public String getFit_userkeyvalue() {
		return fit_userkeyvalue;
	}

	public void setFit_userkeyvalue(String fit_userkeyvalue) {
		this.fit_userkeyvalue = fit_userkeyvalue;
	}

	public String getFit_userestimatenum() {
		return fit_userestimatenum;
	}

	public void setFit_userestimatenum(String fit_userestimatenum) {
		this.fit_userestimatenum = fit_userestimatenum;
	}

	@Override
	public String toString() {
		return "MemberVO [fit_userid=" + fit_userid + ", fit_userpwd=" + fit_userpwd + ", fit_usernick=" + fit_usernick
				+ ", fit_usermail=" + fit_usermail + ", fit_userkeyvalue=" + fit_userkeyvalue + ", fit_userestimatenum="
				+ fit_userestimatenum + "]";
	}

	
	
	
	
}
