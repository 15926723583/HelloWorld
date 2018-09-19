package com.how2java.pojo;

public class BookInfo {
	private String id;
	private String bkgroup;
	private String name;
	private String stat;
	private String by1;
	public BookInfo(){}
	public BookInfo(String name,String bkgroup) {
		this.name = name;
		this.bkgroup = bkgroup;
	}
	public BookInfo(String id, String bkgroup, String name, String stat,String by1) {
		this.id = id;
		this.bkgroup = bkgroup;
		this.name = name;
		this.stat = stat;
		this.by1 = by1;
	}
	public BookInfo(String name, String bkgroup, String by1) {
		this.name = name;
		this.bkgroup = bkgroup;
		this.by1 = by1;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBkgroup() {
		return bkgroup;
	}
	public void setBkgroup(String bkgroup) {
		this.bkgroup = bkgroup;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getBy1() {
		return by1;
	}
	public void setBy1(String by1) {
		this.by1 = by1;
	}
	
}
	
