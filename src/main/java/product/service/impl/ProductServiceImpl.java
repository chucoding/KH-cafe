package product.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.dto.OrderProduct;
import product.dao.face.ProductDao;
import product.dto.Option;
import product.dto.Product;
import product.service.face.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired ProductDao productDao;
	
	@Override
	public List<Product> productList() {
		return productDao.selectAll();
	}

	@Override
	public Product findInfo(int productNo) {
		return productDao.selectByNo(productNo);
	}

	@Override
	public List<Option> getOption(int productNo) {
			return productDao.getOptionByNo(productNo);
	}

	@Override
	public List<Product> getProductList(List<OrderProduct> orderProductList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderProductList", orderProductList);
		return productDao.getProductByNo(map);
	}

}
