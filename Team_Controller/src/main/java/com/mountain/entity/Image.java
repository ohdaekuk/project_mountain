package com.mountain.entity;

import org.springframework.web.multipart.MultipartFile;

public class Image {
	private MultipartFile image;

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
}
