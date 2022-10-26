package group.b.electronicstore.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import group.b.electronicstore.model.Account;
import group.b.electronicstore.service.AccountService;

@RestController
@RequestMapping("/api/account")
public class AccountController {

	AccountService accSer;

	//User
	@PostMapping("/login")
	public ResponseEntity<Boolean> loginUser(@RequestBody Account acc){
		return new ResponseEntity<Boolean> (accSer.loginUser(acc.getUsername(), acc.getPassword()), HttpStatus.OK);
	}

	@PostMapping("/signup")
	public ResponseEntity<Account> saveUser(@RequestBody Account account){
		return new ResponseEntity<Account>(accSer.signup(account), HttpStatus.CREATED);
	}

	//Admin
//	@PostMapping("/login")
//	public ResponseEntity<Boolean> loginAdmin(@RequestBody Account acc){
//		return new ResponseEntity<Boolean> (accSer.loginUser(acc.getUsername(), acc.getPassword()), HttpStatus.OK);
//	}
}
