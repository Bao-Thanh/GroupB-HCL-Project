package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Category;

public interface CategoryService {
	List<Category> getAllCategorys();

	Category getCategoryById(long id);
	
	Category createCategory(Category category);
	
	Category updateCategory(Category category, long id);
	
	void deleteCategory(long id);
}
