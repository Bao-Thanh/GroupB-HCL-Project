package group.b.electronicstore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long>{
	
	@Query("select d from OrderDetail d where d.order.id = ?1")
	List<OrderDetail> getDetailByOrder(long order_id);
	
	@Query("select d from OrderDetail d where d.product.id = ?1")
	List<OrderDetail> getDetailByProduct (long product_id);
		
}
