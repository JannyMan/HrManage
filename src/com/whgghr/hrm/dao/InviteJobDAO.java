package com.whgghr.hrm.dao;

import java.util.List;

import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.InviteJob;



public interface InviteJobDAO {
	
	public List<InviteJob> listAll();
	
	public List<InviteJob> list(PageModel page);
	
	public long count(String hql);
	
	public InviteJob add(InviteJob inviteJob);
	
	public InviteJob find(int id);
	
	public InviteJob modify(int id);
	
	public boolean del(int id);
	
}
