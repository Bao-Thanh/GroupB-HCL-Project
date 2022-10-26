package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long>  {

}