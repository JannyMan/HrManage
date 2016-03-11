package com.whgghr.hrm.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;
import com.whgghr.hrm.model.po.Employee;

public class EmployeeDAOImpl implements EmployeeDAO{
private SessionFactory sessionFactory;
	public Employee emp;
	public Employee getEmp() {
		return emp;
	}
	public void setEmp(Employee emp) {
		this.emp = emp;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public List<Employee> listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Employee> emp = null;
		emp = session.createQuery("from Employee").list();
		return emp;
	}
	

	public Employee add(Employee employee) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(employee);
		session.getTransaction().commit();
		return employee;
	}

	public Employee show(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Employee emp=(Employee)session.load(Employee.class, ids);
		return emp;
	}

	public List<Employee> list(PageModel page) {
		String hqlcount="select count(*) from Employee";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Employee> emp = null;
		emp = session.createQuery("from Employee")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return emp;
	}
	
	public List<Employee> list(PageModel page,int i) {
		String hqlcount="select count(*) from Employee where depart = '"+i+"'";
		long count=this.count(hqlcount);
		page.setCount(count);
		int pageCount=page.getPageCount();
		int start=(page.getPage()-1) * page.getPageSize();
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Employee> emp = null;
		emp = session.createQuery("from Employee where depart = '"+i+"'")
								.setFirstResult(start)
								.setMaxResults(page.getPageSize())
								.list();
		return emp;
	}

	public void delete(int ids) {
        Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=session.createQuery("delete Employee e where e.serialNumber='"+ids+"'");
		query.executeUpdate();
		session.getTransaction().commit();
	}

	public long count(String hql) {
		long count = 0;
		Session session=sessionFactory.openSession();
		session.beginTransaction();
			count = (Long)session.createQuery(hql).list().get(0);
			session.getTransaction().commit();
		return count;
	}

	public Employee update(int ids ,Employee employee) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Department dep=(Department)session.load(Department.class, ids);
		System.out.println(employee.getEdtid());
		employee.setDepart(dep);
		session.update(employee);
		session.getTransaction().commit();
		return employee;		
	}

	public Employee Load(int ids) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();	
		Employee emp=(Employee)session.load(Employee.class, ids);
		return emp;
	}

	@Override
	public Employee forwardadd() {
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			String sql="select e.serialNumber from Employee e left join Department d on e.edtid=d.id where e.serialNumber=?";
			emp=(Employee) session.createQuery(sql);
			return emp;
	}
	
	
	//以下是部门dao
	public List<Department> dep_listAll() {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Department> dep = null;
		dep = session.createQuery("from Department").list();
		return dep;
	}

}
