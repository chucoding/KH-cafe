package order.dto;

public class OrderBase {
	private int orderNo;
    private int cusno;    
    private int shopNo;
    private String orderDate;
    private String cusReq;
    private int orderStatus;
	@Override
	public String toString() {
		return "OrderBase [orderNo=" + orderNo + ", cusno=" + cusno + ", shopNo=" + shopNo + ", orderDate=" + orderDate
				+ ", cusReq=" + cusReq + ", orderStatus=" + orderStatus + "]";
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
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getCusReq() {
		return cusReq;
	}
	public void setCusReq(String cusReq) {
		this.cusReq = cusReq;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
    
    

	
}
