package com.tech.blog.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	
	private static final SessionFactory sf;
	
	static 
	{
		try 
		{
			Configuration config = new Configuration().configure("hibernate.cfg.xml");
			sf = config.buildSessionFactory();
		} 
		catch (Exception ex)
		{
			System.err.println("Initial Session Factory creation failed" +ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
	public static SessionFactory getSessionFactory() {
		return sf;
	}

}
