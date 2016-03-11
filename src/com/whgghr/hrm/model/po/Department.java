package com.whgghr.hrm.model.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Department {

	private int id;
	private Date createTime;
	private String name;
	private String bz;
//	private Set<Employee> emps;
	private Set<Employee> emps;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public Set<Employee> getEmps() {
		return emps;
	}
	public void setEmps(Set<Employee> emps) {
		this.emps = emps;
	}
}
