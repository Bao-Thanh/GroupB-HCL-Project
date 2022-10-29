package group.b.electronicstore.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import group.b.electronicstore.exception.ResourceNotFoundException;
import group.b.electronicstore.model.Order;
import group.b.electronicstore.model.OrderDetail;
import group.b.electronicstore.repository.CustomerRepository;
import group.b.electronicstore.repository.OrderDetailRepository;
import group.b.electronicstore.repository.OrderRepository;
import group.b.electronicstore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderRepository orderRepo;
	private CustomerRepository customerRepo;
	private OrderDetailRepository orderDetailRepo;

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    
	@Override
	public Order getOrderById(long id) {
		return orderRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Order", "Id", id));
	}

	@Override
	public Order createOrder(Order order) {
		List<OrderDetail> list = new ArrayList<>();

		for(OrderDetail od:order.getOrderDetailList()){
			OrderDetail existOrderDetail = orderDetailRepo.findById(od.getId()).orElseThrow(() -> 
			new ResourceNotFoundException("Order", "OrderDetail", od.getId()));
			list.add(existOrderDetail);
		}
		order.setOrderDetailList(list);
		order.setTotalPrice(totalPrice(order.getId()));
		orderRepo.save(order);
		return order;
	}

	@Override
	public Order updateOrder(Order order, long id) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		Order existingOrder = orderRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Order", "Id", id));
		if (!order.getAddress().equals("")) {
			existingOrder.setAddress(order.getAddress());
		}
		if (!order.getPhone().equals("")) {
			existingOrder.setPhone(order.getPhone());
		}
		if (sdf.format(order.getOrderDate()).compareTo(sdf.format(timestamp)) > 0) {
			existingOrder.setOrderDate(order.getOrderDate());
		}
		existingOrder.setVat(order.getVat());
		existingOrder.setSafeOff(order.getSafeOff());
		if (!order.getStatus().equals("")) {
			existingOrder.setStatus(order.getStatus());
		}
		if(order.getState() > 0) {
			existingOrder.setState(order.getState());
		}

		if(order.getPayment_type() > 0) {
			existingOrder.setPayment_type(order.getPayment_type());
		}
		if (order.getCustomer() != null) {
			existingOrder.setCustomer(order.getCustomer());
		}
		if (order.getOrderDetailList() != null) {
			existingOrder.setOrderDetailList(order.getOrderDetailList());
		}
		if (order.getTotalPrice() > 0) {
			existingOrder.setTotalPrice(order.getTotalPrice());
		}
		orderRepo.save(existingOrder);
		return existingOrder;
	}

	@Override
	public void deleteOrder(long id) {
		orderRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Order", "Id", id));
		orderRepo.deleteById(id);

	}

	@Override
	public Double totalPrice(long id) {
		List<OrderDetail> list = orderDetailRepo.getDetailByOrder(id);
		double total = 0;
		for (OrderDetail d: list) {
			total += d.getProductPrice() * d.getAmount();
		}
		return total;
	}

}
