package product.dao.face;

import java.util.List;

import product.dto.Product;

public interface ProductDao {

	public List<Product> selectAll();

	public Product selectByNo(int productNo);

}
