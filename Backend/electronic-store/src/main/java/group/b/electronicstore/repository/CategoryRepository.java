package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
