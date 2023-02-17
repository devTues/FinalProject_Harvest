package com.itwillbs.domain;

public class ProjectListDTO {
	
	private String category;
	private String search;
	private String state;
	private String percent;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	@Override
	public String toString() {
		return "ProjectListDTO [category=" + category + ", search=" + search + ", state=" + state + ", percent="
				+ percent + "]";
	}
	
	

}
