package com.whgghr.action;
import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;
import com.whgghr.hrm.dao.ManagerDAOImpl;
import com.whgghr.hrm.model.po.Manager;
public class FindUserAction extends ActionSupport{
   private Manager mgr;
   private ManagerDAOImpl managerdao;
   
   private String _result;
   
  
   
  public void setManagerdao(ManagerDAOImpl managerdao) {
	this.managerdao = managerdao;
}

public String get_result() {
	return _result;
}

public void set_result(String _result) {
	this._result = _result;
}

public void setMgr(Manager mgr) {
	this.mgr = mgr;
}

public ManagerDAOImpl getManagerdao() {
	return managerdao;
}

public Manager getMgr() {
	return mgr;
}
/**
 * 定义一个execute方法，调用登录的方法
 * */
   public String execute()throws Exception{
	
	/* System.out.println(_result);*/
		_result=this.managerdao.login(mgr);
	     return _result;
	
   } 

  }

