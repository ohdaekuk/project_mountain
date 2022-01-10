package com.mountain.entity;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DifficultyDto {
	private Long id;
	private Long sanId;
	private Long userId;
	private String level;
	private String text;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private LocalDate writeDate;
	
	public DifficultyDto() {
		super();
	}

	public DifficultyDto(Long id, Long sanId, Long userId, String level, String text, LocalDate writeDate) {
		super();
		this.id = id;
		this.sanId = sanId;
		this.userId = userId;
		this.level = level;
		this.text = text;
		this.writeDate = writeDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSanId() {
		return sanId;
	}

	public void setSanId(Long sanId) {
		this.sanId = sanId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public LocalDate getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "DifficultyDto [id=" + id + ", sanId=" + sanId + ", userId=" + userId + ", level=" + level + ", text="
				+ text + ", writeDate=" + writeDate + "]";
	}
	

}
