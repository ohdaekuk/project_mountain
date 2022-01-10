package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyForumDto {
	private Long id;
	private String content;
	private Long userId;
	private Long forumId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	
	public ReplyForumDto() {
		super();
	}
	
	public ReplyForumDto(Long id, String content, Long userId, Long forumId, LocalDateTime writeDate) {
		super();
		this.id = id;
		this.content = content;
		this.userId = userId;
		this.forumId = forumId;
		this.writeDate = writeDate;
	}
	
	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Long getUserId() {
		return userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public Long getForumId() {
		return forumId;
	}
	
	public void setForumId(Long forumId) {
		this.forumId = forumId;
	}

	@Override
	public String toString() {
		return "ReplyForumDto [id=" + id + ", content=" + content + ", userId=" + userId + ", forumId=" + forumId
				+ ", writeDate=" + writeDate + "]";
	}
	
}
