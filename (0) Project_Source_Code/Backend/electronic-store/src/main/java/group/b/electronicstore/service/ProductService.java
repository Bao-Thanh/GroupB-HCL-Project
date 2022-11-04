package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Category;
import group.b.electronicstore.model.Comment;
import group.b.electronicstore.model.Product;

public interface ProductService {

	Product getProductById(long id);
	
	List<Comment> getCommentByProduct(long procduct_id);
	
	List<Product> getAllProducts();
	
	Product createProduct(Product product, long id);
	
	Product updateProduct(Product product, long id);
	
	void deleteProduct(long id);

}
