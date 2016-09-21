package objects;

import java.sql.Date;

public class Ad {
	private int userId;
	private String adId;
	private String desc;
	private Date sDate;
	private Date eDate;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
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
	public boolean isAvailableFlag() {
		return availableFlag;
	}
	public void setAvailableFlag(boolean availableFlag) {
		this.availableFlag = availableFlag;
	}
	private int rentCost;
	private boolean availableFlag;
}
