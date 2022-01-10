package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaDto {
	private Long id;
	private String title;
	private String content;
	private Long userId;
	private MultipartFile image;
	private String img;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	
	public QnaDto() {
		super();
	}

	public QnaDto(Long id, String title, String content, Long userId, MultipartFile image,
			String img, LocalDateTime writeDate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.image = image;
		this.img = img;
		this.writeDate = writeDate;
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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}
	
	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "QnaDto [id=" + id + ", title=" + title + ", content=" + content + ", userId=" + userId + ", writeDate="
				+ writeDate + ", image=" + image + ", img=" + img + "]";
	}
	
	
	
}
