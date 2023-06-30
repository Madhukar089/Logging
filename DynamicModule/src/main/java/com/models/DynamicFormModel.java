package main.java.com.models;

import java.util.List;

public class DynamicFormModel {
	
	private int enqr_id;
	private int enqr_iteration_index;
	private String enqr_uuid;
	
	private List<DynamicFormField> fields;

	public List<DynamicFormField> getFields() {
		return fields;
	}

	public void setFields(List<DynamicFormField> fields) {
		this.fields = fields;
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

	public String getEnqr_uuid() {
		return enqr_uuid;
	}

	public void setEnqr_uuid(String enqr_uuid) {
		this.enqr_uuid = enqr_uuid;
	}

	@Override
	public String toString() {
		return "DynamicFormModel [enqr_id=" + enqr_id + ", enqr_iteration_index=" + enqr_iteration_index
				+ ", enqr_uuid=" + enqr_uuid + ", fields=" + fields + "]";
	}
	
}
