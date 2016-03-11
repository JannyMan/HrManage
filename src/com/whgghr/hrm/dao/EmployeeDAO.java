package com.whgghr.hrm.dao;

import java.util.List;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;
import com.whgghr.hrm.model.po.Employee;

public interface EmployeeDAO {
	public List<Employee> listAll();
	
	public Employee add(Employee employee);

	public Employee show(int ids);

	public List<Employee> list(PageModel page);

	public void delete(int ids);

	public long count(String sql);

	public Employee update(int ids ,Employee employee);
	
	public Employee Load(int ids);
	
	public Employee forwardadd();
	
	public List<Department> dep_listAll();
}
