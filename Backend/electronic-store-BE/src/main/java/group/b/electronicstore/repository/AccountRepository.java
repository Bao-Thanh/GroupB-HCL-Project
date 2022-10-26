package group.b.electronicstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import group.b.electronicstore.model.Account;

@Repository("accountRepository")
public interface AccountRepository extends JpaRepository<Account ,Long>{
	// User
	Account findByUsernameAndPassword(String username, String password);
}
