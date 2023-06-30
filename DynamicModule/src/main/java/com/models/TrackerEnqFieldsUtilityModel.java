package main.java.com.models;

public class TrackerEnqFieldsUtilityModel {
	private int enqr_id;
	private int enqr_fieldid;
	private String fieldType;
	private String defaultvalues;
	private int enqr_fieldorder;
	private String label;
	
	public int getEnqr_id() {
		return enqr_id;
	}
	public void setEnqr_id(int enqr_id) {
		this.enqr_id = enqr_id;
	}

	public int getEnqr_fieldid() {
		return enqr_fieldid;
	}
	public void setEnqr_fieldid(int enqr_fieldid) {
		this.enqr_fieldid = enqr_fieldid;
	}
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
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
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	@Override
	public String toString() {
		return "TrackerEnqFieldsUtilityModel [enqr_id=" + enqr_id + ", enqr_fieldid=" 
				+ enqr_fieldid + ", fieldType=" + fieldType + ", defaultvalues=" + defaultvalues
				+ ", enqr_fieldorder=" + enqr_fieldorder + ", label=" + label + "]";
	}
	
}
