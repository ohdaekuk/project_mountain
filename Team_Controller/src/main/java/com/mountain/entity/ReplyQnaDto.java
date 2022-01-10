package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyQnaDto {
	private Long id;
	private Long qnaId;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	private Long adminId;
	
	public ReplyQnaDto() {
		super();
	}
	
	public ReplyQnaDto(Long id, Long qnaId, String content, LocalDateTime writeDate, Long adminId) {
		super();
		this.id = id;
		this.qnaId = qnaId;
		this.content = content;
		this.writeDate = writeDate;
		this.adminId = adminId;
	}
	
	
	public Long getAdminId() {
		return adminId;
	}

	public void setAdminId(Long adminId) {
		this.adminId = adminId;
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
	
	public Long getQnaId() {
		return qnaId;
	}
	
	public void setQnaId(Long qnaId) {
		this.qnaId = qnaId;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ReplyQnaDto [id=" + id + ", qnaId=" + qnaId + ", content=" + content + ", writeDate=" + writeDate
				+ ", adminId=" + adminId + "]";
	}
}
