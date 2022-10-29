package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{

}
