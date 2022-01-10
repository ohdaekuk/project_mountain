package com.mountain.entity;

public class EntranceDto {
	private Long id;
	private Long sanId;
	private double latitude;
	private double longitude;

	public EntranceDto() {
		super();
	}

	public EntranceDto(Long id, Long sanId, double latitude, double longitude) {
		this.id = id;
		this.sanId = sanId;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "EntranceDto{" +
				"id=" + id +
				", sanId=" + sanId +
				", latitude=" + latitude +
				", longitude=" + longitude +
				'}';
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setSanId(Long sanId) {
		this.sanId = sanId;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Long getId() {
		return id;
	}

	public Long getSanId() {
		return sanId;
	}

	public double getLatitude() {
		return latitude;
	}

	public double getLongitude() {
		return longitude;
	}
	
}
