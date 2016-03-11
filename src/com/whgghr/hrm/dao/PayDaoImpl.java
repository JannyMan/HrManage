package com.whgghr.hrm.dao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Pay;

public class PayDaoImpl implements PayDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Pay> listAll() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Pay> pays = null;
		pays = session.createQuery("from Pay").list();
		return pays;
	}

	public List<Pay> list(PageModel page) {
		String hqlcount = "select count(*) from Pay";
		long count = this.count(hqlcount);
		page.setCount(count);
		int pageCount = page.getPageCount();
		int start = (page.getPage() - 1) * page.getPageSize();

		Session session = sessionFactory.openSession();
		session.beginTransaction();
		List<Pay> pays = null;
		pays = session.createQuery("from Pay").setFirstResult(start)
				.setMaxResults(page.getPageSize()).list();
		return pays;
	}

	public long count(String hql) {
		long count = 0;
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		count = (Long) session.createQuery(hql).list().get(0);
		session.getTransaction().commit();
		return count;
	}

	public Pay add(Pay pay) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(pay);
		session.getTransaction().commit();
		return pay;
	}

	public void delete(int payid) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = session.createQuery("delete Pay pay where pay.id="
				+ payid);
		query.executeUpdate();
		session.getTransaction().commit();
	}

	public Pay show(int payid) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Pay pay = (Pay) session.load(Pay.class, payid);
		return pay;
	}

	public List<Pay> list(PageModel page, String pay_month, String pay_name) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		StringBuffer sb1 = new StringBuffer("select Count(*) from Pay p");
		StringBuffer sbConditions = new StringBuffer(
				" where p.month like ? and p.emName like ?");
		List<Pay> pay = null;
		StringBuffer sb2 = new StringBuffer("select p from Pay p");
		if (pay_month == null || pay_name == null) {
			pay_month = "";
			pay_name = "";
			long count = (Long) session.createQuery(sb1.append(sbConditions).toString())
					.setParameter(0, "%" + pay_month + "%")
					.setParameter(1, "%" + pay_name + "%")
					.list().get(0);
			page.setCount(count);
			int PageCount = page.getPageCount();
			int start = (page.getPage() - 1) * page.getPageSize();
			pay = session.createQuery(sb2.append(sbConditions).toString())
					.setFirstResult(start)
					.setParameter(0, "%" + pay_month + "%")
					.setParameter(1, "%" + pay_name + "%")
					.setMaxResults(page.getPageSize()).list();
		} else {
			long count = (Long) session.createQuery(sb1.append(sbConditions).toString())
					.setParameter(0, "%" + pay_month + "%")
					.setParameter(1, "%" + pay_name + "%")
					.list().get(0);
			page.setCount(count);
			int PageCount = page.getPageCount();
			int start = (page.getPage() - 1) * page.getPageSize();
			pay = session.createQuery(sb2.append(sbConditions).toString())
					.setFirstResult(start)
					.setParameter(0, "%" + pay_month + "%")
					.setParameter(1, "%" + pay_name + "%")
					.setMaxResults(page.getPageSize()).list();
		}
		return pay;
	}
}
