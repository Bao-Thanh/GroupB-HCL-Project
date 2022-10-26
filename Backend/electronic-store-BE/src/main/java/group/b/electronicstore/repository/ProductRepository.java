package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.Product;

public interface ProductRepository extends JpaRepository<Product ,Long>{

}
