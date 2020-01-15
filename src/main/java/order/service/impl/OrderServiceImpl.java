package order.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.controller.LoginController;
import login.dao.face.LoginDao;
import order.dao.face.OrderDao;
import order.dto.OrderBase;
import order.dto.OrderProduct;
import order.service.face.OrderService;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired OrderDao orderDao;
	@Autowired LoginDao loginDao;
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);

	@Override
	public void input(List<OrderProduct> list) {
		for(int i =0 ; i<list.size();i++) {
			int prono= orderDao.getProno();
			list.get(i).setOrderPrdno(prono);
		}
		logger.info(list.toString());
		orderDao.insert(list);
	}

	@Override
	public int getSeqNo() {
		return orderDao.getSeq();
	}

	@Override
	public void inputBase(OrderBase orderBase) {
		logger.info("OrderNo :"+orderBase.getOrderNo());
		logger.info("Cusno :"+orderBase.getCusno());
		orderDao.insertBase(orderBase);
	}

	@Override
	public List<OrderBase> getOrderList(OrderBase order) {
		return orderDao.selectByCusNo(order);
	}

	@Override
	public OrderBase getDetail(OrderBase order) {
		return order=orderDao.getInfo(order);
	}

	@Override
	public List<OrderProduct> getOrderProList(OrderBase order) {
		List<OrderProduct> list;
		return list=orderDao.getOrderByOrderNo(order);
	}

	
	
	
}
