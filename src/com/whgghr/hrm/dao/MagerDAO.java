package com.whgghr.hrm.dao;

import java.sql.PreparedStatement;
import java.util.List;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Manager;

public interface MagerDAO {
	public Manager update(Manager manager);

	public List<Manager> listAll();

	public Manager show(int ids);

	public Manager load(int ids);

	public List<Manager> list(PageModel page);

	public Manager add(Manager manager);

	public void delete(int ids);

	public List<Manager> check(String account);
}
