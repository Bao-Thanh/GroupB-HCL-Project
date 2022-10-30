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

import group.b.electronicstore.model.OrderDetail;
import group.b.electronicstore.service.OrderDetailService;


@RestController
@RequestMapping("/api/orderdetail")
public class OrderDetailController {

	@Autowired
	private OrderDetailService orddetailSer;
	
	@PostMapping("/create")
	public ResponseEntity<OrderDetail> saveOrder(@RequestBody OrderDetail orddetail){
		return new ResponseEntity<OrderDetail>(orddetailSer.createOrderDetail(orddetail), HttpStatus.CREATED);
	}
	
	@PutMapping("/{id}")
	public ResponseEntity<OrderDetail> updateOrderDetail(@PathVariable("id") long id,
			@RequestBody OrderDetail orddetail){
		return new ResponseEntity<OrderDetail> (orddetailSer.updateOrderDetail(orddetail, id), HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteOrder(@PathVariable("id") long id){
		orddetailSer.deleteOrderDetail(id);
		return new ResponseEntity<String> ("Delete Order detail successfully!.", HttpStatus.OK);
	}
}
