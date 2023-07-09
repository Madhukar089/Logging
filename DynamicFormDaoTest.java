package com.test.daos;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.testng.MockitoTestNGListener;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Listeners;
import org.testng.annotations.Test;

import com.customExceptions.BlankFormException;
import com.customExceptions.InsertException;
import com.dao.DynamicFormDaoImpl;
import com.mappers.CustomerRFPResponseMapper;
import com.mappers.CustomerResponseMapper;
import com.mappers.MissingRFPResponseMapper;
import com.mappers.MissingResponseMapper;
import com.mappers.RFPFieldMapper;
import com.mappers.TrackerEnquiryFieldMapper;
import com.models.DTO.CustomerRFPResponseDTO;
import com.models.DTO.CustomerResponseDTO;
import com.models.DTO.EnqFieldsDTO;
import com.models.DTO.MissingRFPResponseDTO;
import com.models.DTO.MissingResponseDTO;
import com.models.DTO.RFPFieldsDTO;
import com.models.Input.RequestFormModel;
import com.models.Output.CommunicationData;
import com.models.Output.DynamicFormField;
import com.models.Output.DynamicFormModel;
import com.models.Output.EnqFieldsModel;
import com.models.Output.RFPDynamicFormField;
import com.models.Output.RFPDynamicFormmModel;
import com.models.Output.RFPFieldsModel;
import com.models.Output.RFPRequestFormModel;

import static org.mockito.Mockito.when;
import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertThrows;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.Logger;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;

import static org.mockito.Mockito.*;
import static org.mockito.ArgumentMatchers.*;



@Test
public class DynamicFormDaoTest {
	@Mock
    private JdbcTemplate jdbcTemplate;
    
    @InjectMocks
    private DynamicFormDaoImpl dynamicFormDAOImpl;
    
    @Mock
    private Logger LOGGER;
    
