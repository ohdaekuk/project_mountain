package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyQnaAdmin {

	private Long id;
	private String adminId;
	private String content;
	private Long qnaId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	
	public ReplyQnaAdmin() {}

	public ReplyQnaAdmin(Long id, String adminId, String content, Long qnaId, LocalDateTime writeDate) {
		super();
		this.id = id;
		this.adminId = adminId;
		this.content = content;
		this.qnaId = qnaId;
		this.writeDate = writeDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public Long getQnaId() {
		return qnaId;
	}

	public void setQnaId(Long qnaId) {
		this.qnaId = qnaId;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "ReplyQnaAdmin [id=" + id + ", adminId=" + adminId + ", content=" + content + ", qnaId=" + qnaId
				+ ", writeDate=" + writeDate + "]";
	}

}
