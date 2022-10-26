package group.b.electronicstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories
@SpringBootApplication
public class ElectronicStoreBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ElectronicStoreBeApplication.class, args);
	}

}
