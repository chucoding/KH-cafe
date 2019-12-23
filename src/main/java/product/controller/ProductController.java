package product.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import order.service.face.OrderService;
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
		model.addAttribute("productInfo", product);
	}
	@RequestMapping(value="/product/list",method=RequestMethod.GET)
	public void list(HttpSession session,Product product) {
		
	}
}
