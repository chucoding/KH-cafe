package product.service.face;

import java.util.List;

import order.dto.OrderProduct;
import product.dto.Option;
import product.dto.Product;

public interface ProductService {

	public List<Product> productList();

	public Product findInfo(int productNo);

	public List<Option> getOption(int productNo);

	public List<Product> getProductList(List<OrderProduct> orderProductList);

}
