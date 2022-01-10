package com.mountain.entity;

public class ImgForumDto {
	private Long id;
	private String name;
	private String path;
	private Long forumId;
	
	public ImgForumDto() {
		super();
	}

	public ImgForumDto(Long id, String name, String path, Long forumId) {
		super();
		this.id = id;
		this.name = name;
		this.path = path;
		this.forumId = forumId;
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

	public Long getForumId() {
		return forumId;
	}

	public void setForumId(Long forumId) {
		this.forumId = forumId;
	}

	@Override
	public String toString() {
		return "ImgForumDto [id=" + id + ", name=" + name + ", path=" + path + ", forumId=" + forumId + "]";
	}
	
	
}
