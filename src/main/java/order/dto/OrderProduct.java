package order.dto;

public class OrderProduct {
	private int orderPrdno;
    private int orderNo;
    private int productNo;
    private int productcnt;
    
    public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
    
	public int getOrderPrdno() {
		return orderPrdno;
	}
	public void setOrderPrdno(int orderPrdno) {
		this.orderPrdno = orderPrdno;
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
		return "OrderProduct [orderPrdno=" + orderPrdno + ", orderNo=" + orderNo + ", productNo=" + productNo
				+ ", productcnt=" + productcnt + "]";
	}
	
}