    @BeforeMethod
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }
    
    
    @Test
    public void testCreateEnquiryIterations() throws InsertException {
        int expectedIterationIndex = 1;
        int maxIndex = 0;

        when(jdbcTemplate.queryForObject(anyString(), eq(Integer.class), anyInt()))
                .thenReturn(maxIndex);
        when(jdbcTemplate.update(anyString(),
                anyInt(), eq(expectedIterationIndex), anyString(), anyString(), anyString()))
                .thenReturn(1)
                .thenReturn(0);

        RequestFormModel requestFormModel = new RequestFormModel(1,"John","General Enquiry","In Progress");

        int result = dynamicFormDAOImpl.createEnquiryIterations(requestFormModel);
        assertEquals(result, expectedIterationIndex);

        assertThrows(InsertException.class, () -> {
            dynamicFormDAOImpl.createEnquiryIterations(requestFormModel);
        });

        verify(jdbcTemplate, times(2)).queryForObject(anyString(), eq(Integer.class), anyInt());
        verify(jdbcTemplate, times(2)).update(anyString(),
                anyInt(), eq(expectedIterationIndex), anyString(), anyString(), anyString());
    }

    
    @Test
    public void testGetCustomerEmail() throws SQLException {
        // Mock the behavior of JdbcTemplate
        String expectedEmail = "john@example.com";
        when(jdbcTemplate.queryForObject(anyString(), eq(String.class), anyInt()))
                .thenReturn(expectedEmail)
                .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));

        RequestFormModel requestFormModel = new RequestFormModel();
        requestFormModel.setCustId(12);
        String email = dynamicFormDAOImpl.getCustomerEmail(requestFormModel);

        assertEquals(expectedEmail, email);

        assertThrows(UncategorizedSQLException.class, () -> {
            dynamicFormDAOImpl.getCustomerEmail(requestFormModel);
        });

        verify(jdbcTemplate, times(2)).queryForObject(anyString(), eq(String.class), anyInt());
    }

    
    @SuppressWarnings("deprecation")
    @Test
    public void testGetMissingResponse() throws SQLException {
        List<MissingResponseDTO> missingResponseList = new ArrayList<>();

        when(jdbcTemplate.query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(MissingResponseMapper.class)
        )).thenReturn(missingResponseList)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<MissingResponseDTO> result = dynamicFormDAOImpl.getMissingResponses(1);

        assertEquals(result, missingResponseList);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getMissingResponses(1);
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(MissingResponseMapper.class)
        );
    }

    @SuppressWarnings("deprecation")
    @Test
    public void testGetCusomerResponse() throws SQLException {
        List<CustomerResponseDTO> customerResponseList = new ArrayList<>();

        when(jdbcTemplate.query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(CustomerResponseMapper.class)
        )).thenReturn(customerResponseList)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<CustomerResponseDTO> result = dynamicFormDAOImpl.getCustomerResponseByNo(1);

        assertEquals(result, customerResponseList);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getCustomerResponseByNo(1);
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(CustomerResponseMapper.class)
        );
    }
    
    @SuppressWarnings("deprecation")
    @Test
    public void testGetTrackerFieldData() throws SQLException {
        List<EnqFieldsModel> fieldData = new ArrayList<>();

        when(jdbcTemplate.query(
                anyString(),
                eq(new Object[] { "some String" }),
                any(TrackerEnquiryFieldMapper.class)
        )).thenReturn(fieldData)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<EnqFieldsModel> result = dynamicFormDAOImpl.getTrackerFieldData("some String");

        assertEquals(result, fieldData);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getTrackerFieldData("some String");
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { "some String" }),
                any(TrackerEnquiryFieldMapper.class)
        );
    }
    
    @Test
    void testCreatetrackerFormDetails() throws BlankFormException {
        List<EnqFieldsDTO> enqFields = new ArrayList<>();
        EnqFieldsDTO enqField1 = new EnqFieldsDTO(1,1,"test","test",1,"test");
        
        enqFields.add(enqField1);
        String uuid = "your-uuid";
        int iterId = 1;

        when(jdbcTemplate.update(anyString(), 
        		eq(enqField1.getEnqrId()), eq(iterId), eq(uuid),
        				eq(enqField1.getEnqrFieldId()), eq(enqField1.getFieldType()), 
        						eq(enqField1.getDefaultValues()),eq( enqField1.getEnqrFieldOrder()), eq(enqField1.getLabel())))
                .thenReturn(1)
                .thenReturn(0);

        boolean result = dynamicFormDAOImpl.createtrackerFormDetails(enqFields, uuid, iterId);

        Assert.assertTrue(result);
        
        
        assertThrows(BlankFormException.class, () -> {
            dynamicFormDAOImpl.createtrackerFormDetails(enqFields, uuid, iterId);
        });
        
        verify(jdbcTemplate, times(2)).update(anyString(),
        		eq(enqField1.getEnqrId()), eq(iterId), eq(uuid),
				eq(enqField1.getEnqrFieldId()), eq(enqField1.getFieldType()), 
						eq(enqField1.getDefaultValues()),eq( enqField1.getEnqrFieldOrder()), eq(enqField1.getLabel()));
    }
    
