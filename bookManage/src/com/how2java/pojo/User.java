package com.how2java.pojo;

public class User {
	private String id;
	private String name;
	private String nam;
	private String pwd;
	private String num;
	private String tel;
	public User(){}
	public User(String id) {
		this.id = id;
	}
	//登陆
	public User(String nam, String pwd) {
		this.nam = nam;
		this.pwd = pwd;
	}
	//注册
	public User(String name, String nam, String pwd, String tel) {
		this.name = name;
		this.nam = nam;
		this.pwd = pwd;
		this.tel = tel;
	}
	public User(String id,String name,String tel) {
		this.id = id;
		this.name = name;
		this.tel = tel;
	}
	public User(String id,String name,String nam,String pwd,String num,String tel) {
		this.id = id;
		this.name = name;
		this.nam = nam;
		this.pwd = pwd;
		this.num = num;
		this.tel = tel;
	}
	public User(String id,String name,String nam,String pwd,String tel) {
		this.id = id;
		this.name = name;
		this.nam = nam;
		this.pwd = pwd;
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", nam=" + nam + ", pwd=" + pwd + ", num=" + num + ", tel=" + tel
				+ "]";
	}	
	
}
