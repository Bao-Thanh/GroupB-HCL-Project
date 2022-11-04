package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Supplier;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier ,Long>{
	
}
