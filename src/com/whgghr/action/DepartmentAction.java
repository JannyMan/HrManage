package com.whgghr.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.DepartmentDAO;
import com.whgghr.hrm.dao.DepartmentDaoImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;

public class DepartmentAction extends ActionSupport implements ModelDriven<Department>,ServletRequestAware{

	private HttpServletRequest request;
	
    private static final String LIST = "list";
    
    private static final String LOAD="load";

	private static final String LOAD_LOAD ="load_load";
	
	private DepartmentDaoImpl departmentMgr;
	
	private List<Department> departments;
	
	private Department department;
	
	private PageModel pageModel;
	
	private int page;
	private int pageSize;
	
	private int uids;

	private String msg;
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public int getUids() {
		return uids;
	}
	public void setUids(int uids) {
		this.uids = uids;
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
	public PageModel getPageModel() {
		return pageModel;
	}
    
	public void setDepartmentMgr(DepartmentDaoImpl departmentMgr) {
		this.departmentMgr = departmentMgr;
	}
	public DepartmentDaoImpl getDepartmentMgr() {
		return departmentMgr;
	}
	public List<Department> getDepartments() {
		return departments;
	}

	public static String getList() {
		return LIST;
	}
	
    public static String getLoad() {
		return LOAD;
	}
    
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	public static String getListLoad() {
		return LOAD_LOAD;
	}
	public String list() throws Exception {		
		this.pageModel = new PageModel();
		if(page != 0) {
			this.pageModel.setPage(this.page);
		}
		if(pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		this.departments = departmentMgr.list(pageModel);	
		return LIST;
	}
	public String listAll() throws Exception {			
		this.departments = departmentMgr.listAll();
		return LIST;
	}
	 public String show() throws Exception{
		 this.department = departmentMgr.show((Integer)uids);
	    	return LOAD;
	    }
	 
	 public String delete() throws Exception{
		  this.departmentMgr.delete((Integer)uids);
		  return "list_load";
	  }
	 public String add()throws Exception{
		 System.out.println("---------1"+this.department.getName());
		 if(request.getParameter("name")==""||request.getParameter("name")==null){
			 return "input";
		 }
		 else {
			 this.departmentMgr.add(department);
			 this.departments = departmentMgr.listAll();
			 return LOAD;
			 
		}
	 }
	public Department getModel() {
		this.department=new Department();
		return this.department;
	}
	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
		
	}
}
