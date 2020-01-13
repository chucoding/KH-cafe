package order.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import login.service.face.LoginService;
import order.dto.OrderBase;
import order.dto.OrderProduct;
import order.service.face.OrderService;
import product.dto.Product;
import product.service.face.ProductService;
import shop.dto.Shop;
import shop.service.face.ShopService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired OrderService orderService;
	@Autowired ProductService productService;
	@Autowired LoginService loginService;
	@Autowired ShopService shopService;
	
	@RequestMapping(value="/order/main",method=RequestMethod.GET)
	public void main(HttpSession session,Shop shop,Product product,Model model) {
		logger.info("userId : "+session.getAttribute("userid"));
		logger.info(Integer.toString(product.getProductNo()));
		List<Shop> shopList = shopService.shopList();
		if(Integer.toString(product.getProductNo())!="0") {
			List<Product> list = productService.productList();
			logger.info("확인"+list.toString());
			model.addAttribute("list", list);
		}
		model.addAttribute("shopList", shopList);
	}
	@RequestMapping(value="/order/input",method=RequestMethod.POST)
	public @ResponseBody String input(HttpSession session,
			@RequestParam(value="productNo[]")int[] prono,
			@RequestParam(value="productcnt[]")int[] cnt,
			@RequestParam(value="optionNo[]")int[] option,
			@RequestParam(value="shopNo")int shopno,
			Model model) {
		List<OrderProduct> list = new ArrayList<OrderProduct>();

		//인자 얻기
		int seqNo = orderService.getSeqNo();
		logger.info("seqNo : "+seqNo);
		logger.info("userId : "+session.getAttribute("userid"));
	
		int cusNo = loginService.getcusNo((String)session.getAttribute("userid"));
		logger.info("cusNo : "+cusNo);
		//ajax로 보낸 값들을 List형 oederPorduct에 저장
		for(int i=0;i<prono.length;i++) {
			OrderProduct order= new OrderProduct();
			logger.info((i+1)+"번째 : "+prono[i]);
			logger.info((i+1)+"번째 : "+cnt[i]);
			logger.info((i+1)+"번째 : "+option[i]);
			order.setOrderNo(seqNo);
			order.setProductNo(prono[i]);
			order.setProductcnt(cnt[i]);
			list.add(order);
		}
		OrderBase orderBase=new OrderBase();
		orderBase.setOrderNo(seqNo);
		orderBase.setCusno(cusNo);
		orderBase.setShopNo(shopno);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		String orderDate =format1.format(System.currentTimeMillis());
		orderBase.setOrderDate(orderDate);
		logger.info(Integer.toString(shopno));
		orderService.inputBase(orderBase);
		orderService.input(list);
		return "성공";
	}
	
	@RequestMapping(value="/order/search",method=RequestMethod.GET)
	public ModelAndView main(
			@RequestParam(value="cusid")String cusid,
			ModelAndView mav,
			HttpSession session) {
		logger.info("입고 검색 후 목록 불러오기");
		logger.info(cusid);
		int cusNo = loginService.getcusNo(cusid);
		logger.info("아이디 : "+cusNo);
		OrderBase order = new OrderBase();
		order.setCusno(cusNo);
		List<OrderBase> data = orderService.getOrderList(order);
		
		List llist = new ArrayList();
		List list = null;
		
		//번호
		int i=1;
		for(OrderBase po : data) {
			list = new ArrayList();
			list.add(i++);
			list.add(po.getOrderNo());
			list.add(po.getShopNo());
			list.add(po.getOrderDate());
			list.add(po.getOrderStatus());
			llist.add(list);
		}
		
		mav.addObject("data",llist);
		mav.setViewName("jsonView");
		
		return mav;
	}

	
}
