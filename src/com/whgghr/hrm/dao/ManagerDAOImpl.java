package com.whgghr.hrm.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.whgghr.hrm.model.po.Manager;

public class ManagerDAOImpl implements ManagerDAO {
    
private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * login方法进行登录的处理
	 * */
	public String login(Manager manager){
		Session session=sessionFactory.openSession();
		session.beginTransaction();
				Query query=session.createQuery("from Manager where account='" + manager.getAccount()+ "'and pwd='" + manager.getPwd()+ "'");
				
			   List list=query.list();
				           if(list!= null&&list.size()==1)
				           {  
				               return "success";
				               }
				           else 
				              return "error";
	}

}
