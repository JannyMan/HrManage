package com.whgghr.hrm.dao;

import java.util.Date;
import java.util.List;

import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Pay;

public interface PayDAO {
	public Pay show(int payid);
	
    public List<Pay> listAll();
	
	public List<Pay> list(PageModel page);
	
    public long count(String sql);
	
	public Pay add(Pay pay);
	
	public void delete(int payid);
	
	public List<Pay> list(PageModel page,String pay_month,String pay_name);
	
}
