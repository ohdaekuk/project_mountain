package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyForumUser {
	
	private Long id;
	private String userId;
	private String content;
	private Long forumId;
	private Long uId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	
	public ReplyForumUser() {}

	public ReplyForumUser(Long id, String userId, String content, Long forumId, Long uId, LocalDateTime writeDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.content = content;
		this.forumId = forumId;
		this.uId = uId;
		this.writeDate = writeDate;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getForumId() {
		return forumId;
	}

	public void setForumId(Long forumId) {
		this.forumId = forumId;
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

	@Override
	public String toString() {
		return "ReplyForumUser [id=" + id + ", userId=" + userId + ", content=" + content + ", forumId=" + forumId
				+ ", uId=" + uId + ", writeDate=" + writeDate + "]";
	}
	
	

}
