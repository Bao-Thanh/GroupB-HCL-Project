package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import group.b.electronicstore.model.Comment;

public interface CommentRepository extends JpaRepository<Comment ,Long>{

}