//    @Test(expectedExceptions = BlankFormException.class)
//    public void createtrackerFormDetails_NoRowsAffected_ThrowsBlankFormException() throws BlankFormException {
//        List<EnqFieldsDTO> enqFields = new ArrayList<>();
//        
//        String uuid = "your-uuid";
//        int iterId = 1;
//        when(jdbcTemplate.update(anyString(), any(), anyInt(), anyString(), any(), any(), anyInt(), any()))
//                .thenReturn(0);
//
//        dynamicFormDAOImpl.createtrackerFormDetails(enqFields, uuid, iterId);
//
//        // Assert (handled by expectedExceptions annotation)
//        verify(jdbcTemplate, times(1)).update(anyString(), any(), anyInt(), anyString(), any(), any(), anyInt(), any());
//    }
//    
    
    @Test
    void testCreateCustomerFormDetails() throws BlankFormException {

        List<DynamicFormField> dff = new ArrayList<>();
        DynamicFormField field1 = new DynamicFormField();
        dff.add(field1);
    	DynamicFormModel dm = new DynamicFormModel(1,1,"test",dff);

        when(jdbcTemplate.update(anyString(),
        		eq(dm.getEnqrId()), eq(dm.getEnqrIterationIndex()),
				eq(dm.getEnqrUuid()), eq(field1.getEnqrFieldId()), eq(field1.getEnqrLabel()), eq(field1.getEnqrValue())))
                .thenReturn(1)
                .thenReturn(0);

        dynamicFormDAOImpl.createCustomerFormDetails(dm);

        assertThrows(BlankFormException.class, () -> {
            dynamicFormDAOImpl.createCustomerFormDetails(dm);
        });
        
        verify(jdbcTemplate, times(2)).update(anyString(),
        		eq(dm.getEnqrId()), eq(dm.getEnqrIterationIndex()),
				eq(dm.getEnqrUuid()), eq(field1.getEnqrFieldId()), eq(field1.getEnqrLabel()), eq(field1.getEnqrValue()));
    }
    
    
    
    //----------------------------------------------RFP----------------------------------------------------------------------

    
    @Test
    public void testCreateRfpIterations() throws InsertException {
        int expectedIterationIndex = 1;
        int maxIndex = 0;

        when(jdbcTemplate.queryForObject(anyString(), eq(Integer.class), anyInt()))
                .thenReturn(maxIndex);
        when(jdbcTemplate.update(anyString(),
                anyInt(), eq(expectedIterationIndex), anyString(), anyString(), anyString()))
                .thenReturn(1)
                .thenReturn(0);

        RFPRequestFormModel requestFormModel = new RFPRequestFormModel(1,"John","General Enquiry","In Progress");

        int result = dynamicFormDAOImpl.CreateRfpIterations(requestFormModel);
        assertEquals(result, expectedIterationIndex);

        assertThrows(InsertException.class, () -> {
            dynamicFormDAOImpl.CreateRfpIterations(requestFormModel);
        });

        verify(jdbcTemplate, times(2)).queryForObject(anyString(), eq(Integer.class), anyInt());
        verify(jdbcTemplate, times(2)).update(anyString(),
                anyInt(), eq(expectedIterationIndex), anyString(), anyString(), anyString());
    }
    
    @Test
    public void testGetRfpCustomerEmail() throws SQLException {
        // Mock the behavior of JdbcTemplate
        String expectedEmail = "john@example.com";
        when(jdbcTemplate.queryForObject(anyString(), eq(String.class), anyInt()))
                .thenReturn(expectedEmail)
                .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));

        RFPRequestFormModel requestFormModel = new RFPRequestFormModel();
        requestFormModel.setRfpId(12);
        String email = dynamicFormDAOImpl.getRfpCustomerEmail(requestFormModel);

        assertEquals(expectedEmail, email);

        assertThrows(UncategorizedSQLException.class, () -> {
            dynamicFormDAOImpl.getRfpCustomerEmail(requestFormModel);
        });

        verify(jdbcTemplate, times(2)).queryForObject(anyString(), eq(String.class), anyInt());
    }

    
    @SuppressWarnings("deprecation")
    @Test
    public void testGetRFPMissingResponses() throws SQLException {
        List<MissingRFPResponseDTO> missingResponseList = new ArrayList<>();

        when(jdbcTemplate.query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(MissingRFPResponseMapper.class)
        )).thenReturn(missingResponseList)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<MissingRFPResponseDTO> result = dynamicFormDAOImpl.getRFPMissingResponses(1);

        assertEquals(result, missingResponseList);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getRFPMissingResponses(1);
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(MissingRFPResponseMapper.class)
        );
    }
    
    
    @SuppressWarnings("deprecation")
    @Test
    public void testGetRFPCustomerResponse() throws SQLException {
        List<CustomerRFPResponseDTO> customerResponseList = new ArrayList<>();

        when(jdbcTemplate.query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(CustomerRFPResponseMapper.class)
        )).thenReturn(customerResponseList)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<CustomerRFPResponseDTO> result = dynamicFormDAOImpl.getRFPCustomerResponseByNo(1);

        assertEquals(result, customerResponseList);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getRFPCustomerResponseByNo(1);
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { 1 }),
                any(CustomerRFPResponseMapper.class)
        );
    }
    
    @SuppressWarnings("deprecation")
    @Test
    public void testGetRfpFieldData() throws SQLException {
        List<RFPFieldsModel> fieldData = new ArrayList<>();

        when(jdbcTemplate.query(
                anyString(),
                eq(new Object[] { "some String" }),
                any(RFPFieldMapper.class)
        )).thenReturn(fieldData)
        .thenThrow(new UncategorizedSQLException("Test SQLException", "", new SQLException()));;

        List<RFPFieldsModel> result = dynamicFormDAOImpl.getRfpFieldData("some String");

        assertEquals(result, fieldData);

        assertThrows(UncategorizedSQLException.class, () -> {
        	dynamicFormDAOImpl.getRfpFieldData("some String");
        });
        
        verify(jdbcTemplate, times(2)).query(
        		anyString(),
                eq(new Object[] { "some String" }),
                any(RFPFieldMapper.class)
        );
    }
    
    
    @Test
    void testCreateRfpFormDetails() throws BlankFormException {
        List<RFPFieldsDTO> rfpFields = new ArrayList<>();
        RFPFieldsDTO rfpField1 = new RFPFieldsDTO(1,1,"test","test",1,"test");
        
        rfpFields.add(rfpField1);
        String uuid = "your-uuid";
        int iterId = 1;

        when(jdbcTemplate.update(anyString(), 
        		eq(rfpField1.getRfprId()), eq(iterId), eq(uuid),
        				eq(rfpField1.getRfprFieldId()), eq(rfpField1.getFieldType()), 
        						eq(rfpField1.getDefaultValues()),eq( rfpField1.getRfprFieldOrder()), eq(rfpField1.getLabel())))
                .thenReturn(1)
                .thenReturn(0);

        dynamicFormDAOImpl.createRfpFormDetails(rfpFields, uuid, iterId);
        
        assertThrows(BlankFormException.class, () -> {
            dynamicFormDAOImpl.createRfpFormDetails(rfpFields, uuid, iterId);
        });
        
        verify(jdbcTemplate, times(2)).update(anyString(), 
        		eq(rfpField1.getRfprId()), eq(iterId), eq(uuid),
				eq(rfpField1.getRfprFieldId()), eq(rfpField1.getFieldType()), 
						eq(rfpField1.getDefaultValues()),eq( rfpField1.getRfprFieldOrder()), eq(rfpField1.getLabel()));
    }
    
    @Test
    void createRfpCustomerFormDetails() throws InsertException {

        List<RFPDynamicFormField> dff = new ArrayList<>();
        RFPDynamicFormField field1 = new RFPDynamicFormField();
        dff.add(field1);
        RFPDynamicFormmModel dm = new RFPDynamicFormmModel(1,1,"test",dff);

        when(jdbcTemplate.update(anyString(),
        		eq(dm.getRfprId()), eq(dm.getRfprIterationIndex()),
				eq(dm.getRfprUuid()), eq(field1.getRfprFieldId()),
				eq(field1.getRfprLabel()), eq(field1.getRfprValue())))
                .thenReturn(1)
                .thenReturn(0);

        dynamicFormDAOImpl.createRfpCustomerFormDetails(dm);

        assertThrows(InsertException.class, () -> {
            dynamicFormDAOImpl.createRfpCustomerFormDetails(dm);
        });
        
        verify(jdbcTemplate, times(2)).update(anyString(),
        		eq(dm.getRfprId()), eq(dm.getRfprIterationIndex()),
				eq(dm.getRfprUuid()), eq(field1.getRfprFieldId()),
				eq(field1.getRfprLabel()), eq(field1.getRfprValue()));
    }
    
    
    @Test
    void testUpdateApprovalStatus() throws SQLException {
    	CommunicationData communicationData = new CommunicationData(1,"status");
        when(jdbcTemplate.queryForObject(anyString(), eq(Integer.class), eq(communicationData.getRfpr_id())))
        .thenReturn(1)
        .thenReturn(0);
        when(jdbcTemplate.update(anyString(), eq(communicationData.getStatus()),
				eq(communicationData.getRfpr_id()), anyInt()))
        .thenReturn(1)
        .thenReturn(0);
        
        dynamicFormDAOImpl.updateApprovalStatus(communicationData);
        
        assertThrows(SQLException.class, () -> {
            dynamicFormDAOImpl.updateApprovalStatus(communicationData);
        });

        verify(jdbcTemplate, times(2)).queryForObject(anyString(), eq(Integer.class), eq(communicationData.getRfpr_id()));
        verify(jdbcTemplate, times(2)).update(anyString(), eq(communicationData.getStatus()),
				eq(communicationData.getRfpr_id()), anyInt());
    }
    
}
