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

import group.b.electronicstore.model.Product;
import group.b.electronicstore.service.ProductService;

@RestController
@RequestMapping("/product/order")
public class ProductController {
	
	@Autowired
	ProductService proSer;
	
	@GetMapping("/viewall")
	public ResponseEntity<List<Product>> getAllProduct(){
		return new ResponseEntity<List<Product>>(proSer.getAllProducts(), HttpStatus.OK);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Product> getProctById(@PathVariable("id") long id){
		return new ResponseEntity<Product> (proSer.getProductById(id), HttpStatus.OK);
	}
	
	@PostMapping("/create")
	public ResponseEntity<Product> saveProduct(@RequestBody Product product){
		return new ResponseEntity<Product>(proSer.creatProduct(product), HttpStatus.CREATED);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Product> updateOrder(@PathVariable("id") long id,
			@RequestBody Product product){
		return new ResponseEntity<Product> (proSer.updateProduct(product, id), HttpStatus.OK);
	}
	
	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteOrder(@PathVariable("id") long id){
		proSer.deleteProduct(id);
		return new ResponseEntity<String> ("Delete Product successfully!.", HttpStatus.OK);
	}

}
