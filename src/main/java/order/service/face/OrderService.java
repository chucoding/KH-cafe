package order.service.face;

import java.util.List;

import order.dto.OrderBase;
import order.dto.OrderProduct;

public interface OrderService {

	public void input(List<OrderProduct> list);

	public void inputBase(OrderBase orderBase);

	public int getSeqNo();

	public List<OrderBase> getOrderList(OrderBase order);

}
