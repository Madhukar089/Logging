package main.java.com.models;

import java.sql.Date;

public class EnqIterationModel {

	private int enqr_id;
	private int enqr_iteration_index;
	private Date enqi_date;
	private String enqi_createdby;
	private String enqi_purpose;
	private String enqi_status;

	public EnqIterationModel(int enqr_id, int enqr_iteration_index, Date enqi_date, String enqi_createdby,
			String enqi_purpose, String enqi_status) {
		super();
		this.enqr_id = enqr_id;
		this.enqr_iteration_index = enqr_iteration_index;
		this.enqi_date = enqi_date;
		this.enqi_createdby = enqi_createdby;
		this.enqi_purpose = enqi_purpose;
		this.enqi_status = enqi_status;
	}

	public EnqIterationModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEnqr_id() {
		return enqr_id;
	}

	public void setEnqr_id(int enqr_id) {
		this.enqr_id = enqr_id;
	}

	public int getEnqr_iteration_index() {
		return enqr_iteration_index;
	}

	public void setEnqr_iteration_index(int enqr_iteration_index) {
		this.enqr_iteration_index = enqr_iteration_index;
	}

	public Date getEnqi_date() {
		return enqi_date;
	}

	public void setEnqi_date(Date enqi_date) {
		this.enqi_date = enqi_date;
	}

	public String getEnqi_createdby() {
		return enqi_createdby;
	}

	public void setEnqi_createdby(String enqi_createdby) {
		this.enqi_createdby = enqi_createdby;
	}

	public String getEnqi_purpose() {
		return enqi_purpose;
	}

	public void setEnqi_purpose(String enqi_purpose) {
		this.enqi_purpose = enqi_purpose;
	}

	public String getEnqi_status() {
		return enqi_status;
	}

	public void setEnqi_status(String enqi_status) {
		this.enqi_status = enqi_status;
	}

}
