package group.b.electronicstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import group.b.electronicstore.model.Order;
import group.b.electronicstore.service.OrderService;

@RestController
@RequestMapping("/api/order")
public class OrderController {

	@Autowired
	private OrderService ordSer;

	@PostMapping("/create")
	public ResponseEntity<Order> saveOrder(@RequestBody Order order){
		return new ResponseEntity<Order>(ordSer.createOrder(order), HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Order> updateOrder(@PathVariable("id") long id,
			@RequestBody Order order){
		return new ResponseEntity<Order> (ordSer.updateOrder(order, id), HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteOrder(@PathVariable("id") long id){
		ordSer.deleteOrder(id);
		return new ResponseEntity<String> ("Delete Order successfully!.", HttpStatus.OK);
	}
}
