package com.whgghr.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.whgghr.hrm.dao.TrainDAOImpl;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Train;


public class TrainAction extends ActionSupport implements ModelDriven<Train>,ServletRequestAware{
	    private static final String LIST = "list";
	    private static final String LOAD="load";
	 
	    private static final String LIST_LOAD="list_load";

		private static final String LOAD_LOAD ="load_load";
		
		private TrainDAOImpl traindao; 
		
		private List<Train> trains;
		
		private Train train;
		
		private HttpServletRequest request;
	
	private PageModel pageModel;
	
	private int page;
	private int pageSize;
	private int uids;

	public TrainDAOImpl getTraindao() {
		return traindao;
	}

	public void setTraindao(TrainDAOImpl traindao) {
		this.traindao = traindao;
	}

	public List<Train> getTrains() {
		return trains;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
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

	public int getUids() {
		return uids;
	}

	public void setUids(int uids) {
		this.uids = uids;
	}

	public static String getList() {
		return LIST;
	}

	public static String getLoad() {
		return LOAD;
	}

	public static String getLoadLoad() {
		return LOAD_LOAD;
	}
	

	public static String getListLoad() {
		return LIST_LOAD;
	}

	public Train getModel() {
		// TODO Auto-generated method stub
		this.train=new Train();
		return this.train;
	}
	public String listAll() throws Exception {			// �б���ʾȫ������Ƹ��Ϣ	
		this.trains = traindao.listAll();
		return LIST;
	}
	public String list() throws Exception {		// ��ҳ��ʾ��Ϣ
		this.pageModel = new PageModel();
		if(page != 0) {
			this.pageModel.setPage(this.page);
		}
		if(pageSize != 0) {
			this.pageModel.setPageSize(this.pageSize);
		}
		this.trains = traindao.list(pageModel);
		return LIST;
	}
	
	public String show() throws Exception{
		this.train = traindao.show((Integer)uids);
    	return LOAD;
	}
	
	public String delete() throws Exception{
		this.traindao.delete((Integer)uids);
		return LIST_LOAD;
	}
	public String add()throws Exception{
		System.out.println(train.getTime()+"ssssssssssssssssssssss");
		String resultCode=INPUT;
		if(request.getParameter("man")==null||request.getParameter("man")==""){
			 return resultCode;
		 }
		if(request.getParameter("time")==null||request.getParameter("time")==""){
			 return resultCode;
		 } 
		 if(request.getParameter("join")==null||request.getParameter("join")==""){
			 return resultCode;
		 }
		 
		 else {
			 this.traindao.add(train);
			 this.trains = traindao.listAll();
			 return LOAD;
		}
     }

	public void setServletRequest(HttpServletRequest req) {
		this.request=req;
		
	}
	}
