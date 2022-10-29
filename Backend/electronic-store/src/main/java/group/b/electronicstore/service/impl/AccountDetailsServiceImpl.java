package group.b.electronicstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import group.b.electronicstore.model.Account;
import group.b.electronicstore.model.AccountDetailsImpl;
import group.b.electronicstore.repository.AccountRepository;
@Service
public class AccountDetailsServiceImpl implements UserDetailsService{
	@Autowired
	AccountRepository accountRepository;
	
	@Override
	@Transactional
	 public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	   Account account = accountRepository.findByUsername(username)
	        .orElseThrow(() -> new UsernameNotFoundException("Account Not Found with username: " + username));
	
	   return AccountDetailsImpl.build(account);
	 }
}
