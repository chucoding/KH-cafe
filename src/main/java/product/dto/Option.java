package product.dto;

public class Option {
	private int productOptionNo;
	private String productOptionName;
	private int optionValue;
	public int getProductOptionNo() {
		return productOptionNo;
	}
	public void setProductOptionNo(int productOptionNo) {
		this.productOptionNo = productOptionNo;
	}
	public String getProductOptionName() {
		return productOptionName;
	}
	public void setProductOptionName(String productOptionName) {
		this.productOptionName = productOptionName;
	}
	public int getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(int optionValue) {
		this.optionValue = optionValue;
	}
	@Override
	public String toString() {
		return "Option [productOptionNo=" + productOptionNo + ", productOptionName=" + productOptionName
				+ ", optionValue=" + optionValue + "]";
	}
}
