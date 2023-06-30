package main.java.com.models;

public class EnquiryFieldModel {

	private int enqr_id;
	private int enqr_iteration_index;
	private int enqr_fieldid;
	private String fieldtype;
	private String defaultvalues;
	private int enqr_fieldorder;

	public EnquiryFieldModel(int enqr_id, int enqr_iteration_index, int enqr_fieldid, String fieldtype,
			String defaultvalues, int enqr_fieldorder) {
		super();
		this.enqr_id = enqr_id;
		this.enqr_iteration_index = enqr_iteration_index;
		this.enqr_fieldid = enqr_fieldid;
		this.fieldtype = fieldtype;
		this.defaultvalues = defaultvalues;
		this.enqr_fieldorder = enqr_fieldorder;
	}

	public EnquiryFieldModel() {
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

	public int getEnqr_fieldid() {
		return enqr_fieldid;
	}

	public void setEnqr_fieldid(int enqr_fieldid) {
		this.enqr_fieldid = enqr_fieldid;
	}

	public String getFieldtype() {
		return fieldtype;
	}

	public void setFieldtype(String fieldtype) {
		this.fieldtype = fieldtype;
	}

	public String getDefaultvalues() {
		return defaultvalues;
	}

	public void setDefaultvalues(String defaultvalues) {
		this.defaultvalues = defaultvalues;
	}

	public int getEnqr_fieldorder() {
		return enqr_fieldorder;
	}

	public void setEnqr_fieldorder(int enqr_fieldorder) {
		this.enqr_fieldorder = enqr_fieldorder;
	}

}