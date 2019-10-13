package team.project.one.vo;

public class PcVO {
	private String cpu;
	private String ram;
	private String gpu;
	private String mainboard;
	private String power;
	private String pc_case;
	private String cpu_amd;
	private String mainboard_amd;
	
	public PcVO() {
		// TODO Auto-generated constructor stub
	}

	public PcVO(String cpu, String ram, String gpu, String mainboard, String power, String pc_case, String cpu_amd,
			String mainboard_amd) {
		super();
		this.cpu = cpu;
		this.ram = ram;
		this.gpu = gpu;
		this.mainboard = mainboard;
		this.power = power;
		this.pc_case = pc_case;
		this.cpu_amd = cpu_amd;
		this.mainboard_amd = mainboard_amd;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getGpu() {
		return gpu;
	}

	public void setGpu(String gpu) {
		this.gpu = gpu;
	}

	public String getMainboard() {
		return mainboard;
	}

	public void setMainboard(String mainboard) {
		this.mainboard = mainboard;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getPc_case() {
		return pc_case;
	}

	public void setPc_case(String pc_case) {
		this.pc_case = pc_case;
	}

	public String getCpu_amd() {
		return cpu_amd;
	}

	public void setCpu_amd(String cpu_amd) {
		this.cpu_amd = cpu_amd;
	}

	public String getMainboard_amd() {
		return mainboard_amd;
	}

	public void setMainboard_amd(String mainboard_amd) {
		this.mainboard_amd = mainboard_amd;
	}

	@Override
	public String toString() {
		return "PcVO [cpu=" + cpu + ", ram=" + ram + ", gpu=" + gpu + ", mainboard=" + mainboard + ", power=" + power
				+ ", pc_case=" + pc_case + ", cpu_amd=" + cpu_amd + ", mainboard_amd=" + mainboard_amd + "]";
	}
}
