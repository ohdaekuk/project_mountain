package com.mountain.entity;

public class ImgQnaDto {
	private Long id;
	private Long qnaId;
	private String name;
	private String path;
	
	public ImgQnaDto() {
		super();
	}
	
	public ImgQnaDto(Long id, Long qnaId, String name, String path) {
		super();
		this.id = id;
		this.qnaId = qnaId;
		this.name = name;
		this.path = path;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getQnaId() {
		return qnaId;
	}
	
	public void setQnaId(Long qnaId) {
		this.qnaId = qnaId;
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
	
	@Override
	public String toString() {
		return "ImgQnaDto [id=" + id + ", qnaId=" + qnaId + ", name=" + name + ", path=" + path + "]";
	}
	
	
	
}
