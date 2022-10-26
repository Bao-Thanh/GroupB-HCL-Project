package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer ,Long>{

}
