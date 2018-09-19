package com.how2java.pojo;

public class BorrowHis {
	private String bkid;
	private String bkname;
	private String usid;
	private String usname;
	private String ustel;
	private String betime;
	private String endtime;
	private String isgui;	
	private String id;
	public BorrowHis() {}
	public BorrowHis(String bkid, String bkname,String betime, String endtime,String id) {
		this.bkid = bkid;
		this.bkname = bkname;
		this.betime = betime;
		this.endtime = endtime;
		this.id = id;
	}
	public BorrowHis(String bkname,String usname,String isgui) {
		this.bkname = bkname;
		this.usname = usname;
		this.isgui = isgui;
	}
		
	public BorrowHis(String bkid, String bkname,String betime, String endtime, String isgui,String id) {
		this.bkid = bkid;
		this.bkname = bkname;
		this.betime = betime;
		this.endtime = endtime;
		this.isgui = isgui;
		this.id = id;
	}
	public BorrowHis(String bkid, String bkname, String usid, String usname,String ustel, String betime, String endtime, String isgui,String id) {
		this.bkid = bkid;
		this.bkname = bkname;
		this.usid = usid;
		this.usname = usname;
		this.ustel = ustel;
		this.betime = betime;
		this.endtime = endtime;
		this.isgui = isgui;
		this.id = id;
	}
	public String getBkid() {
		return bkid;
	}
	public void setBkid(String bkid) {
		this.bkid = bkid;
	}
	public String getBkname() {
		return bkname;
	}
	public void setBkname(String bkname) {
		this.bkname = bkname;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getUsname() {
		return usname;
	}
	public void setUsname(String usname) {
		this.usname = usname;
	}
	public String getUstel() {
		return ustel;
	}
	public void setUstel(String ustel) {
		this.ustel = ustel;
	}
	public String getBetime() {
		return betime;
	}
	public void setBetime(String betime) {
		this.betime = betime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getIsgui() {
		return isgui;
	}
	public void setIsgui(String isgui) {
		this.isgui = isgui;
	}
}
