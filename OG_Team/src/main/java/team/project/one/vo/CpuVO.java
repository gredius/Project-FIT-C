package team.project.one.vo;


public class CpuVO 
{
	int num;
	String fit_name;
	String cpucode;
	String cores;
	String clock;
	String socket;
	String process;
	String l3cache;
	String tdp;
	String released;
	int point;
	
	public CpuVO() {
		// TODO Auto-generated constructor stub
	}

	public CpuVO(int num, String fit_name, String cpucode, String cores, String clock, String socket, String process,
			String l3cache, String tdp, String released, int point) {
		super();
		this.num = num;
		this.fit_name = fit_name;
		this.cpucode = cpucode;
		this.cores = cores;
		this.clock = clock;
		this.socket = socket;
		this.process = process;
		this.l3cache = l3cache;
		this.tdp = tdp;
		this.released = released;
		this.point = point;
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

	public String getCpucode() {
		return cpucode;
	}

	public void setCpucode(String cpucode) {
		this.cpucode = cpucode;
	}

	public String getCores() {
		return cores;
	}

	public void setCores(String cores) {
		this.cores = cores;
	}

	public String getClock() {
		return clock;
	}

	public void setClock(String clock) {
		this.clock = clock;
	}

	public String getSocket() {
		return socket;
	}

	public void setSocket(String socket) {
		this.socket = socket;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public String getL3cache() {
		return l3cache;
	}

	public void setL3cache(String l3cache) {
		this.l3cache = l3cache;
	}

	public String getTdp() {
		return tdp;
	}

	public void setTdp(String tdp) {
		this.tdp = tdp;
	}

	public String getReleased() {
		return released;
	}

	public void setReleased(String released) {
		this.released = released;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "CpuVO [num=" + num + ", fit_name=" + fit_name + ", cpucode=" + cpucode + ", cores=" + cores + ", clock="
				+ clock + ", socket=" + socket + ", process=" + process + ", l3cache=" + l3cache + ", tdp=" + tdp
				+ ", released=" + released + ", point=" + point + "]";
	}

	
}