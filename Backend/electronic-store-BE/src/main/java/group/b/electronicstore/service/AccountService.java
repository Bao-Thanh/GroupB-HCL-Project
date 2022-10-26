package group.b.electronicstore.service;

import group.b.electronicstore.model.Account;

public interface AccountService {

	//User
	Boolean loginUser(String username, String password);

	Account signup(Account account);
}
