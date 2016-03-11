package com.whgghr.hrm.dao;

import java.util.List;
import com.whgghr.hrm.dao.util.PageModel;
import com.whgghr.hrm.model.po.Train;

public interface TrainDAO {
	public List<Train> listAll();
	
	public List<Train> list(PageModel page);
	
	public long count(String hql);
	
    public Train add(Train train);
	
	public void delete(int ids);
	
	public Train show(int ids);

}
