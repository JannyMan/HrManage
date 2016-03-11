package com.whgghr.hrm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.CJ;
public class CjDaoImpl implements CjDAO{
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public CJ show(int cjid) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		CJ cj=(CJ)session.load(CJ.class, cjid);
		return cj;
	}

	public List<CJ> listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<CJ> cjs = null;
		cjs = session.createQuery("from CJ").list();
		return cjs;
	}

	public List<CJ> list(PageModel page) {
		String hqlcount="select count(*) from CJ";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<CJ> cj = null;
		cj = session.createQuery("from CJ order by id asc")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return cj;
	}

	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}

	public CJ add(CJ cj) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(cj);
		session.getTransaction().commit();
		return cj;
	}

	public void delete(int cjid) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("delete CJ cj where cj.id="+cjid);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	public List<CJ> find(PageModel page,String type) {
			String hqlCount = "select count(*) from CJ where type="+type;
			long count=this.count(hqlCount);
			page.setCount(count);
			int pageCount=page.getPageCount();
			int start=(page.getPage()-1) * page.getPageSize();
			
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			 List<CJ> cj = null;
	         StringBuffer sb2=new StringBuffer("select c from CJ c");
	  		StringBuffer sbConditions=new StringBuffer(" where c.type= '"+type+"' order by id asc");
	  			cj=session.createQuery(sb2.append(sbConditions).toString())
	  					.setFirstResult(start).
//	  					.setParameter(0,type).
	  					setMaxResults(page.getPageSize()).list();
			return cj;
	}
}
