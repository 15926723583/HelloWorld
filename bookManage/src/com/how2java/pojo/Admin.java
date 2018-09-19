package com.how2java.pojo;

public class Admin {
	private String name;
	private String nam;
	private String pwd;
	public Admin(){}
	public Admin(String nam,String pwd){
		this.nam = nam;
		this.pwd = pwd;
	}
	public Admin(String name,String nam,String pwd){
		this.name = name;
		this.nam = nam;
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNam() {
		return nam;
	}
	public void setNam(String nam) {
		this.nam = nam;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "Admin [name=" + name + ", nam=" + nam + ", pwd=" + pwd + "]";
	}
	
}
