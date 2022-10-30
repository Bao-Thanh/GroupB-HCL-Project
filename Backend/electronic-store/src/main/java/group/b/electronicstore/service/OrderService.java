package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Order;
import group.b.electronicstore.payload.request.OrderRequest;

public interface OrderService {
	
	Order getOrderById(long id);
	
	Order createOrder(OrderRequest order);
	
	Order updateOrder(Order order, long id);

	void deleteOrder(long d);
	
	Double totalPrice(long id);

	List<Order> getAllOrders();
}
