package order.dao.face;

import java.util.List;

import order.dto.OrderBase;
import order.dto.OrderProduct;

public interface OrderDao {

	public void insert(List<OrderProduct> list);

	public void insertBase(OrderBase orderBase);

	public int getSeq();

	public int getProno();

	public List<OrderBase> selectByCusNo(OrderBase order);

}
