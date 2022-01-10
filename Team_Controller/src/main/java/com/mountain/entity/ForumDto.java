package com.mountain.entity;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ForumDto {
	private Long id;
	private String title;
	private String content;
	private Long userId;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime writeDate;
	private MultipartFile image;
	private String img;
	
	public ForumDto() {}

	public ForumDto(Long id, String title, String content, Long userId, LocalDateTime writeDate, MultipartFile image,
			String img) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.writeDate = writeDate;
		this.image = image;
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

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
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

	@Override
	public String toString() {
		return "ForumDto [id=" + id + ", title=" + title + ", content=" + content + ", userId=" + userId
				+ ", writeDate=" + writeDate + ", image=" + image + ", img=" + img + "]";
	}
}