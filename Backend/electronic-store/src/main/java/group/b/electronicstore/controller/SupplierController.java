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

import group.b.electronicstore.model.Supplier;
import group.b.electronicstore.service.SupplierService;


@RestController
@RequestMapping("/api/supplier")
public class SupplierController {
	
	@Autowired
	private SupplierService supplierSer;

	@GetMapping("/viewall")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public List<Supplier> getAllSuppliers(){
		return supplierSer.getAllSuppliers();
	}

	@PostMapping("/create")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Supplier> createSupplier(@RequestBody Supplier supplier){
		return new ResponseEntity<Supplier>(supplierSer.createSupplier(supplier), HttpStatus.CREATED);
	}
	
	@GetMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	public ResponseEntity<Supplier> getSupplierById(@PathVariable("id") long supplierId){
		return new ResponseEntity<Supplier> (supplierSer.getSupplierById(supplierId), HttpStatus.OK);
	}

	@PutMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Supplier> updateSupplier(@PathVariable("id") long supplierId, @RequestBody Supplier supplier){
		return new ResponseEntity<Supplier> (supplierSer.updateSupplier(supplier, supplierId), HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteSuppiler(@PathVariable("id") long supplierId){
		supplierSer.deleteSupplier(supplierId);
		return new ResponseEntity<String> ("Delete Supplier successfully!.", HttpStatus.OK);
	}
}
