package com.mountain.entity;

public class AdminDto {
	private Long id;
	private String userId;
	private String password;
	private String name;
	private String email;
	
	public AdminDto() {
	}
	
	public AdminDto(Long id, String userId, String password, String name, String email) {
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "AdminDto [id=" + id + ", userId=" + userId + ", password=" + password + ", name=" + name + ", email="
				+ email + "]";
	}
	
}
