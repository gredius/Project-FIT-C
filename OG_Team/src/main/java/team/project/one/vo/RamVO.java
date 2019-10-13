package team.project.one.vo;

public class RamVO {
	private int num;
	private String fit_name;
	private String spec;
	private String src_link;
	
	public RamVO() {
		// TODO Auto-generated constructor stub
	}

	public RamVO(int num, String fit_name, String spec, String src_link) {
		super();
		this.num = num;
		this.fit_name = fit_name;
		this.spec = spec;
		this.src_link = src_link;
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

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getSrc_link() {
		return src_link;
	}

	public void setSrc_link(String src_link) {
		this.src_link = src_link;
	}

	@Override
	public String toString() {
		return "RamVO [num=" + num + ", fit_name=" + fit_name + ", spec=" + spec + ", src_link=" + src_link + "]";
	}
	
	
	
}
