package group.b.electronicstore.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import group.b.electronicstore.exception.ResourceNotFoundException;
import group.b.electronicstore.model.Category;
import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Customer;
import group.b.electronicstore.model.Order;
import group.b.electronicstore.model.Product;
import group.b.electronicstore.repository.CategoryRepository;
import group.b.electronicstore.repository.CommentRepository;
import group.b.electronicstore.repository.ProductRepository;
import group.b.electronicstore.repository.SupplierRepository;
import group.b.electronicstore.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepo;
	@Autowired
	CommentRepository commentRepo;
	@Autowired
	SupplierRepository supplierRepo;
	@Autowired
	CategoryRepository categoryRepo;

	@Override
	public Product getProductById(long id) {
		return productRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Product", "Id", id));
	}

	@Override
	public List<Comment> getCommentByProduct(long procduct_id) {
		return commentRepo.findCommentByProductId(procduct_id);
	}

	@Override
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}

	@Override
	public Product createProduct(Product product, long id) {
		Category existingCategory = categoryRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Category", "Id", id));
		product.setCategory(existingCategory);
		return productRepo.save(product);
	}

	@Override
	public Product updateProduct(Product product, long id) {
		Product existingProduct = productRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Product", "Id", id));

		if (!product.getName().equals("")) {
			existingProduct.setName(product.getName());
		}
		if (product.getPrice() > 0) {
			existingProduct.setPrice(product.getPrice());
		}
		existingProduct.setSaleOff(product.getSaleOff());
		if (!product.getImage().equals("")) {
			existingProduct.setImage(product.getImage());
		}
		existingProduct.setAmount(product.getAmount());
		existingProduct.setDescription(product.getDescription());
		//existingProduct.setCommentList(product.getCommentList());
		productRepo.save(existingProduct);
		return existingProduct;
	}

	@Override
	public void deleteProduct(long id) {
		productRepo.findById(id).orElseThrow(() -> 
		new ResourceNotFoundException("Product", "Id", id));
		productRepo.deleteById(id);
	}
}
