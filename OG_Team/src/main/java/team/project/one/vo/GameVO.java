package team.project.one.vo;

public class GameVO 
{
	private int num;
	private String fit_name;
	private int gamelevel;
	private int pclevel;
	private String imagelink;
	private String gamecpu;
	private String gameram;
	private String gamevga;
	private String gamegpu;
	private String gameaddop;
	private String memo;
	
	public GameVO() {
		// TODO Auto-generated constructor stub
	}

	public GameVO(int num, String fit_name, int gamelevel, int pclevel, String imagelink, String gamecpu,
			String gameram, String gamevga, String gamegpu, String gameaddop, String memo) {
		super();
		this.num = num;
		this.fit_name = fit_name;
		this.gamelevel = gamelevel;
		this.pclevel = pclevel;
		this.imagelink = imagelink;
		this.gamecpu = gamecpu;
		this.gameram = gameram;
		this.gamevga = gamevga;
		this.gamegpu = gamegpu;
		this.gameaddop = gameaddop;
		this.memo = memo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFit_name() {
		return fit_name;
	}

	public void setFit_name(String fit_name) {
		this.fit_name = fit_name;
	}

	public int getGamelevel() {
		return gamelevel;
	}

	public void setGamelevel(int gamelevel) {
		this.gamelevel = gamelevel;
	}

	public int getPclevel() {
		return pclevel;
	}

	public void setPclevel(int pclevel) {
		this.pclevel = pclevel;
	}

	public String getImagelink() {
		return imagelink;
	}

	public void setImagelink(String imagelink) {
		this.imagelink = imagelink;
	}

	public String getGamecpu() {
		return gamecpu;
	}

	public void setGamecpu(String gamecpu) {
		this.gamecpu = gamecpu;
	}

	public String getGameram() {
		return gameram;
	}

	public void setGameram(String gameram) {
		this.gameram = gameram;
	}

	public String getGamevga() {
		return gamevga;
	}

	public void setGamevga(String gamevga) {
		this.gamevga = gamevga;
	}

	public String getGamegpu() {
		return gamegpu;
	}

	public void setGamegpu(String gamegpu) {
		this.gamegpu = gamegpu;
	}

	public String getGameaddop() {
		return gameaddop;
	}

	public void setGameaddop(String gameaddop) {
		this.gameaddop = gameaddop;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "GameVO [num=" + num + ", fit_name=" + fit_name + ", gamelevel=" + gamelevel + ", pclevel=" + pclevel
				+ ", imagelink=" + imagelink + ", gamecpu=" + gamecpu + ", gameram=" + gameram + ", gamevga=" + gamevga
				+ ", gamegpu=" + gamegpu + ", gameaddop=" + gameaddop + ", memo=" + memo + "]";
	}
	
	
}
