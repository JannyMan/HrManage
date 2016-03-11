package com.whgghr.hrm.model.po;


import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class ExportDB {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Configuration cfg = new Configuration();
		cfg = cfg.configure();
		SessionFactory factory= cfg.buildSessionFactory();
		SchemaExport export=new SchemaExport(cfg);
		export.create(true,true);
		System.out.println("testSUCCESS!");
		
	}

}
