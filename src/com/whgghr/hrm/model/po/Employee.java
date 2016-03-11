package com.whgghr.hrm.model.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;

public class Employee {
	
	private String id;
	private int serialNumber;
	private String name;
	private String sex;
	private String age;
	private String IDCard;
	private String bz;
	private String createName;
	private Date createTime;
	private String typeWork;
	private Integer edtid;
	private Date startTime;
	private String culture;
	private String speciality;
	private String afterSchool;
	private String address;
	private String tel;
	private String ancestralHome;
	private String visage;
	private String marriage;
	private String nation="汉族";
	private Date born;
	private Department depart;
	private Set<Pay> pay = new HashSet<Pay>();
	
	
	public Set<Pay> getPay() {
		return pay;
	}
	public void setPay(Set<Pay> pay) {
		this.pay = pay;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
		public Integer getEdtid() {
		return edtid;
	}
	public void setEdtid(Integer edtid) {
		this.edtid = edtid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIDCard() {
		return IDCard;
	}
	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getTypeWork() {
		return typeWork;
	}
	public void setTypeWork(String typeWork) {
		this.typeWork = typeWork;
	}
	public String getCulture() {
		return culture;
	}
	public void setCulture(String culture) {
		this.culture = culture;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getAfterSchool() {
		return afterSchool;
	}
	public void setAfterSchool(String afterSchool) {
		this.afterSchool = afterSchool;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAncestralHome() {
		return ancestralHome;
	}
	public void setAncestralHome(String ancestralHome) {
		this.ancestralHome = ancestralHome;
	}
	public String getVisage() {
		return visage;
	}
	public void setVisage(String visage) {
		this.visage = visage;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getCreateName() {
		return createName;
	}
	public void setCreateName(String createName) {
		this.createName = createName;
	}
	public Department getDepart() {
		return depart;
	}
	public void setDepart(Department depart) {
		this.depart = depart;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getBorn() {
		return born;
	}
	public void setBorn(Date born) {
		this.born = born;
	}
	
//	public Set<Pay> getPay() {
//		return pay;
//	}
//	public void setPay(Set<Pay> pay) {
//		this.pay = pay;
//	}
}
