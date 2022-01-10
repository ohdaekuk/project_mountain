package com.mountain.entity;

public class GuDto {
	private Long id;
	private String name;
	
	public GuDto() {
		super();
	}
	
	public GuDto(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	
	@Override
	public String toString() {
		return "GuDto [id=" + id + ", name=" + name + "]";
	}
	
	
}
