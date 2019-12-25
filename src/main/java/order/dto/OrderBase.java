package order.dto;

import java.util.Date;

public class OrderBase {
	private int orderNo;
    private int cusno;    
    private Date orderDate;
    private String cusReq;
    @Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusno=" + cusno + ", orderDate=" + orderDate + ", cusReq=" + cusReq
				+ "]";
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getCusno() {
		return cusno;
	}
	public void setCusno(int cusno) {
		this.cusno = cusno;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getCusReq() {
		return cusReq;
	}
	public void setCusReq(String cusReq) {
		this.cusReq = cusReq;
	}
	
}
