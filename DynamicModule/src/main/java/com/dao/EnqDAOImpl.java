package main.java.com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import main.java.com.models.*;
import main.java.com.mappers.*;

public class EnqDAOImpl implements EnqDAOIn{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	private final String SQL_FIND_ENQUIRY = "select * from EnquiryIterations where enqr_id = ? and enqr_iteration_index = ?";
	private final String SQL_GET_ENQ = "select * from tracker_enquiries";

	


	@Override
	public List<Enquiries> getAllEnquiries() {
		return jdbcTemplate.query(SQL_GET_ENQ, new EnquiryMapper());
	}

	@Override
	public int CreateEnquiryIterations(RequestFormModel requestFormModel) {
		// Retrieve the current maximum iteration index for the enqId
		String selectQuery = "SELECT COALESCE(MAX(enqr_iteration_index), 0) AS maxIndex FROM EnquiryIterations WHERE enqr_id = ?";
		Integer maxIndex = jdbcTemplate.queryForObject(selectQuery, Integer.class, requestFormModel.getEnqId());

		int iterationIndex = (maxIndex != null) ? maxIndex + 1 : 1;
		// Insert the new entry with the provided form data
		String insertQuery = "INSERT INTO EnquiryIterations (enqr_id, enqr_iteration_index, enqi_cdate, enqi_createdby, enqi_purpose, enqi_status) VALUES (?, ?, CURRENT_DATE, ?, ?, ?)";
		jdbcTemplate.update(insertQuery, requestFormModel.getEnqId(), iterationIndex, requestFormModel.getCreatedBy(),
				requestFormModel.getPurpose(), requestFormModel.getStatus());
		
		return iterationIndex;
	}

	@Override
	public EnqIterationModel getEnquiryIterationByNo(Integer eno, Integer iterId) {
		return jdbcTemplate.queryForObject(SQL_FIND_ENQUIRY, new Object[] { eno, iterId }, new EnqIterationMapper());
	}

	@Override
	public List<TrackerEnquiryFieldsDataModel> getCustomerResponseByNo(Integer eno) {
		String SQL_FIND_RESPONSE = "select * from tracker_enquiryFieldsdata where enqr_id = ?";
		return jdbcTemplate.query(SQL_FIND_RESPONSE, new Object[] {eno},  new TrackerEnquiryFieldsDataMapper());
	}

	@Override
	public boolean createtrackerFormDetails(TrackerEnqFieldsUtilityModel tefum, String uuid, int iterId) {
		String sql = "INSERT INTO tracker_enquiryFields (enqr_id, enqr_iteration_index, enqr_uuid, enqr_fieldid, enqr_fieldtype,enqr_defaultvalues, enqr_fieldorder, enqr_label) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		return jdbcTemplate.update(sql, tefum.getEnqr_id(), iterId, uuid,
				tefum.getEnqr_fieldid(), tefum.getFieldType(), tefum.getDefaultvalues(),
				tefum.getEnqr_fieldorder(), tefum.getLabel()) > 0;
	}

	@Override
	public List<TrackerEnqFieldsModel> getTrackerFieldData(String formIdentifier) {
	    String sql = "SELECT * FROM tracker_enquiryFields WHERE enqr_uuid=?";
	    return jdbcTemplate.query(sql, new Object[]{formIdentifier}, new TrackerMapper());
	}


	@Override
	public boolean createCustomerFormDetails(DynamicFormModel dm) {
		List<DynamicFormField> dff = dm.getFields();
		boolean success = true;
		for (DynamicFormField field : dff) {
	        String sql = "INSERT INTO tracker_enquiryFieldsdata (enqr_id, enqr_iteration_index, enqr_uuid, enqr_fieldid, enqr_label, enqr_value) VALUES (?, ?, ?, ?, ?, ?)";
	        int result = jdbcTemplate.update(sql, dm.getEnqr_id(), dm.getEnqr_iteration_index(), dm.getEnqr_uuid(), field.getEnqr_fieldid(), field.getEnqr_label(), field.getEnqr_value());
	        
	        // Check the result of the update operation
	        if (result <= 0) {
	            success = false;
	        }
	    }
		return success;
	}

	@Override
	public String getCustomerEmail(RequestFormModel requestFormModel) {
		
		String sql = "select cust_email from tracker_customers where cust_id = ?";
		String email= jdbcTemplate.queryForObject(sql, String.class, requestFormModel.getCustId());
		
		return email;
	}

	@Override
	public List<ReferenceModel> getEnquiryStatusList() {
		List<ReferenceModel> enquiryStatusList = new ArrayList<>();

        String enquiryQuery = "SELECT enqr_id, enqr_status FROM tr_enquiries";

        try {
            List<Map<String, Object>> enquiryResults = jdbcTemplate.queryForList(enquiryQuery);
            for (Map<String, Object> enquiryResult : enquiryResults) {
                int enquiryId = (int) enquiryResult.get("enqr_id");
                String status = (String) enquiryResult.get("enqr_status");
                String rfpStatus = null;
             
                    
                String rfpQuery = "SELECT rfpr_status FROM tr_rfps WHERE rfpr_enqr_id = ?";

                try {
                    rfpStatus = jdbcTemplate.queryForObject(rfpQuery, String.class, enquiryId);
                }  catch (EmptyResultDataAccessException e) {
                    rfpStatus = null;
                } catch (Exception e) {
                }
                String finalStatus = (rfpStatus != null) ? rfpStatus : status;
                ReferenceModel enquiryStatus = new ReferenceModel(enquiryId, finalStatus);
                enquiryStatusList.add(enquiryStatus);
            }
                
            
        }catch(Exception e) {
        	e.printStackTrace();
        }
        return enquiryStatusList;
	}
}