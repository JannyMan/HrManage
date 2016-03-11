package com.whgghr.hrm.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;

public class DepartmentDaoImpl implements DepartmentDAO{

    private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Department dep;
	
	
	public Department getDep() {
		return dep;
	}

	public void setDep(Department dep) {
		this.dep = dep;
	}
	public Department add(Department department) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(department);
		session.getTransaction().commit();
		return department;
	}

	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}
	public List<Department> listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Department> dep = null;
		dep = session.createQuery("from Department").list();
		return dep;
	}

	public List<Department> list(PageModel page) {
		String hqlcount="select count(*) from Department";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Department> dep1 = null;
		dep1 = session.createQuery("from Department")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return dep1;
	}

	public Department show(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Department dep=(Department)session.load(Department.class, ids);
		return dep;
	}

	public void delete(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("delete Department t where t.id="+ids);
		query.executeUpdate();
		session.getTransaction().commit();
	}
}
