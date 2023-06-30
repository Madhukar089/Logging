package main.java.com.models;

public class TrackerEnqFieldsModel {
	private int enqr_id;
	private int enqr_iteration_index;
	private String enqr_uuid;
	private int enqr_fieldid;
	private String fieldType;
	private String defaultvalues;
	private int enqr_fieldorder;
	private String label;

	public TrackerEnqFieldsModel(int enqr_id, int enqr_iteration_index, String enqr_uuid, int enqr_fieldid,
			String fieldType, String defaultvalues, int enqr_fieldorder, String label) {
		super();
		this.enqr_id = enqr_id;
		this.enqr_iteration_index = enqr_iteration_index;
		this.enqr_uuid = enqr_uuid;
		this.enqr_fieldid = enqr_fieldid;
		this.fieldType = fieldType;
		this.defaultvalues = defaultvalues;
		this.enqr_fieldorder = enqr_fieldorder;
		this.label = label;
	}

	public TrackerEnqFieldsModel() {
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

	public String getEnqr_uuid() {
		return enqr_uuid;
	}

	public void setEnqr_uuid(String enqr_uuid) {
		this.enqr_uuid = enqr_uuid;
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
		return "TrackerEnqFieldsModel [enqr_id=" + enqr_id + ", enqr_iteration_index=" + enqr_iteration_index
				+ ", enqr_uuid=" + enqr_uuid + ", enqr_fieldid=" + enqr_fieldid + ", fieldType=" + fieldType
				+ ", defaultvalues=" + defaultvalues + ", enqr_fieldorder=" + enqr_fieldorder + ", label=" + label
				+ "]";
	}

}