package order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import login.controller.LoginController;
import login.service.face.LoginService;
import order.dto.OrderBase;
import order.dto.OrderProduct;
import order.service.face.OrderService;
import product.dto.Product;
import product.service.face.ProductService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired OrderService orderService;
	@Autowired ProductService productService;
	@Autowired LoginService loginService;
	
	@RequestMapping(value="/order/main",method=RequestMethod.GET)
	public void main(HttpSession session, Product product,Model model) {
		logger.info((String)session.getAttribute("userid"));
		logger.info(Integer.toString(product.getProductNo()));
		if(Integer.toString(product.getProductNo())!="0") {
			List<Product> list = productService.productList();
			logger.info("확인"+list.toString());
			model.addAttribute("list", list);
		}
	}
	@RequestMapping(value="/order/input",method=RequestMethod.POST)
	public void input(HttpSession session,
			@RequestParam(value="productNo[]")int[] prono,
			@RequestParam(value="productcnt[]")int[] cnt,
			Model model) {
		List<OrderProduct> list = new ArrayList<OrderProduct>();

		//인자 얻기
		int seqNo = orderService.getSeqNo();
		logger.info("seqNo : "+seqNo);
		int cusNo = loginService.getcusNo((String)session.getAttribute("userid"));
		logger.info("cusNo : "+cusNo);
		//ajax로 보낸 값들을 List형 oederPorduct에 저장
		for(int i=0;i<prono.length;i++) {
			OrderProduct order= new OrderProduct();
			logger.info((i+1)+"번째 : "+prono[i]);
			logger.info((i+1)+"번째 : "+cnt[i]);
			order.setOrderNo(seqNo);
			order.setProductNo(prono[i]);
			order.setProductcnt(cnt[i]);
			list.add(order);
		}
		OrderBase orderBase=new OrderBase();
		orderBase.setOrderNo(seqNo);
		orderBase.setCusno(cusNo);
		orderService.inputBase(orderBase);
		orderService.input(list);
	}

	
}
