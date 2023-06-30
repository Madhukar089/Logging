package main.java.com.models;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;

public interface ObjectMapperWrapper {
	String writeValueAsString(Object value) throws JsonProcessingException;
    <T> T readValue(String content, Class<T> valueType) throws JsonProcessingException;
    <T> List<T> readValue(String content, TypeReference<List<T>> valueTypeRef) throws JsonProcessingException;
}
