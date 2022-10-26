package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail ,Long>{

}
