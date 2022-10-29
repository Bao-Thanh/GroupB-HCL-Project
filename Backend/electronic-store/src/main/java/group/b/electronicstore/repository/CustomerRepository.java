package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>{
	
}
