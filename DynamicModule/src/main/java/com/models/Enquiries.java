package main.java.com.models;

import java.sql.Date;

public class Enquiries {
	private int enq_id;
	private Date enq_date;
	private String createdBy;
	private int cust_id;
	private String sub;
	private String desc;
	private String status;
	private int assignedTo;
	private Date ludate;
	private String luser;

	public Enquiries(int enq_id, Date enq_date, String createdBy, int cust_id, String sub, String desc, String status,
			int assignedTo, Date ludate, String luser) {
		super();
		this.enq_id = enq_id;
		this.enq_date = enq_date;
		this.createdBy = createdBy;
		this.cust_id = cust_id;
		this.sub = sub;
		this.desc = desc;
		this.status = status;
		this.assignedTo = assignedTo;
		this.ludate = ludate;
		this.luser = luser;
	}

	public int getEnq_id() {
		return enq_id;
	}

	public void setEnq_id(int enq_id) {
		this.enq_id = enq_id;
	}

	public Date getEnq_date() {
		return enq_date;
	}

	public void setEnq_date(Date enq_date) {
		this.enq_date = enq_date;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(int assignedTo) {
		this.assignedTo = assignedTo;
	}

	public Date getLudate() {
		return ludate;
	}

	public void setLudate(Date ludate) {
		this.ludate = ludate;
	}

	public String getLuser() {
		return luser;
	}

	public void setLuser(String luser) {
		this.luser = luser;
	}

	public Enquiries() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Enquiries [enq_id=" + enq_id + ", enq_date=" + enq_date + ", createdBy=" + createdBy + ", cust_id="
				+ cust_id + ", sub=" + sub + ", desc=" + desc + ", status=" + status + ", assignedTo=" + assignedTo
				+ ", ludate=" + ludate + ", luser=" + luser + "]";
	}
}