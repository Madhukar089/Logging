package main.java.com.models;

public class ReferenceModel {
	private int enqId;
	private String status;

	public int getEnqId() {
		return enqId;
	}

	public void setEnqId(int enqId) {
		this.enqId = enqId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ReferenceModel(int enqId, String status) {
		this.enqId = enqId;
		this.status = status;
	}

	@Override
	public String toString() {
		return "ReferenceModel [enqId=" + enqId + ", status=" + status + "]";
	}
	
	
	
}
