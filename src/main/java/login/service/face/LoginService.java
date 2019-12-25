package login.service.face;

import login.dto.Customer;

public interface LoginService {

	public boolean login(Customer customer);

	public int getcusNo(String attribute);

}
