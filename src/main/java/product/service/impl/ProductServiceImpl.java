package product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		public Option getOption(int productNo) {
			return productDao.getOptionByNo(productNo);
		}

}
