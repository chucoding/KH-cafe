package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import order.service.face.OrderService;
import product.dto.Option;
import product.dto.Product;
import product.service.face.ProductService;

@Controller
public class ProductController {
	@Autowired OrderService orderService;
	@Autowired ProductService productService;
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/product/productInfo",method=RequestMethod.GET)
	public void productInfo(Product product,Model model) {
		product = productService.findInfo(product.getProductNo());
		logger.info(product.toString());
		List<Option> option = productService.getOption(product.getCategoryMapNo());
		model.addAttribute("productInfo", product);
		model.addAttribute("option_list", option);
	}
	@RequestMapping(value="/product/list",method=RequestMethod.GET)
	public void list(Model model,Product product) {
		if(Integer.toString(product.getProductNo())!="0") {
			List<Product> list = productService.productList();
			logger.info("확인"+list.toString());
			model.addAttribute("list", list);
		}
	}
}
