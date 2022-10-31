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
import group.b.electronicstore.model.Product;
import group.b.electronicstore.payload.request.OrderRequest;
import group.b.electronicstore.repository.CustomerRepository;
import group.b.electronicstore.repository.OrderDetailRepository;
import group.b.electronicstore.repository.OrderRepository;
import group.b.electronicstore.repository.ProductRepository;
import group.b.electronicstore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private CustomerRepository customerRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private OrderDetailRepository orderDetailRepo;

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
   	public List<Order> getAllOrders() {
   		return orderRepo.findAll();
   	}
    
	@Override
	public Order getOrder(long id) {
		return orderRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Order", "Id", id));
	}

	@Override
	public Order createOrder(OrderRequest orders) {
		List<OrderDetail> list = new ArrayList<>();
		Order order = new Order(orders.getAddress(),orders.getPhone(), orders.getVat(), orders.getSafeOff(),
				orders.getStatus(), orders.getState(), orders.getTotalPrice(),orders.getPayment_type(), orders.getCustomer());
		orderRepo.save(order);
		Order orderId = new Order(order.getId());
		List<OrderDetail> listOrderDeatil = orders.getOrderDetail();
		double total = 0;
		for (OrderDetail d: listOrderDeatil) {
			
			total += d.getProductPrice() * d.getAmount();
			//OrderDetail ood = new OrderDetail(d.getAmount(),d.getProductPrice(),d.getProduct(), orders);
			d.setOrder(orderId);
			orderDetailRepo.save(d);
		}
		//orderDetailRepo.saveAll(orders.getOrderdetail());
//		for(OrderDetail od:order.getOrderDetailList()){
//			OrderDetail existOrderDetail = orderDetailRepo.findById(od.getId()).orElseThrow(() -> 
//			new ResourceNotFoundException("Order", "OrderDetail", od.getId()));
//			orderDetailRepo.save(existOrderDetail);
//			list.add(existOrderDetail);
//		}
		order.setOrderDetailList(listOrderDeatil);
		order.setTotalPrice(totalPrice(order.getId()));
//		orderRepo.save(order);
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
		if (customerRepo.findById(order.getCustomer().getId()) != null) {
			existingOrder.setCustomer(order.getCustomer());
		}
		existingOrder.setOrderDetailList(order.getOrderDetailList());

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
		orderDetailRepo.removeItem(id);
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
	
	@Override
	public OrderDetail updateOrderDetail (OrderDetail orddetail, long id) {
		OrderDetail exist = orderDetailRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("OrderDetail", "Id", id));
		Product product = productRepo.findById(orddetail.getProduct().getId()).orElseThrow(() -> 
		new ResourceNotFoundException("Product", "Id", orddetail.getProduct().getId()));
		
		//stack
//		List<OrderDetail> listOrddetail = orddetailRepo.getDetailByOrder(orddetail.getOrder().getId());
//		for(OrderDetail d:listOrddetail) {
//			if(d.getProduct().getId()==orddetail.getProduct().getId()) {
//				orddetailRepo.delete(d);
//				d.setAmount(d.getAmount()+orddetail.getAmount());
//				orddetailRepo.save(d);
//				autoUpdateOrd(d);
//				return d;
//			}
//		}
		
		if(product!=null) {
			exist.setProduct(orddetail.getProduct());
		}
		if(orderRepo.findById(orddetail.getOrder().getId())!=null) {
			exist.setOrder(orddetail.getOrder());
		}
		if(orddetail.getAmount()>0) {
			exist.setAmount(orddetail.getAmount());
		}
		orderDetailRepo.save(exist);
		return exist;
	}

}
