package group.b.electronicstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import group.b.electronicstore.model.Comment;
import group.b.electronicstore.service.CommentService;

@RestController
@RequestMapping("/api/comment")
public class CommentController {

	@Autowired
	private CommentService comSer;

	@PostMapping("/save/{cus_id}/{pro_id}")
	public ResponseEntity<Comment> createComment(@RequestBody Comment comment, 
			@PathVariable("cus_id") long cusId,
			@PathVariable("pro_id") long proId){
		return new ResponseEntity<Comment>(comSer.createComment(comment, cusId, proId), HttpStatus.CREATED);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> deleteComment(@PathVariable("id") long comId){
		comSer.deleteComment(comId);
		return new ResponseEntity<String> ("Delete Comment successfully!.", HttpStatus.OK);
	}
}