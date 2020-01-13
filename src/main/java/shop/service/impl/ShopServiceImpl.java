package shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import shop.dao.face.ShopDao;
import shop.dto.Shop;
import shop.service.face.ShopService;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired ShopDao shopDao;

	@Override
	public List<Shop> shopList() {
		return shopDao.selectAll();
	}
	
}
