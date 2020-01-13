package order.dto;

public class OrderProduct {
	private int orderProno;
    private int orderNo;
    private int productNo;
    private int productcnt;
    
    public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
    public int getOrderProno() {
		return orderProno;
	}
	public void setOrderProno(int orderProno) {
		this.orderProno = orderProno;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductcnt() {
		return productcnt;
	}
	public void setProductcnt(int productcnt) {
		this.productcnt = productcnt;
	}
	@Override
	public String toString() {
		return "OrderProduct [orderProno=" + orderProno + ", orderNo=" + orderNo + ", productNo=" + productNo
				+ ", productcnt=" + productcnt + "]";
	}
	
}
