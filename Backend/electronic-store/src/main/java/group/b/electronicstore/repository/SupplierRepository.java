package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import group.b.electronicstore.model.Supplier;

public interface SupplierRepository extends JpaRepository<Supplier ,Long>{
	
}
