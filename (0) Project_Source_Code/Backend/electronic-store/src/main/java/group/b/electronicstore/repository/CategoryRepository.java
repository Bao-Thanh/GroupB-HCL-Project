package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

}
