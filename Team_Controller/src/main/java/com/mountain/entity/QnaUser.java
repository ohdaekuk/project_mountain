package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaUser {
	private Long id;
	private String title;
	private String userId;
	private String content;
	private Long uId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	private String img;
	
	public QnaUser() {}

	public QnaUser(Long id, String title, String userId, String content, Long uId, LocalDateTime writeDate,
			String img) {
		super();
		this.id = id;
		this.title = title;
		this.userId = userId;
		this.content = content;
		this.uId = uId;
		this.writeDate = writeDate;
		this.img = img;
	}
	
	public Long getuId() {
		return uId;
	}

	public void setuId(Long uId) {
		this.uId = uId;
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
		return "QnaUser [id=" + id + ", title=" + title + ", userId=" + userId + ", content=" + content + ", uId=" + uId
				+ ", writeDate=" + writeDate + ", img=" + img + "]";
	}
}