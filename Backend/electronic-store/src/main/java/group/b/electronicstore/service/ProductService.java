package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Product;

public interface ProductService {

	Product getProductById(long id);
	
	List<Comment> getCommentByProduct(long procduct_id);
	
	List<Product> getAllProducts();
	
	Product creatProduct(Product product);
	
	Product updateProduct(Product product, long id);
	
	void deleteProduct(long id);
}
