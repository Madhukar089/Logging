package main.java.com.models;

public class DynamicFormField {
	
    private int enqr_fieldid;
    private String enqr_label;
    private String enqr_value;
    
    
	public int getEnqr_fieldid() {
		return enqr_fieldid;
	}
	public void setEnqr_fieldid(int enqr_fieldid) {
		this.enqr_fieldid = enqr_fieldid;
	}
	
	public String getEnqr_label() {
		return enqr_label;
	}
	public void setEnqr_label(String enqr_label) {
		this.enqr_label = enqr_label;
	}
	public String getEnqr_value() {
		return enqr_value;
	}
	public void setEnqr_value(String enqr_value) {
		this.enqr_value = enqr_value;
	}
	@Override
	public String toString() {
		return "DynamicFormField [enqr_fieldid=" + enqr_fieldid + ", enqr_label=" + enqr_label + ", enqr_value="
				+ enqr_value + "]";
	}

}
