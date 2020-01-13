package shop.dto;

public class Shop {
	
	private int shopNo;
	private String shopName;
	private double shopLat;
	private double shopLng;
	
	
	public double getShopLat() {
		return shopLat;
	}
	public double getShopLng() {
		return shopLng;
	}
	public void setShopLat(double shopLat) {
		this.shopLat = shopLat;
	}
	public void setShopLng(double shopLng) {
		this.shopLng = shopLng;
	}
	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", shopName=" + shopName + ", shopLat=" + shopLat + ", shopLng=" + shopLng
				+ "]";
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	

	
	

}
