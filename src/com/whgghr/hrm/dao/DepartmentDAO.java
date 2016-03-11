package com.whgghr.hrm.dao;
import java.util.List;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Department;

public interface DepartmentDAO {
	public Department show(int ids);
	
	public List<Department> listAll();
	
	public List<Department> list(PageModel page);
	
    public long count(String sql);
	
	public Department add(Department department);
	
	public void delete(int ids);
	
	
}
