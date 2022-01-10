package com.mountain.entity;

public class GuSanDto {
	private Long guId;
	private Long sanId;
	
	public GuSanDto() {
		super();
	}

	public GuSanDto(Long guId, Long sanId) {
		super();
		this.guId = guId;
		this.sanId = sanId;
	}

	public Long getGuId() {
		return guId;
	}

	public void setGuId(Long guId) {
		this.guId = guId;
	}

	public Long getSanId() {
		return sanId;
	}

	public void setSanId(Long sanId) {
		this.sanId = sanId;
	}

	@Override
	public String toString() {
		return "GuSanDto [guId=" + guId + ", sanId=" + sanId + "]";
	}
	
	
}
