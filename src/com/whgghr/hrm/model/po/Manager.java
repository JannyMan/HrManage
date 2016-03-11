package com.whgghr.hrm.model.po;

public class Manager {

	private int id;
	private String account;
	private String pwd;
	private String managerLevel;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getManagerLevel() {
		return managerLevel;
	}
	public void setManagerLevel(String managerLevel) {
		this.managerLevel = managerLevel;
	}
}
