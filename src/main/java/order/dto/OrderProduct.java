package order.dto;

public class OrderProduct {
	private int orderProno;
    private int orderno;
    private int productNo;
    private int productcnt;
    public int getOrderProno() {
		return orderProno;
	}
	public void setOrderProno(int orderProno) {
		this.orderProno = orderProno;
	}
	public int getOrderno() {
		return orderno;
	}
	public void setOrderno(int orderno) {
		this.orderno = orderno;
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
		return "OrderProduct [orderProno=" + orderProno + ", orderno=" + orderno + ", productNo=" + productNo
				+ ", productcnt=" + productcnt + "]";
	}
	
}
