package team.project.one.vo;

public class PCEstimateVO 
{
	private int fit_pcnum;
	private String fit_userid;
	private String fit_cpuname;
	private String fit_ramname;
	private String fit_gpuname;
	private String fit_casename;
	private String fit_mainboardname;
	private String fit_powername;
	private String fit_date;
	public PCEstimateVO() {
		// TODO Auto-generated constructor stub
	}
	public PCEstimateVO(int fit_pcnum, String fit_userid, String fit_cpuname, String fit_ramname, String fit_gpuname,
			String fit_casename, String fit_mainboardname, String fit_powername, String fit_date) {
		super();
		this.fit_pcnum = fit_pcnum;
		this.fit_userid = fit_userid;
		this.fit_cpuname = fit_cpuname;
		this.fit_ramname = fit_ramname;
		this.fit_gpuname = fit_gpuname;
		this.fit_casename = fit_casename;
		this.fit_mainboardname = fit_mainboardname;
		this.fit_powername = fit_powername;
		this.fit_date = fit_date;
	}
	public int getFit_pcnum() {
		return fit_pcnum;
	}
	public void setFit_pcnum(int fit_pcnum) {
		this.fit_pcnum = fit_pcnum;
	}
	public String getFit_userid() {
		return fit_userid;
	}
	public void setFit_userid(String fit_userid) {
		this.fit_userid = fit_userid;
	}
	public String getFit_cpuname() {
		return fit_cpuname;
	}
	public void setFit_cpuname(String fit_cpuname) {
		this.fit_cpuname = fit_cpuname;
	}
	public String getFit_ramname() {
		return fit_ramname;
	}
	public void setFit_ramname(String fit_ramname) {
		this.fit_ramname = fit_ramname;
	}
	public String getFit_gpuname() {
		return fit_gpuname;
	}
	public void setFit_gpuname(String fit_gpuname) {
		this.fit_gpuname = fit_gpuname;
	}
	public String getFit_casename() {
		return fit_casename;
	}
	public void setFit_casename(String fit_casename) {
		this.fit_casename = fit_casename;
	}
	public String getFit_mainboardname() {
		return fit_mainboardname;
	}
	public void setFit_mainboardname(String fit_mainboardname) {
		this.fit_mainboardname = fit_mainboardname;
	}
	public String getFit_powername() {
		return fit_powername;
	}
	public void setFit_powername(String fit_powername) {
		this.fit_powername = fit_powername;
	}
	public String getFit_date() {
		return fit_date;
	}
	public void setFit_date(String fit_date) {
		this.fit_date = fit_date;
	}
	@Override
	public String toString() {
		return "PCEstimateVO [fit_pcnum=" + fit_pcnum + ", fit_userid=" + fit_userid + ", fit_cpuname=" + fit_cpuname
				+ ", fit_ramname=" + fit_ramname + ", fit_gpuname=" + fit_gpuname + ", fit_casename=" + fit_casename
				+ ", fit_mainboardname=" + fit_mainboardname + ", fit_powername=" + fit_powername + ", fit_date="
				+ fit_date + "]";
	}
	
	
	
}
