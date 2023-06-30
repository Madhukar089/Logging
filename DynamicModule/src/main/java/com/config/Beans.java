package main.java.com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import main.java.com.dao.EnqDAOImpl;
import main.java.com.dao.EnqDAOIn;

@Configuration
public class Beans {
	@Bean
	EnqDAOIn enquiryDao() {
		return new EnqDAOImpl();
	}
}
