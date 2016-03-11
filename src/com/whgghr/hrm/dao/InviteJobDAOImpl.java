package com.whgghr.hrm.dao;

import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Employee;
import com.whgghr.hrm.model.po.InviteJob;

public class InviteJobDAOImpl implements InviteJobDAO {
	 private SessionFactory sessionFactory;
		
		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}

	public InviteJob add(InviteJob inviteJob) {
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			session.save(inviteJob);
			session.getTransaction().commit();
			return inviteJob;
	}

	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}

	public boolean del(int id) {
		boolean flag = false;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		InviteJob injo = new InviteJob();
		injo.setId(id);
		session.delete(injo);
		session.getTransaction().commit();	
		flag = true;
		return flag;
		
	}

	public InviteJob find(int id) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		InviteJob iniJob=(InviteJob)session.load(InviteJob.class, id);
		return iniJob;
	}

	public List<InviteJob> list(PageModel page) {
		
		String hqlcount="select count(*) from InviteJob";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<InviteJob> inviteJobs = null;
		inviteJobs = session.createQuery("from InviteJob")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return inviteJobs;
		
	}

	public List<InviteJob> listAll() {
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<InviteJob> invit = null;
			invit = session.createQuery("from InviteJob").list();
		return invit;
		
	}
	public InviteJob modify(int id) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		InviteJob invite=(InviteJob)session.get(InviteJob.class, id);
		invite.setIsstock("1");
		
		
		List<Employee> emp = null;
		emp = session.createQuery("from Employee").list();
		
		Employee employee = new Employee();
		employee.setId(String.valueOf(emp.size()+1));//
		employee.setName(invite.getName());
		employee.setSex(invite.getSex());
		employee.setAge(invite.getAge());
		//employee.setIDCard();
		//employee.setBz();
		//employee.setCreateName();
		employee.setCreateTime(new Date());
		employee.setTypeWork(invite.getJob());
		employee.setStartTime(new Date());
		employee.setCulture(invite.getTeachSchool());
		employee.setSpeciality(invite.getSpecialty());
		employee.setAfterSchool(invite.getAfterSchool());
		employee.setAddress(invite.getAddress());
		employee.setTel(invite.getTel());
		//employee.setAncestralHome();
		//employee.setVisage();
		//employee.setMarriage();
		employee.setBorn(invite.getBorn());
		//employee.setNation();
		//employee.setDepart();
		
		session.save(employee);
		session.getTransaction().commit();
		return invite;
	}

}
