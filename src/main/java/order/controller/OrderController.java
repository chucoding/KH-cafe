package order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.controller.LoginController;
import order.service.face.OrderService;
import product.dto.Product;
import product.service.face.ProductService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired OrderService orderService;
	@Autowired ProductService productService;
	
	@RequestMapping(value="/order/main",method=RequestMethod.GET)
	public void main(HttpSession session, Product product,Model model) {
		logger.info(Integer.toString(product.getProductNo()));
		if(Integer.toString(product.getProductNo())!="0") {
			List<Product> list = productService.productList();
			logger.info("확인"+list.toString());
			model.addAttribute("list", list);
		}
	}

	
}
