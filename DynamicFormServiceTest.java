package com.test.daos;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertNotNull;
import static org.testng.Assert.assertNull;
import static org.testng.Assert.assertThrows;
import static org.testng.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.ArgumentMatchers.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.json.Json;

import org.apache.logging.log4j.Logger;
import org.mockito.ArgumentMatchers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.mock.web.MockMultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

import com.contract.CombinedCustomerResponseContract;
import com.contract.DynamicFormDAO;
import com.contract.ObjectMapperContract;
import com.customExceptions.BlankFormException;
import com.dao.DynamicFormDaoImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.models.DTO.CustomerResponseDTO;
import com.models.DTO.MissingResponseDTO;
import com.models.Input.DynamicFormField;
import com.models.Output.DynamicFormModel;
import com.models.Output.RFPDynamicFormmModel;
import com.services.*;
import com.utilities.CustomObjectMapperWrapper;

@Test
public class DynamicFormServiceTest {
	
	@InjectMocks
    private DynamicFormService dynamicFormService;
	@Mock
    private Logger LOGGER;
	
	@Mock
    private DynamicFormDAO dynamicFormDao;

	@Mock
	private ObjectMapper objectMapper;
	@Mock
	private CustomObjectMapperWrapper customObjectMapperWrapper;
	@InjectMocks
    private DynamicFormServiceTest dynamicFormServiceTest;
	
	@BeforeMethod
    void setUp() {
		MockitoAnnotations.openMocks(this);
		 customObjectMapperWrapper = new CustomObjectMapperWrapper(objectMapper);
    }
	
	@Test
	void testGenerateUUID() {
	    String result = dynamicFormService.generateUUID();
	    assertNotNull(result);
	}
	
	@Test
    void testCheckIfIsNullEmptyList() {
        List<String> emptyList = new ArrayList<>();
        
        assertThrows(BlankFormException.class, () -> {
            dynamicFormService.checkIfIsNull(emptyList);
        });
    }

    @Test
    void testCheckIfIsNullNullList() {
        List<String> nullList = null;

        assertThrows(BlankFormException.class, () -> {
        	dynamicFormService.checkIfIsNull(nullList);
        });
    }

    @Test
    void testCheckIfIsNullNonEmptyList() throws BlankFormException {
        List<String> nonEmptyList = Arrays.asList("item1", "item2");

        boolean result = dynamicFormService.checkIfIsNull(nonEmptyList);

        assertTrue(result);
    }
	
//    @ParameterizedTest
//    @MethodSource("listProvider")
//    void testCheckIfIsNull(List<String> list, boolean expectedResult, boolean expectException) {
//        if (expectException) {
//            assertThrows(BlankFormException.class, () -> {
//                checkIfIsNull(list);
//            });
//        } else {
//            boolean result = checkIfIsNull(list);
//            assertEquals(expectedResult, result);
//        }
//    }
//
//    static Stream<Arguments> listProvider() {
//        return Stream.of(
//            Arguments.of(new ArrayList<>(), false, true), // Empty list, expecting exception
//            Arguments.of(null, false, true), // Null list, expecting exception
//            Arguments.of(Arrays.asList("item1", "item2"), true, false) // Non-empty list, expect true
//        );
//    }
    
    @Test
    void testExtractFileReturnsFile() {
        MockMultipartFile mockFile = new MockMultipartFile("file", "test.txt", "text/plain", "Test content".getBytes());
        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();
        request.addFile(mockFile);

        MultipartFile result = dynamicFormService.extractFile(request);

        assertNotNull(result);
        assertEquals(mockFile, result);
    }

    @Test
    void testExtractFileNoFileInRequest() {
        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();

        MultipartFile result = dynamicFormService.extractFile(request);

        assertNull(result);
    }
    
    @Test
    void testExtractDynamicFormModel() throws JsonProcessingException {
    	String dynamicFormModelJson = "";

        MockMultipartFile mockFile = new MockMultipartFile("file", "test.txt", "text/plain", "Test content".getBytes());

        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();
        request.addFile(mockFile);
        request.setParameter("dynamicFormModel", dynamicFormModelJson);

        DynamicFormModel dynamicFormModel = customObjectMapperWrapper.readValue(anyString(), eq(DynamicFormModel.class));
        DynamicFormModel result = dynamicFormService.extractDynamicFormModel(request);

        assertEquals(result, dynamicFormModel);
    }
    
    @Test
    void testExtractDynamicFormModelException() throws JsonProcessingException {
    	String dynamicFormModelJson = "";

        MockMultipartFile mockFile = new MockMultipartFile("file", "test.txt", "text/plain", "Test content".getBytes());

        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();
        request.addFile(mockFile);
        request.setParameter("dynamicFormModel", dynamicFormModelJson);

        DynamicFormModel dynamicFormModel = customObjectMapperWrapper.readValue(anyString(), eq(DynamicFormModel.class));
        DynamicFormModel result = dynamicFormService.extractDynamicFormModel(request);

        assertEquals(result, dynamicFormModel);
    }
    
    
    @Test
    void testExtractRFPDynamicFormModel() throws JsonProcessingException {
    	String dynamicFormModelJson = "";

        MockMultipartFile mockFile = new MockMultipartFile("file", "test.txt", "text/plain", "Test content".getBytes());

        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();
        request.addFile(mockFile);
        request.setParameter("dynamicFormModel", dynamicFormModelJson);

        RFPDynamicFormmModel dynamicFormModel = customObjectMapperWrapper.readValue(anyString(), eq(RFPDynamicFormmModel.class));
        RFPDynamicFormmModel result = dynamicFormService.extractRFPDynamicFormModel(request);

        assertEquals(result, dynamicFormModel);
    }
    
    @Test
    void testExtractRFPDynamicFormModelException() throws JsonProcessingException {
    	String dynamicFormModelJson = "";

        MockMultipartFile mockFile = new MockMultipartFile("file", "test.txt", "text/plain", "Test content".getBytes());

        MockMultipartHttpServletRequest request = new MockMultipartHttpServletRequest();
        request.addFile(mockFile);
        request.setParameter("dynamicFormModel", dynamicFormModelJson);

        RFPDynamicFormmModel dynamicFormModel = customObjectMapperWrapper.readValue(anyString(), eq(RFPDynamicFormmModel.class));
        RFPDynamicFormmModel result = dynamicFormService.extractRFPDynamicFormModel(request);

        assertEquals(result, dynamicFormModel);
    }
    
}
