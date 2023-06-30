package main.java.com.config;

import com.fasterxml.jackson.databind.ObjectMapper;

import main.java.com.models.CustomObjectMapperWrapper;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ObjectMapperConfig {
    @Bean
    public ObjectMapper objectMapper() {
        return new ObjectMapper();
    }
    
    @Bean
    public CustomObjectMapperWrapper customObjectMapperWrapper(ObjectMapper objectMapper) {
        return new CustomObjectMapperWrapper(objectMapper);
    }
}