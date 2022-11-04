package group.b.electronicstore.service;

import java.util.List;

import group.b.electronicstore.model.Account;

public interface AccountService {

	//User

	List<Account> getAllAccounts();

	Account getAccountById(long id);

	Account updateAccount(Account account, long id);

	void deleteAccount(long id);
}
