package group.b.electronicstore.service;

import group.b.electronicstore.model.Order;

public interface OrderService {
	
	Order getOrderById(long id);
	
	Order createOrder(Order order);
	
	Order updateOrder(Order order, long id);

	void deleteOrder(long d);
	
	Double totalPrice(long id);
}
