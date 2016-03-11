package com.whgghr.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.PayDaoImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Pay;


public class PayAction extends ActionSupport implements ModelDriven<Pay>,ServletRequestAware{
private static final String LIST = "list";
    
    private static final String LOAD="load";
    
    private static final String LIST_LOAD="list_load";
    
    private int uids;
    
    private String pay_month; 
    private String pay_name;
    
    private PayDaoImpl payMgr;
    
    private List<Pay> pays;
    
    private Pay pay;

 // 为了在页面上获取相应的页面信息
 	private PageModel pageModel;
 	
 	// 为了简化页面传递的参数
 	private int page;
 	private int pageSize;
 	
 	private HttpServletRequest request;
 	
	public int getUids() {
		return uids;
	}

	public void setUids(int uids) {
		this.uids = uids;
	}
   
	public void setPayMgr(PayDaoImpl payMgr) {
		this.payMgr = payMgr;
	}

	public List<Pay> getPays() {
		return pays;
	}

	public void setPays(List<Pay> pays) {
		this.pays = pays;
	}

	public Pay getPay() {
		return pay;
	}

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

	public static String getList() {
		return LIST;
	}
     

	public static String getLoad() {
		return LOAD;
	}

	public static String getListLoad() {
		return LIST_LOAD;
	}

	public String getPay_month() {
		return pay_month;
	}

	public void setPay_month(String pay_month) {
		this.pay_month = pay_month;
	}

	public String getPay_name() {
		return pay_name;
	}

	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}

	public String list()throws Exception{// 分页显示信息
//		 List<Pay> list=payMgr.listAll();
// 		 request.setAttribute("list", list);  
 		 this.pageModel = new PageModel();
		   if(page != 0) {
			 this.pageModel.setPage(this.page);
		   }
		  if(pageSize != 0) {
			 this.pageModel.setPageSize(this.pageSize);
		  }
//		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//		  sdf.setLenient(false);
//           Date date1=null;
//           date1=sdf.parse(pay_month);
		  System.out.println("pay_month:"+this.pay_month+"pay_name:"+this.pay_name);
//		 this.pays = payMgr.list(pageModel);
		  
		  this.pays=this.payMgr.list(pageModel,this.pay_month,this.pay_name);
		  return LIST;
     }
	
    public String listAll() throws Exception {			// 列表显示全部的奖惩信息	
		this.pays = payMgr.listAll();
		return LIST;
	  }
    public String delete() throws Exception{
		  this.payMgr.delete((Integer)uids);
		  return LIST_LOAD;
	  }
	 public String add()throws Exception{
			String resultCode=INPUT;
			 if(request.getParameter("emName")==null||request.getParameter("emName")==""){
				 return resultCode;
			 }
			 if(request.getParameter("month")==null||request.getParameter("month")==""){
				 return resultCode;
			 }if(request.getParameter("baseMoney")==null||request.getParameter("baseMoney")==""){
				 return resultCode;
			 }
			 if(request.getParameter("overTime")==null||request.getParameter("overTime")==""){
				 return resultCode;
			 }
			 if(request.getParameter("age")==null||request.getParameter("age")==""){
				 return resultCode;
			 }
			 if(request.getParameter("check")==null||request.getParameter("check")==""){
				 return resultCode;
			 }if(request.getParameter("absent")==null||request.getParameter("absent")==""){
				 return resultCode;
			 }
			 if(request.getParameter("safety")==null||request.getParameter("safety")==""){
				 return resultCode;
			 }
			 else {
				 this.payMgr.add(pay);
				 this.pays = payMgr.listAll();
				 return LOAD;
			}
	     }
	 public String show() throws Exception{
		    this.pay = payMgr.show((Integer)uids);
	    	return LOAD;
	    }
	public Pay getModel() {
		this.pay=new Pay();
		return this.pay;
	}

	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
	}

}
