package model;

import java.sql.Date;

public class Ad {
	private String title;
	private String desc;
	private Date sDate;
	private Date eDate;
	private String imageLink;
	private int rentCost;
	private int availableFlag;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public int getAvailableFlag() {
		return availableFlag;
	}
	public void setAvailableFlag(int availableFlag) {
		this.availableFlag = availableFlag;
	}
	public Date geteDate() {
		return eDate;
	}
	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
	public int getRentCost() {
		return rentCost;
	}
	public void setRentCost(int rentCost) {
		this.rentCost = rentCost;
	}
	
}
