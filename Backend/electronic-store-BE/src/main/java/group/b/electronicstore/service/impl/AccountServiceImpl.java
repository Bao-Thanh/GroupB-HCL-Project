package group.b.electronicstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import group.b.electronicstore.model.Account;
import group.b.electronicstore.repository.AccountRepository;
import group.b.electronicstore.service.AccountService;

@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountRepository accountRepo;

	//User
	public Boolean loginUser(String username, String password) {
		Account acc = accountRepo.findByUsernameAndPassword(username, password);
		if (acc.getRole().equals("user")) {
			return true;
		}
		return false;
	}

	public Account signup(Account account){
		return accountRepo.save(account);
	}
}
