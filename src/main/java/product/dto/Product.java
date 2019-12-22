package product.dto;

public class Product {
	private int productNo;
   private int categoryMapNo;
   private int productOptionNo;
   private int shopNo;
   private String productName;
   private String productContent;
   private int originPrice;
   private int price;
   private String productOrigin;
   private String enrollDate;
   private String selStartDate;
   private String selEndDate;
   private int selStatus;
public int getProductNo() {
	return productNo;
}
public void setProductNo(int productNo) {
	this.productNo = productNo;
}
public int getCategoryMapNo() {
	return categoryMapNo;
}
public void setCategoryMapNo(int categoryMapNo) {
	this.categoryMapNo = categoryMapNo;
}
public int getProductOptionNo() {
	return productOptionNo;
}
public void setProductOptionNo(int productOptionNo) {
	this.productOptionNo = productOptionNo;
}
public int getShopNo() {
	return shopNo;
}
public void setShopNo(int shopNo) {
	this.shopNo = shopNo;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getProductContent() {
	return productContent;
}
public void setProductContent(String productContent) {
	this.productContent = productContent;
}
public int getOriginPrice() {
	return originPrice;
}
public void setOriginPrice(int originPrice) {
	this.originPrice = originPrice;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getProductOrigin() {
	return productOrigin;
}
public void setProductOrigin(String productOrigin) {
	this.productOrigin = productOrigin;
}
public String getEnrollDate() {
	return enrollDate;
}
public void setEnrollDate(String enrollDate) {
	this.enrollDate = enrollDate;
}
public String getSelStartDate() {
	return selStartDate;
}
public void setSelStartDate(String selStartDate) {
	this.selStartDate = selStartDate;
}
public String getSelEndDate() {
	return selEndDate;
}
public void setSelEndDate(String selEndDate) {
	this.selEndDate = selEndDate;
}
public int getSelStatus() {
	return selStatus;
}
public void setSelStatus(int selStatus) {
	this.selStatus = selStatus;
}
@Override
public String toString() {
	return "Product [productNo=" + productNo + ", categoryMapNo=" + categoryMapNo + ", productOptionNo="
			+ productOptionNo + ", shopNo=" + shopNo + ", productName=" + productName + ", productContent="
			+ productContent + ", originPrice=" + originPrice + ", price=" + price + ", productOrigin=" + productOrigin
			+ ", enrollDate=" + enrollDate + ", selStartDate=" + selStartDate + ", selEndDate=" + selEndDate
			+ ", selStatus=" + selStatus + "]";
}
}
