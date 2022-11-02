package group.b.electronicstore.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import group.b.electronicstore.exception.ResourceNotFoundException;
import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Customer;
import group.b.electronicstore.model.Order;
import group.b.electronicstore.repository.CommentRepository;
import group.b.electronicstore.repository.CustomerRepository;
import group.b.electronicstore.repository.OrderRepository;
import group.b.electronicstore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerRepository customerRepo;
	private CommentRepository commentRepo;
	private OrderRepository orderRepo;

	@Override
	public List<Customer> getAllCustomers() {
		return customerRepo.findAll();
	}

	@Override
	public Customer getCustomerById(long id) {
		return customerRepo.getCustomerByAccountId(id);
//		return customerRepo.getCustomerByAccountId(id).orElseThrow(() -> 
//		new ResourceNotFoundException("Customer By Account", "Id", id));
	}

	@Override
	public Customer updateCustomer(Customer customer, long id) {
		Customer existingCustomer = customerRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Customer", "Id", id));
		if (!customer.getName().equals("")) {
			existingCustomer.setName(customer.getName());
		}
		if (!customer.getAge().equals("")) {
			existingCustomer.setAge(customer.getAge());
		}
		if (!customer.getGender().equals("")) {
			existingCustomer.setGender(customer.getGender());
		}
		if (!customer.getAddress().equals("")) {
			existingCustomer.setAddress(customer.getAddress());
		}
		if (!customer.getPhone().equals("")) {
			existingCustomer.setPhone(customer.getPhone());
		}
		if (!customer.getEmail().equals("")) {
			existingCustomer.setEmail(customer.getEmail());
		}
		if (!customer.getType().equals(null)) {
			existingCustomer.setType(customer.getType());
		}
		if (!customer.getStatus().equals(null)) {
			existingCustomer.setStatus(customer.getStatus());
		}
		customerRepo.save(existingCustomer);
		return existingCustomer;
	}

	@Override
	public void deleteCustomer(long id) {
		customerRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Customer", "Id", id));
		customerRepo.deleteById(id);
	}

	@Override
	public Customer save(Customer customer) {
		List<Order> orderList = new ArrayList<>();
		List<Comment> commentList = new ArrayList<>();

		for(Order ord:customer.getOrderList()){
			Order existOrder = orderRepo.findById(ord.getId()).orElseThrow(() -> 
			new ResourceNotFoundException("Customer", "Order", ord.getId()));
			orderList.add(existOrder);
		}
		customer.setOrderList(orderList);

		for(Comment com:customer.getCommentList()){
			Comment existComment= commentRepo.findById(com.getId()).orElseThrow(() -> 
			new ResourceNotFoundException("Customer", "Comment", com.getId()));
			commentList.add(existComment);
		}
		customer.setCommentList(commentList);
		return customerRepo.save(customer);
	}

	@Override
	public List<Comment> getCommentByCustomer(long customer_id) {
		return commentRepo.findCommentByCustomerId(customer_id);
	}

	@Override
	public List<Order> getOrderByCustomer(long customer_id) {
		return orderRepo.getOrderByCustomer(customer_id);
	}
}
