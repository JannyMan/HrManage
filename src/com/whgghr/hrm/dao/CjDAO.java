package com.whgghr.hrm.dao;

import java.util.List;

import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.CJ;

public interface CjDAO {
	public CJ show(int cjid);
	
	public List<CJ> listAll();
	
	public List<CJ> list(PageModel page);
	
    public long count(String sql);
	
	public CJ add(CJ cj);
	
	public void delete(int cjid);
	
	public List<CJ> find(PageModel page,String type);
}
