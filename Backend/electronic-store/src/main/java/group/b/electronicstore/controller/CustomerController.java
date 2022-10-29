package group.b.electronicstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Customer;
import group.b.electronicstore.model.Order;
import group.b.electronicstore.service.CustomerService;

@RestController
@RequestMapping("/api/customer")
public class CustomerController {

	@Autowired
	private CustomerService cusSer;

	@PostMapping("/save")
	public ResponseEntity<Customer> saveCustomer(@RequestBody Customer customer){
		return new ResponseEntity<Customer>(cusSer.save(customer), HttpStatus.CREATED);
	}

	@GetMapping("/profile-detail/{id}")
	public ResponseEntity<Customer> getCustomerById(@PathVariable("id") long cusId){
		return new ResponseEntity<Customer> (cusSer.getCustomerById(cusId), HttpStatus.OK);
	}

	@GetMapping("/viewall")
	public ResponseEntity<List<Customer>> getAllCustomers(){
		return new ResponseEntity<List<Customer>> (cusSer.getAllCustomers(), HttpStatus.OK);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Customer> updateCustomer(@PathVariable("id") long cusId,
			@RequestBody Customer customer){
		return new ResponseEntity<Customer> (cusSer.updateCustomer(customer, cusId), HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteCustomer(@PathVariable("id") long cusId){
		cusSer.deleteCustomer(cusId);
		return new ResponseEntity<String> ("Delete Customer successfully!.", HttpStatus.OK);
	}

	@GetMapping("/comment/{id}")
	public ResponseEntity<List<Comment>> getCommentByCustomer(@PathVariable("id") long cusId){
		return new ResponseEntity<List<Comment>> (cusSer.getCommentByCustomer(cusId), HttpStatus.OK);
	}
	
	@GetMapping("/order/{id}")
	public ResponseEntity<List<Order>> getOrderByCustomer(@PathVariable("id") long cusId){
		return new ResponseEntity<List<Order>> (cusSer.getOrderByCustomer(cusId), HttpStatus.OK);
	}
}
