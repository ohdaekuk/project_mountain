package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class ForumUser {
	private Long id;
	private String title;
	private String userId;
	private String content;
	private String Search;
	private String Select;
	private Long uId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	private String img;
	
	public ForumUser() {}

	public ForumUser(Long id, String title, String userId, String content, String search, String select, Long uId,
			LocalDateTime writeDate, String img) {
		super();
		this.id = id;
		this.title = title;
		this.userId = userId;
		this.content = content;
		Search = search;
		Select = select;
		this.uId = uId;
		this.writeDate = writeDate;
		this.img = img;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSearch() {
		return Search;
	}

	public void setSearch(String search) {
		Search = search;
	}

	public String getSelect() {
		return Select;
	}

	public void setSelect(String select) {
		Select = select;
	}

	public Long getuId() {
		return uId;
	}

	public void setuId(Long uId) {
		this.uId = uId;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "ForumUser [id=" + id + ", title=" + title + ", userId=" + userId + ", content=" + content + ", Search="
				+ Search + ", Select=" + Select + ", uId=" + uId + ", writeDate=" + writeDate + ", img=" + img + "]";
	}
	
}
