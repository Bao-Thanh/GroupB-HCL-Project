package group.b.electronicstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	@Query("select p from Product p where p.category.id = ?1")
	List<Product> getProductByCategoryId(long id);
}
