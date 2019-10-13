package team.project.one.vo;

public class CompareVO 
{
	private String usercpu;
	private String usergpu;
	private String userram;
	private String usermainboard;
	private String usercase;
	private String usercpubench;
	private String usergpubench;
	private String userpower;
	private String gamecpu;
	private String gamegpu;
	private String gameram;
	private String gamecpubench;
	private String gamegpubench;
	private String maincpu;
	private String maincase;
	private String powercase;
	
	
	
	
	public CompareVO() {
		// TODO Auto-generated constructor stub
	}

	

	public CompareVO(String usercpu, String usergpu, String userram, String usermainboard, String usercase,
			String usercpubench, String usergpubench, String userpower, String gamecpu, String gamegpu, String gameram,
			String gamecpubench, String gamegpubench, String maincpu, String maincase, String powercase) {
		super();
		this.usercpu = usercpu;
		this.usergpu = usergpu;
		this.userram = userram;
		this.usermainboard = usermainboard;
		this.usercase = usercase;
		this.usercpubench = usercpubench;
		this.usergpubench = usergpubench;
		this.userpower = userpower;
		this.gamecpu = gamecpu;
		this.gamegpu = gamegpu;
		this.gameram = gameram;
		this.gamecpubench = gamecpubench;
		this.gamegpubench = gamegpubench;
		this.maincpu = maincpu;
		this.maincase = maincase;
		this.powercase = powercase;
	}



	public String getUsercpu() {
		return usercpu;
	}

	public void setUsercpu(String usercpu) {
		this.usercpu = usercpu;
	}

	public String getUsergpu() {
		return usergpu;
	}

	public void setUsergpu(String usergpu) {
		this.usergpu = usergpu;
	}

	public String getUserram() {
		return userram;
	}

	public void setUserram(String userram) {
		this.userram = userram;
	}

	public String getUsermainboard() {
		return usermainboard;
	}

	public void setUsermainboard(String usermainboard) {
		this.usermainboard = usermainboard;
	}

	public String getUsercase() {
		return usercase;
	}

	public void setUsercase(String usercase) {
		this.usercase = usercase;
	}

	public String getUsercpubench() {
		return usercpubench;
	}

	public void setUsercpubench(String usercpubench) {
		this.usercpubench = usercpubench;
	}

	public String getUsergpubench() {
		return usergpubench;
	}

	public void setUsergpubench(String usergpubench) {
		this.usergpubench = usergpubench;
	}

	public String getUserpower() {
		return userpower;
	}

	public void setUserpower(String userpower) {
		this.userpower = userpower;
	}

	public String getGamecpu() {
		return gamecpu;
	}

	public void setGamecpu(String gamecpu) {
		this.gamecpu = gamecpu;
	}

	public String getGamegpu() {
		return gamegpu;
	}

	public void setGamegpu(String gamegpu) {
		this.gamegpu = gamegpu;
	}

	public String getGameram() {
		return gameram;
	}

	public void setGameram(String gameram) {
		this.gameram = gameram;
	}

	public String getGamecpubench() {
		return gamecpubench;
	}

	public void setGamecpubench(String gamecpubench) {
		this.gamecpubench = gamecpubench;
	}

	public String getGamegpubench() {
		return gamegpubench;
	}

	public void setGamegpubench(String gamegpubench) {
		this.gamegpubench = gamegpubench;
	}



	public String getMaincpu() {
		return maincpu;
	}



	public void setMaincpu(String maincpu) {
		this.maincpu = maincpu;
	}



	public String getMaincase() {
		return maincase;
	}



	public void setMaincase(String maincase) {
		this.maincase = maincase;
	}



	public String getPowercase() {
		return powercase;
	}



	public void setPowercase(String powercase) {
		this.powercase = powercase;
	}



	@Override
	public String toString() {
		return "CompareVO [usercpu=" + usercpu + ", usergpu=" + usergpu + ", userram=" + userram + ", usermainboard="
				+ usermainboard + ", usercase=" + usercase + ", usercpubench=" + usercpubench + ", usergpubench="
				+ usergpubench + ", userpower=" + userpower + ", gamecpu=" + gamecpu + ", gamegpu=" + gamegpu
				+ ", gameram=" + gameram + ", gamecpubench=" + gamecpubench + ", gamegpubench=" + gamegpubench
				+ ", maincpu=" + maincpu + ", maincase=" + maincase + ", powercase=" + powercase + "]";
	}

	

	
}
