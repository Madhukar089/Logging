package main.java.com.models;

import javax.validation.constraints.NotBlank;

public class CommunicationData {
	private int rfpr_id;
	@NotBlank(message = "Message must not be blank")
    private String message;
    private String status;
	public int getRfpr_id() {
		return rfpr_id;
	}
	public void setRfpr_id(int rfpr_id) {
		this.rfpr_id = rfpr_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CommunicationData [rfpr_id=" + rfpr_id + ", message=" + message + ", status=" + status + "]";
	}
	public CommunicationData() {
		
	}
	public CommunicationData(int rfpr_id, String message, String status) {
		super();
		this.rfpr_id = rfpr_id;
		this.message = message;
		this.status = status;
	}
    
}
