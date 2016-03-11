package com.whgghr.action;

import java.util.List;

import javax.mail.Flags.Flag;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.InviteJobDAOImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.InviteJob;


public class InviteJobAction extends ActionSupport implements ServletRequestAware,ModelDriven<InviteJob> {
	
	private String id;
	private static final String LIST = "list";
	private static final String SHOW = "show";
	private static final String LIST_LOAD = "list_load";
	
	private HttpServletRequest request;
	
	private InviteJobDAOImpl inviteJobMgr;
	private InviteJob inviteJobDto;
	private List<InviteJob> inviteJobs;
	
	private PageModel pageModel;
	
	private int page;
	private int pageSize;
	
	private String msg;
	
	public InviteJobDAOImpl getInviteJobMgr() {
		return inviteJobMgr;
	}

	public void setInviteJobMgr(InviteJobDAOImpl inviteJobMgr) {
		this.inviteJobMgr = inviteJobMgr;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
		return this.pageModel;
	}
	
	public InviteJob getInviteJobDto() {
		return inviteJobDto;
	}

	public List<InviteJob> getInviteJobs() {
		return inviteJobs;
	}
	
	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String list() throws Exception {		
		 List<InviteJob> list=inviteJobMgr.listAll();
 		 request.setAttribute("list1", list);  
		this.pageModel = new PageModel();
		if(page != 0) {
			this.pageModel.setPage(this.page);
		}
		if(pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
			
		this.inviteJobs = inviteJobMgr.list(pageModel);
		
		return LIST;
	}
	
	public String listAll() throws Exception {			
		this.inviteJobs = inviteJobMgr.listAll();
		
		return LIST;
	}
	
	public String queryOne() {    
		
		inviteJobDto = inviteJobMgr.find(Integer.parseInt(request.getParameter("id")));
		
		return SHOW;
	}

     public String del() throws Exception {
		
		this.inviteJobMgr.del(Integer.parseInt(request.getParameter("id")));
		return LIST_LOAD;
	 }
     
     public String employ() throws Exception {//
    	System.out.println(id);
 		this.inviteJobMgr.modify(Integer.parseInt(request.getParameter("id")));
 		return LIST_LOAD;
 	 }

     public String add()throws Exception{
 		String resultCode=INPUT;
 		if (request.getParameter("name")==null||request.getParameter("name")=="")
 		 {
 			 return resultCode;
 		 }
 		if (request.getParameter("born")==null||request.getParameter("born")=="")
		 {
			 return resultCode;
		 }
 		if (request.getParameter("createTime")==null||request.getParameter("createTime")=="")
		 {
			 return resultCode;
		 }
 		 else {
 			 String type1=request.getParameter("InviteJob");
 			 System.out.println("---------+:"+type1);
 			 this.inviteJobMgr.add(inviteJobDto);
 			 this.inviteJobs = inviteJobMgr.listAll();
 			 return "show";
 		}
}

	@Override
	public InviteJob getModel() {
		this.inviteJobDto=new InviteJob();
		return this.inviteJobDto;
	}
}