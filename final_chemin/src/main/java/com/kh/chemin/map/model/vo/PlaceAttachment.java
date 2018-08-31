package com.kh.chemin.map.model.vo;

import java.util.Date;

public class PlaceAttachment {
	private int attachmentNo;
	private int placeNo;
	private String orImg;
	private String reImg;
	private Date attachDate;
	
	public PlaceAttachment() {}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getOrImg() {
		return orImg;
	}

	public void setOrImg(String orImg) {
		this.orImg = orImg;
	}

	public String getReImg() {
		return reImg;
	}

	public void setReImg(String reImg) {
		this.reImg = reImg;
	}

	public Date getAttachDate() {
		return attachDate;
	}

	public void setAttachDate(Date attachDate) {
		this.attachDate = attachDate;
	}

	@Override
	public String toString() {
		return "PlaceAttachment [attachmentNo=" + attachmentNo + ", placeNo=" + placeNo + ", orImg=" + orImg
				+ ", reImg=" + reImg + ", attachDate=" + attachDate + "]";
	}
	
	
}
