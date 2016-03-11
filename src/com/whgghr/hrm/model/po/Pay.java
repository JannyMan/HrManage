package com.whgghr.hrm.model.po;

import java.util.Date;

public class Pay {
	private int id;
	private String emName;
	private String month;
	private Float baseMoney;
	private Integer overTime;
	private String safety;
	private String absent;
	private String check;
	private Integer age;
	private Employee emp;
	
	private Integer em_serialNumber;
	public Integer getEm_serialNumber() {
		return em_serialNumber;
	}
	public void setEm_serialNumber(Integer em_serialNumber) {
		this.em_serialNumber = em_serialNumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmName() {
		return emName;
	}
	public void setEmName(String emName) {
		this.emName = emName;
	}
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	public String getSafety() {
		return safety;
	}
	public void setSafety(String safety) {
		this.safety = safety;
	}
	public String getAbsent() {
		return absent;
	}
	public void setAbsent(String absent) {
		this.absent = absent;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	public Float getBaseMoney() {
		return baseMoney;
	}
	public void setBaseMoney(Float baseMoney) {
		this.baseMoney = baseMoney;
	}
	public Integer getOverTime() {
		return overTime;
	}
	public void setOverTime(Integer overTime) {
		this.overTime = overTime;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}	
}
