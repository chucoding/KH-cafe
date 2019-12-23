package product.service.face;

import java.util.List;

import product.dto.Product;

public interface ProductService {

	public List<Product> productList();

	public Product findInfo(int productNo);

}
