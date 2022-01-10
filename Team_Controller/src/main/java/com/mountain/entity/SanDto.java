package com.mountain.entity;

public class SanDto {
	private Long id;
	private String name;
	private String info;
	private double lat;
	private double lon;
	private String sanImg;
	
	public SanDto() {
		super();
	}

	public SanDto(Long id, String name, String info, double lat, double lon,  String sanImg) {
		super();
		this.id = id;
		this.name = name;
		this.info = info;
		this.lat = lat;
		this.lon = lon;
		this.sanImg = sanImg;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getSanImg() {
		return sanImg;
	}
	
	public void setSanImg(String sanImg) {
		this.sanImg = sanImg;
	}
	
	@Override
	public String toString() {
		return "SanDto [id=" + id + ", name=" + name + ", info=" + info + ", lat=" + lat + ", lon=" + lon + ", sanImg="
				+ sanImg + "]";
	}
	
}
