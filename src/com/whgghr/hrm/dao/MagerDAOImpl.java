package com.whgghr.hrm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Manager;

public class MagerDAOImpl implements MagerDAO{
private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Manager update(Manager manager) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(manager);
		session.getTransaction().commit();
		return manager;
	}

	public List<Manager> listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Manager> managers = null;
		managers = session.createQuery("from Manager").list();
		return managers;
	}

	public Manager show(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Manager mgr=(Manager)session.load(Manager.class, ids);
		return mgr;
	}

	public Manager load(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Manager mgr=(Manager)session.load(Manager.class, ids);
		return mgr;
	}
     
	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}
	public List<Manager> list(PageModel page) {
		String hqlcount="select count(*) from Manager";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Manager> managers = null;
		managers = session.createQuery("from Manager")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return managers;
		
	}

	public Manager add(Manager manager) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(manager);
		session.getTransaction().commit();
		return manager;
	}

	public void delete(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("delete Manager m where m.id="+ids);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	public List<Manager> check(String account) {
		List<Manager> manager = null;
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		manager=session.createQuery("from Manager where account='"+account+"'").list();
		return manager;
	}
}
