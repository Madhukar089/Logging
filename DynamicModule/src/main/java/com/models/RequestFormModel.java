package main.java.com.models;

public class RequestFormModel {
	
	private int enqId;
    private String createdBy;
    private int custId;
    private String purpose;
    private String status;
    
	public int getEnqId() {
		return enqId;
	}
	public void setEnqId(int enqId) {
		this.enqId = enqId;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "RequestFormModel [enqId=" + enqId + ", createdBy=" + createdBy + ", custId=" + custId + ", purpose="
				+ purpose + ", status=" + status + "]";
	}
	
}
