package com.whgghr.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.CjDaoImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.CJ;

public class RewardsandPunishmentsAction extends ActionSupport implements
		ModelDriven<CJ> ,ServletRequestAware{
	private static final String LIST = "list";

	private static final String LOAD = "load";

	private static final String LIST_LOAD = "list_load";

	private int uids;
	
	private HttpServletRequest request;

	private CjDaoImpl cjmanager;

	private List<CJ> cjs;

	private CJ cj;

	// 为了在页面上获取相应的页面信息
	private PageModel pageModel;

	// 为了简化页面传递的参数
	private int page;
	private int pageSize;

	private String type1;
	public PageModel getPageModel() {
		return pageModel;
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

	public int getUids() {
		return uids;
	}

	public void setUids(int uids) {
		this.uids = uids;
	}

	public void setCjmanager(CjDaoImpl cjmanager) {
		this.cjmanager = cjmanager;
	}


	public List<CJ> getCjs() {
		return cjs;
	}

	public CJ getCj() {
		return cj;
	}

	public static String getList() {
		return LIST;
	}

	public static String getLoad() {
		return LOAD;
	}

	public static String getListLoad() {
		return LIST_LOAD;
	}
	
	public String getType1() {
		return type1;
	}


	public void setType1(String type1) {
		this.type1 = type1;
	}


	public String list() throws Exception {// 分页显示信息
//		List<CJ> list=cjmanager.listAll();
//		request.setAttribute("type", list);
		this.pageModel = new PageModel();
		if (page != 0) {
			this.pageModel.setPage(this.page);
		}
		if (pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		this.cjs = cjmanager.list(pageModel);
		  System.out.println("pageModel.page: " + pageModel.getPage());
		  System.out.println("pageModel.count: " + pageModel.getCount());
		  System.out.println("pageModel.pageSize: " + pageModel.getPageSize());
		  System.out.println("pageModel.pageCount: " + pageModel.getPageCount());
		  return LIST;
	}

	public String listAll() throws Exception { // 列表显示全部的奖惩信息
		this.cjs = cjmanager.listAll();
		return LIST;
	}

	public String show() throws Exception {
		this.cj = cjmanager.show((Integer) uids);
		return LOAD;
	}

	public String delete() throws Exception {
		this.cjmanager.delete((Integer) uids);
		return LIST_LOAD;
	}

	public String add() throws Exception {
		String resultCode = INPUT;
		if(request.getParameter("title")==null||request.getParameter("title")==""){
			 return resultCode;
		 } 
		if(request.getParameter("money")==null||request.getParameter("money")==""){
			 return resultCode;
		 } 
		 if(request.getParameter("time")==null||request.getParameter("time")==""){
			 return resultCode;
		 }
		else {
			this.cjmanager.add(cj);
			this.cjs = cjmanager.listAll();
			return LOAD;
		}
	}

	public CJ getModel() {
		this.cj = new CJ();
		return this.cj;
	}

	public void setServletRequest(HttpServletRequest req) {
		this.request=req;
	}
	public String find() throws Exception {
		this.pageModel = new PageModel();
		if (page != 0) {
			this.pageModel.setPage(this.page);
		}
		if (pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		String type = request.getParameter("type").trim();
		System.out.println("type11: " + type);
		this.cjs=this.cjmanager.find(pageModel,type);
		request.setAttribute("type", type);
//		request.getAttribute("type",type)
		System.out.println("type22: " + type);
		return "find";
	 }
}