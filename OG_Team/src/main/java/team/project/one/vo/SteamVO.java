package team.project.one.vo;

public class SteamVO {
	int num;
	String appid;
	String fit_name;
	
	public SteamVO() {
		// TODO Auto-generated constructor stub
	}

	public SteamVO(int num, String appid, String fit_name) {
		super();
		this.num = num;
		this.appid = appid;
		this.fit_name = fit_name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getFit_name() {
		return fit_name;
	}

	public void setFit_name(String fit_name) {
		this.fit_name = fit_name;
	}

	@Override
	public String toString() {
		return "SteamVO [num=" + num + ", appid=" + appid + ", fit_name=" + fit_name + "]";
	}
	
}
