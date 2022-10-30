package group.b.electronicstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import group.b.electronicstore.model.Order;
import group.b.electronicstore.payload.request.OrderRequest;
import group.b.electronicstore.service.OrderService;

@RestController
@RequestMapping("/api/order")
public class OrderController {

	@Autowired
	private OrderService ordSer;

	@GetMapping("/viewall")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<List<Order>> getAllOrders(){
		return new ResponseEntity<List<Order>>(ordSer.getAllOrders(), HttpStatus.OK);
	}
	
	@PostMapping("/create")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<Order> saveOrder(@RequestBody OrderRequest order){
		return new ResponseEntity<Order>(ordSer.createOrder(order), HttpStatus.CREATED);
	}
//	@PostMapping("/create")
//	public ResponseEntity<Order> saveOrder(@RequestBody Order order){
//		return new ResponseEntity<Order>(ordSer.createOrder(order), HttpStatus.CREATED);
//	}

	@PutMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<Order> updateOrder(@PathVariable("id") long id,
			@RequestBody Order order){
		return new ResponseEntity<Order> (ordSer.updateOrder(order, id), HttpStatus.OK);
	}
	
//	@DeleteMapping("/{id}")
//	public ResponseEntity<String> deleteOrder(@PathVariable("id") long id){
//		ordSer.deleteOrder(id);
//		return new ResponseEntity<String> ("Delete Order successfully!.", HttpStatus.OK);
//	}
	
	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<String> deleteOrder(@PathVariable("id") long id){
		ordSer.deleteOrder(id);
		return new ResponseEntity<String> ("Delete Order successfully!.", HttpStatus.OK);
	}
}
