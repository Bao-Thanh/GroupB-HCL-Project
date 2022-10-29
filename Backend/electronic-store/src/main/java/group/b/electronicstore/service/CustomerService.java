package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Customer;
import group.b.electronicstore.model.Order;

public interface CustomerService {

	List<Customer> getAllCustomers();
	
	Customer save(Customer customer);
	
	Customer getCustomerById(long id);

	Customer updateCustomer(Customer customer, long id);

	void deleteCustomer(long id);
	
	List<Comment> getCommentByCustomer(long customer_id);
	
	List<Order> getOrderByCustomer(long customer_id);
}
