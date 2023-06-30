package main.java.com.dao;

import java.util.List;

import main.java.com.models.*;

public interface EnqDAOIn {
	
	List<Enquiries> getAllEnquiries();

	int CreateEnquiryIterations(RequestFormModel requestFormModel);

	String getCustomerEmail(RequestFormModel requestFormModel);
	
	EnqIterationModel getEnquiryIterationByNo(Integer eno, Integer iterId);
	
	List<TrackerEnquiryFieldsDataModel> getCustomerResponseByNo(Integer eno);
	
	boolean createtrackerFormDetails(TrackerEnqFieldsUtilityModel tefum,String uuid, int iterId);

	List<TrackerEnqFieldsModel> getTrackerFieldData(String formIdentifier);
	
	boolean createCustomerFormDetails(DynamicFormModel dynamicFormModel);
	
	
	List<ReferenceModel> getEnquiryStatusList();
}
