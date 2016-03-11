package com.whgghr.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.DepartmentDaoImpl;
import com.whgghr.hrm.dao.EmployeeDAOImpl;
import com.whgghr.hrm.dao.util.GetAutoNumber;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;
import com.whgghr.hrm.model.po.Employee;

public class EmployeeAction extends ActionSupport implements
		ModelDriven<Employee>, ServletRequestAware {
	private static final String LIST = "list";

	private static final String LOAD = "load";

	private static final String LIST_LOAD = "list_load";

	private String uids;
	
	private DepartmentDaoImpl departmentMgr;
	
	private List<Department> departments;
	
	private Department department;

	private EmployeeDAOImpl employeeMgr;

	private List<Employee> employees;
	
	private Employee employee;

	private HttpServletRequest request;

	private PageModel pageModel;

	private int page;
	
	private int pageSize;

	

	public static String getList() {
		return LIST;
	}

	public String listAll() throws Exception { 
		List<Employee> list1 = employeeMgr.listAll();
		request.setAttribute("list1", list1);
		this.employees = employeeMgr.listAll();
		return LIST;
	}

	

	public static String getLoad() {
		return LOAD;
	}

	public static String getListLoad() {
		return LIST_LOAD;
	}

	public String add() throws Exception {
		if (request.getParameter("name")==null||request.getParameter("name")=="") {
			return "input";
		}
		 if(request.getParameter("age")==null||request.getParameter("age")==""){
			 return "input";
		 }
		 if(request.getParameter("IDCard")!=request.getParameter("IDCard")){
			 return "input";
		 }
		 if(request.getParameter("startTime")==null||request.getParameter("startTime")==""){
			 return "input";
		 }
		 if(request.getParameter("tel")==null||request.getParameter("tel")==""){
			 return "input";
		 }
		 if(request.getParameter("visage")==null||request.getParameter("visage")==""){
			 return "input";
		 }
		 if(request.getParameter("born")!=request.getParameter("born")){
			 return "input";
		 }
		else {
			this.employeeMgr.add(employee);
			this.employees = employeeMgr.listAll();
			return "query";
		}
	}

	

	public String show() throws Exception {
		System.out.println("34234434" + uids);
		this.employee = employeeMgr.show(Integer.parseInt(uids));
		return "query";
	}

	public void setServletRequest(HttpServletRequest req) {
		this.request = req;

	}

	public String list() throws Exception {
		this.departments = employeeMgr.dep_listAll();
		
		this.pageModel = new PageModel();
		if (page != 0) {
			this.pageModel.setPage(this.page);
		}
		if (pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		this.employees = employeeMgr.list(pageModel);
		System.out.println("pageModel.page: " + pageModel.getPage());
		System.out.println("pageModel.count: " + pageModel.getCount());
		System.out.println("pageModel.pageSize: " + pageModel.getPageSize());
		System.out.println("pageModel.pageCount: " + pageModel.getPageCount());
		return LIST;
	}
	
	public String delete() throws Exception {
		this.employeeMgr.delete(Integer.parseInt(uids));
		return LIST_LOAD;
	}
	public String update() throws Exception {
		String resultCode = INPUT;
		if (request.getParameter("name")==null||request.getParameter("name")=="") {
			return resultCode;
		} else {
			this.employee = this.employeeMgr.update(employee.getEdtid(),employee);
			return "query";
		}
	}
	
	public String load() throws Exception {
		this.departments = employeeMgr.dep_listAll();
		this.employee = employeeMgr.Load(Integer.parseInt(uids));
		return LOAD;
	}
	
	public String forwardadd() throws Exception {
		List<Employee> employee =  employeeMgr.listAll();
		String autoNumber = "1";
		if (employee.size() != 0) {
			Employee employeeform = (Employee) employee.get(employee.size()-1);
			Integer serialNumber = Integer.valueOf(employeeform.getId()) + 1;
			autoNumber = String.valueOf(serialNumber);
		}
		autoNumber = GetAutoNumber.getMaxNuber(autoNumber);
		request.setAttribute("autoNumber", autoNumber);
		this.departments = employeeMgr.dep_listAll();
		return "input";
	}
	
	
	//按部门查询
	public String depsel(){
		this.departments = employeeMgr.dep_listAll();
		this.pageModel = new PageModel();
		if (page != 0) {
			this.pageModel.setPage(this.page);
		}
		if (pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		this.employees = employeeMgr.list(pageModel,Integer.parseInt(uids));
		setUids(uids);
		return "find";
	}
	
	
	public Employee getModel() {
		this.employee = new Employee();
		return this.employee;
	}
	
	
	
	public String getUids() {
		return uids;
	}
	public void setUids(String uids) {
		this.uids = uids;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public DepartmentDaoImpl getDepartmentMgr() {
		return departmentMgr;
	}
	public void setDepartmentMgr(DepartmentDaoImpl departmentMgr) {
		this.departmentMgr = departmentMgr;
	}
	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}
	public List<Department> getDepartments() {
		return departments;
	}
	public PageModel getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel pageModel) {
		this.pageModel = pageModel;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setEmployeeMgr(EmployeeDAOImpl employeeMgr) {
		this.employeeMgr = employeeMgr;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public Employee getEmployee() {
		return employee;
	}
}