package model;

import java.sql.Date;

public class Ad {
	private String title;
	private String name;
	private String desc;
	private String condition;
	private Date sDate;
	private Date eDate;
	private String imageLink;
	private int rentCost;
	private int availableFlag;
	private String phn_no;
	private String email;
	private String category;
	private int adId;
	
	public int getAdId() {
		return adId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getPhn_no() {
		return phn_no;
	}
	public void setPhn_no(String phn_no) {
		this.phn_no = phn_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setAdId(int adId) {
		this.adId = adId;
	}
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
