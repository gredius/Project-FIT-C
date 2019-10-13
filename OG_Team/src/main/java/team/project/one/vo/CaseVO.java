package team.project.one.vo;

public class CaseVO 
{
	int num;
	String fit_name;
	String rowprice;
	String power;
	String mainboardsize;
	String casesize;
	String addop;
	
	public CaseVO() {
		// TODO Auto-generated constructor stub
	}

	public CaseVO(int num, String fit_name, String rowprice, String power, String mainboardsize, String casesize,
			String addop) {
		super();
		this.num = num;
		this.fit_name = fit_name;
		this.rowprice = rowprice;
		this.power = power;
		this.mainboardsize = mainboardsize;
		this.casesize = casesize;
		this.addop = addop;
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

	public String getRowprice() {
		return rowprice;
	}

	public void setRowprice(String rowprice) {
		this.rowprice = rowprice;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getMainboardsize() {
		return mainboardsize;
	}

	public void setMainboardsize(String mainboardsize) {
		this.mainboardsize = mainboardsize;
	}

	public String getCasesize() {
		return casesize;
	}

	public void setCasesize(String casesize) {
		this.casesize = casesize;
	}

	public String getAddop() {
		return addop;
	}

	public void setAddop(String addop) {
		this.addop = addop;
	}

	@Override
	public String toString() {
		return "CaseVO [num=" + num + ", fit_name=" + fit_name + ", rowprice=" + rowprice + ", power=" + power
				+ ", mainboardsize=" + mainboardsize + ", casesize=" + casesize + ", addop=" + addop + "]";
	}
	
	
}