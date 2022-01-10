package com.mountain.entity;

public class DifficultyStatisticsDto {
	private Long upper;
	private Long middle;
	private Long lower;
	
	public DifficultyStatisticsDto() {
		super();
	}
	
	public DifficultyStatisticsDto(Long upper, Long middle, Long lower) {
		super();
		this.upper = upper;
		this.middle = middle;
		this.lower = lower;
	}
	
	public Long getUpper() {
		return upper;
	}
	
	public void setUpper(Long upper) {
		this.upper = upper;
	}
	
	public Long getMiddle() {
		return middle;
	}
	
	public void setMiddle(Long middle) {
		this.middle = middle;
	}
	
	public Long getLower() {
		return lower;
	}
	
	public void setLower(Long lower) {
		this.lower = lower;
	}
	
	@Override
	public String toString() {
		return "DifficultyStatisticsDto [upper=" + upper + ", middle=" + middle + ", lower=" + lower + "]";
	}
	
	
}
