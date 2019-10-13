package team.project.one.vo;

public class MainBoardVO {
	int num;
	String fit_name;
	String sockets;
	String formFactor;
	String chipSet;
	String RAM;
	String releaseDate;
	String audioChip;
	String usb2;
	String usb3;
	String sata;
	
	public MainBoardVO() {
		// TODO Auto-generated constructor stub
	}

	public MainBoardVO(int num, String fit_name, String sockets, String formFactor, String chipSet, String rAM,
			String releaseDate, String audioChip, String usb2, String usb3, String sata) {
		super();
		this.num = num;
		this.fit_name = fit_name;
		this.sockets = sockets;
		this.formFactor = formFactor;
		this.chipSet = chipSet;
		RAM = rAM;
		this.releaseDate = releaseDate;
		this.audioChip = audioChip;
		this.usb2 = usb2;
		this.usb3 = usb3;
		this.sata = sata;
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

	public String getSockets() {
		return sockets;
	}

	public void setSockets(String sockets) {
		this.sockets = sockets;
	}

	public String getFormFactor() {
		return formFactor;
	}

	public void setFormFactor(String formFactor) {
		this.formFactor = formFactor;
	}

	public String getChipSet() {
		return chipSet;
	}

	public void setChipSet(String chipSet) {
		this.chipSet = chipSet;
	}

	public String getRAM() {
		return RAM;
	}

	public void setRAM(String rAM) {
		RAM = rAM;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getAudioChip() {
		return audioChip;
	}

	public void setAudioChip(String audioChip) {
		this.audioChip = audioChip;
	}

	public String getUsb2() {
		return usb2;
	}

	public void setUsb2(String usb2) {
		this.usb2 = usb2;
	}

	public String getUsb3() {
		return usb3;
	}

	public void setUsb3(String usb3) {
		this.usb3 = usb3;
	}

	public String getSata() {
		return sata;
	}

	public void setSata(String sata) {
		this.sata = sata;
	}

	@Override
	public String toString() {
		return "MainBoardVO [num=" + num + ", fit_name=" + fit_name + ", sockets=" + sockets + ", formFactor="
				+ formFactor + ", chipSet=" + chipSet + ", RAM=" + RAM + ", releaseDate=" + releaseDate + ", audioChip="
				+ audioChip + ", usb2=" + usb2 + ", usb3=" + usb3 + ", sata=" + sata + "]";
	}
	
	
}


