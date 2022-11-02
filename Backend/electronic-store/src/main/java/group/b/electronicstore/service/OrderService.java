package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Order;
import group.b.electronicstore.model.OrderDetail;
import group.b.electronicstore.payload.request.OrderRequest;

public interface OrderService {
	
	
	Order createOrder(OrderRequest order);
	
	Order updateOrder(Order order, long id);

	void deleteOrder(long d);
	
	Double totalPrice(long id);

	List<Order> getAllOrders();

	Order getOrder(long id);
	
	OrderDetail updateOrderDetail(OrderDetail orderdetail, long id);

	List<OrderDetail> getOrderDetail(long id);
}
