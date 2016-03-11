package com.whgghr.hrm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;

import com.whgghr.hrm.model.po.Train;

public class TrainDAOImpl implements TrainDAO {
   private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public Train add(Train train) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(train);
		session.getTransaction().commit();
		return train;
	}

	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}

	public void delete(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("delete Train t where t.id="+ids);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	public List<Train> list(PageModel page) {
		String hqlcount="select count(*) from Train";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Train> trains = null;
			trains = session.createQuery("from Train")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return trains;
	}

	public Train show(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Train tan=(Train)session.load(Train.class, ids);
		return tan;
	}

	public List<Train> listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Train> trains = null;
			trains = session.createQuery("from Train").list();
		return trains;
	}

}
