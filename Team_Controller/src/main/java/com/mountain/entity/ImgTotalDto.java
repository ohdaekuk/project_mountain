package com.mountain.entity;

public class ImgTotalDto {
	private Long id;
	private String name;
	private String path;
	private String category;
	private Long idInCategory;
	
	public ImgTotalDto() {
		super();
	}
	
	public ImgTotalDto(Long id, String name, String path, String category, Long idInCategory) {
		super();
		this.id = id;
		this.name = name;
		this.path = path;
		this.category = category;
		this.idInCategory = idInCategory;
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
	
	public String getPath() {
		return path;
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public Long getIdInCategory() {
		return idInCategory;
	}
	
	public void setIdInCategory(Long idInCategory) {
		this.idInCategory = idInCategory;
	}
	
	@Override
	public String toString() {
		return "ImgTotalDto [id=" + id + ", name=" + name + ", path=" + path + ", category=" + category
				+ ", idInCategory=" + idInCategory + "]";
	}
	
	
}
