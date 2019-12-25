package login.dto;

public class Customer {
	private int cusno;
	private String cusgrade;
	private String cusid;
	private String cuspw;
	public int getCusno() {
		return cusno;
	}
	public void setCusno(int cusno) {
		this.cusno = cusno;
	}
	public String getCusgrade() {
		return cusgrade;
	}
	public void setCusgrade(String cusgrade) {
		this.cusgrade = cusgrade;
	}
	public String getCusid() {
		return cusid;
	}
	public void setCusid(String cusid) {
		this.cusid = cusid;
	}
	public String getCuspw() {
		return cuspw;
	}
	public void setCuspw(String cuspw) {
		this.cuspw = cuspw;
	}
	@Override
	public String toString() {
		return "Customer [cusno=" + cusno + ", cusgrade=" + cusgrade + ", cusid=" + cusid + ", cuspw=" + cuspw + "]";
	}
}
