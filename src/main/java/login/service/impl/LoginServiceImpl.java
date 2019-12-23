package login.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import login.dao.face.LoginDao;
import login.dto.Customer;
import login.service.face.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired LoginDao loginDao;
	
	@Override
	public boolean login(Customer customer) {
		int cnt = 0;
		cnt=loginDao.ckInfo(customer);
		if(cnt==0) {
			return false;
		}else {
			return true;
		}
		
	}

}
